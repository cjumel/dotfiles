#!/bin/sh
set -eu

tmux_bin=${TMUX_BIN:-tmux}

panes() {
    format=$(printf '#{pane_id}\t#{session_name}:#{window_index}.#{pane_index}\t#{pane_current_command}\t#{@opencode-active}\t#{@opencode-tabs}')
    "$tmux_bin" list-panes -a -F "$format" | awk -F "$(printf '\t')" '$3 == "opencode" && $4 == "1" && $5 != ""'
}

tabs() {
    panes | while IFS="$(printf '\t')" read -r pane location _ _ inventory; do
        printf '%s' "$inventory" | jq -r --arg pane "$pane" --arg location "$location" \
            '.[] | [$pane, $location, .state, .title, .directory, (.changedAt | tostring), (.sessionID // "")] | @tsv' 2>/dev/null || true
    done
}

signal() {
    pane=${1:?pane ID is required}
    "$tmux_bin" wait-for -S "opencode-tabs-${pane}"
}

acknowledge() {
    pane=${1:?pane ID is required}
    metadata=$("$tmux_bin" display-message -p -t "$pane" '#{pane_current_command}\t#{@opencode-active}')
    [ "$metadata" = "opencode\t1" ] || return 0
    "$tmux_bin" set-option -p -t "$pane" @opencode-acknowledge 1
    signal "$pane"
}

list() {
    if ! command -v jq >/dev/null 2>&1; then
        echo "opencode-panes.sh requires jq" >&2
        exit 1
    fi
    tabs |
        awk -F "$(printf '\t')" '
      function rank(state) { return state == "waiting" ? 0 : state == "done" ? 1 : state == "working" ? 2 : state == "idle" ? 3 : 4 }
      function label(state) { return state == "waiting" ? "PENDING" : toupper(state) }
      function truncate(value, width) { return length(value) > width ? substr(value, 1, width - 1) "…" : value }
      {
        project = $5
        if (index(project, ENVIRON["HOME"] "/") == 1) project = "~" substr(project, length(ENVIRON["HOME"]) + 1)
        printf "%d\t%s\t%s\t%s\t[%s]\t%-38s\t%-26s\t%s\t%s\t%s\n", rank($3), $6, tolower($4), $2, label($3), truncate($4, 38), truncate(project, 26), $2, $1, $7
      }
    ' |
        sort -t "$(printf '\t')" -k1,1n -k2,2nr -f -k3,3 -k4,4 |
        awk -F "$(printf '\t')" '{ printf "%s\t%s\t%s\t%s\t%s\t%s\n", $5, $6, $7, $8, $9, $10 }' |
        fzf --layout=reverse --no-sort --prompt ' OpenCode tabs > ' \
            --delimiter '\t' --with-nth=1,2,3,4 \
            --bind 'enter:execute-silent(~/.config/tmux/scripts/opencode-panes.sh select {5} {6})+abort'
}

status() {
    command -v jq >/dev/null 2>&1 || return 0
    counts=$(tabs | awk -F "$(printf '\t')" '
      { count[$3]++ }
      END { for (state in count) print state "\t" count[state] }
    ')
    [ -n "$counts" ] || return 0

    printf ' '
    first=true
    for state in idle working "done" waiting; do
        count=$(printf '%s\n' "$counts" | awk -F "$(printf '\t')" -v state="$state" '$1 == state { print $2 }')
        [ -n "$count" ] || continue
        case $state in
        waiting) color=yellow label=P ;;
        done) color=green label=D ;;
        working) color=blue label=W ;;
        idle) color=colour245 label=I ;;
        esac
        if "$first"; then
            printf '  #[fg=%s]%s:%s' "$color" "$label" "$count"
            first=false
        else
            printf '·#[fg=%s]%s:%s' "$color" "$label" "$count"
        fi
    done
}

select_tab() {
    pane=${1:?pane ID is required}
    selected=${2:-}
    session=$("$tmux_bin" display-message -p -t "$pane" '#{session_id}')
    [ -n "$selected" ] && "$tmux_bin" set-option -p -t "$pane" @opencode-select-session "$selected"
    "$tmux_bin" switch-client -t "$session"
    "$tmux_bin" select-window -t "$pane"
    "$tmux_bin" select-pane -t "$pane"
    signal "$pane"
}

case ${1:-} in
list) list ;;
acknowledge) acknowledge "${2:-}" ;;
select) select_tab "${2:-}" "${3:-}" ;;
status) status ;;
*)
    echo "usage: ${0##*/} {list|status|acknowledge PANE|select PANE [SESSION]}" >&2
    exit 2
    ;;
esac
