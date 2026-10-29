import { Plugin } from "@opencode/plugin/tui"
import { createEffect } from "solid-js"

type PaneState = "idle" | "working" | "waiting" | "done"
type TabState = { executing: boolean; completed: boolean; acknowledgedAt: number; state?: PaneState; changedAt: number }

const pane = process.env.TMUX_PANE
const channel = pane ? `opencode-tabs-${pane}` : undefined

function tmux(args: string[]) {
  if (!pane || typeof Bun === "undefined") return
  try {
    Bun.spawn(["tmux", ...args], { stdin: "ignore", stdout: "ignore", stderr: "ignore" })
  } catch {
    // OpenCode may run outside tmux.
  }
}

async function tmuxOutput(args: string[]) {
  if (!pane || typeof Bun === "undefined") return ""
  try {
    const process = Bun.spawn(["tmux", ...args], { stdin: "ignore", stdout: "pipe", stderr: "ignore" })
    const output = await new Response(process.stdout).text()
    await process.exited
    return output.trim()
  } catch {
    return ""
  }
}

function tmuxCommands(commands: string[][]) {
  tmux(commands.flatMap((command, index) => index === 0 ? command : [";", ...command]))
}

function clearOptions() {
  if (!pane) return
  tmuxCommands([
    ...[
      "@opencode-active", "@opencode-tabs", "@opencode-select-session", "@opencode-acknowledge",
      "@opencode-session-id", "@opencode-title", "@opencode-directory", "@opencode-state", "@opencode-state-changed-at",
    ].map((name) => ["set-option", "-p", "-u", "-t", pane, name]),
    ["refresh-client", "-S"],
  ])
}

export default Plugin.define({
  id: "local.tmux-picker",
  setup(context) {
    if (!pane || !channel) return
    tmuxCommands(["@opencode-session-id", "@opencode-title", "@opencode-directory", "@opencode-state", "@opencode-state-changed-at"].map(
      (name) => ["set-option", "-p", "-u", "-t", pane, name],
    ))

    const tabs = new Map<string, TabState>()
    let selectedSession: string | undefined
    let publishing = false
    let listening = true
    let disposed = false
    let placeholderChangedAt = Date.now()
    let hadTabs = false

    const currentSessionID = () => {
      const route = context.ui.router.current()
      return route.type === "session" ? route.sessionID : undefined
    }

    const tabIDs = () => {
      const current = currentSessionID()
      const ids = context.ui.tabs.enabled()
        ? context.ui.tabs.list().map((tab) => typeof tab === "string" ? tab : tab.sessionID)
        : []
      return [...new Set([...ids, ...(current ? [current] : [])])]
    }

    const stateFor = (sessionID: string) => {
      const tab = tabs.get(sessionID) ?? { executing: false, completed: false, acknowledgedAt: 0, changedAt: Date.now() }
      const session = context.data.session.get(sessionID)
      const status = context.data.session.status(sessionID)
      const busy = tab.executing || status === "running"
      const permissions = context.data.session.permission.list(sessionID) ?? []
      const forms = context.data.session.form.list(sessionID, session?.location ?? context.location) ?? []
      if (busy) tab.completed = false
      const idleAt = session?.time?.idle ?? 0
      const viewedAt = Math.max(session?.time?.viewed ?? 0, tab.acknowledgedAt)
      const state: PaneState = permissions.length > 0 || forms.length > 0 ? "waiting" : busy ? "working" : tab.completed || idleAt > viewedAt ? "done" : "idle"
      if (tab.state !== state) tab.changedAt = Date.now()
      tab.state = state
      tabs.set(sessionID, tab)
      return tab
    }

    const publish = () => {
      if (disposed || publishing) return
      publishing = true
      queueMicrotask(() => {
        publishing = false
        if (disposed) return
        const current = currentSessionID()
        if (current !== selectedSession) {
          if (current) void markViewed(current)
          selectedSession = current
        }

        const ids = tabIDs()
        for (const id of tabs.keys()) if (!ids.includes(id)) tabs.delete(id)
        if (ids.length === 0 && hadTabs) placeholderChangedAt = Date.now()
        hadTabs = ids.length > 0
        const entries = ids.length === 0
          ? [{ sessionID: null, state: "idle" as const, title: "OpenCode", directory: context.location?.directory ?? process.cwd(), changedAt: placeholderChangedAt }]
          : ids.map((sessionID) => {
            const session = context.data.session.get(sessionID)
            const tab = stateFor(sessionID)
            return {
              sessionID,
              state: tab.state!,
              title: (session?.title || "Untitled session").replace(/[\r\n\t]/g, " "),
              directory: (session?.location?.directory ?? context.location?.directory ?? process.cwd()).replace(/[\r\n\t]/g, " "),
              changedAt: tab.changedAt,
            }
          })

        tmuxCommands([
          ["set-option", "-p", "-t", pane, "@opencode-active", "1"],
          ["set-option", "-p", "-t", pane, "@opencode-tabs", JSON.stringify(entries)],
          ["refresh-client", "-S"],
        ])
      })
    }

    const sessionID = (event: { data?: { sessionID?: string } }) => event.data?.sessionID
    const update = (event: { data?: { sessionID?: string } }, change: (tab: TabState) => void) => {
      const id = sessionID(event)
      if (!id) return publish()
      const tab = tabs.get(id) ?? { executing: false, completed: false, acknowledgedAt: 0, changedAt: Date.now() }
      change(tab)
      tabs.set(id, tab)
      publish()
    }

    const markViewed = async (sessionID: string) => {
      if (disposed) return
      const tab = tabs.get(sessionID) ?? { executing: false, completed: false, acknowledgedAt: 0, changedAt: Date.now() }
      tab.completed = false
      tab.acknowledgedAt = Date.now()
      tabs.set(sessionID, tab)
      try {
        await context.client.session.view({ sessionID, idle: context.data.session.get(sessionID)?.time?.idle ?? Date.now() })
      } catch {
        // The local timestamp still prevents a viewed tab from remaining DONE.
      }
      if (!disposed) publish()
    }

    const listenForSelection = async () => {
      while (listening) {
        const process = Bun.spawn(["tmux", "wait-for", channel], { stdin: "ignore", stdout: "ignore", stderr: "ignore" })
        await process.exited
        if (!listening) break

        const requested = await tmuxOutput(["show-options", "-p", "-v", "-t", pane, "@opencode-select-session"])
        const acknowledge = await tmuxOutput(["show-options", "-p", "-v", "-t", pane, "@opencode-acknowledge"])
        if (requested) {
          context.ui.tabs.focus(requested)
          tmux(["set-option", "-p", "-u", "-t", pane, "@opencode-select-session"])
        }
        if (acknowledge && currentSessionID()) {
          void markViewed(currentSessionID()!)
          tmux(["set-option", "-p", "-u", "-t", pane, "@opencode-acknowledge"])
        }
        publish()
      }
    }

    const stop = [
      context.data.on("session.execution.started", (event) => update(event, (tab) => { tab.executing = true; tab.completed = false })),
      ...(["session.execution.succeeded", "session.execution.failed", "session.execution.interrupted", "session.idle"] as const).map((type) =>
        context.data.on(type, (event) => update(event, (tab) => { tab.executing = false; tab.completed = true })),
      ),
      ...(["session.status", "session.renamed", "permission.asked", "permission.replied", "form.created", "form.replied", "form.cancelled"] as const).map(
        (type) => context.data.on(type, () => publish()),
      ),
    ]

    const stopRouteObserver = context.ui.slot({
      append: "app",
      render: () => {
        createEffect(() => {
          context.ui.router.current()
          context.ui.tabs.list()
          publish()
        })
        return null
      },
    })
    void listenForSelection()
    publish()
    return () => {
      disposed = true
      listening = false
      stop.forEach((unsubscribe) => unsubscribe())
      stopRouteObserver()
      tmux(["wait-for", "-S", channel])
      clearOptions()
    }
  },
})
