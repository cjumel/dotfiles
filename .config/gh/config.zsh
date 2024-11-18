# By default, GitHub suggests to use the `eval $(gh alias --shell zsh)` command to set up Copilot in Zsh configuration. However, this makes
# terminal startup a lot (lot) slower, so I prefer to put it in inside a function which I can call manually to enable Copilot. The Copilot
# setup makes available two terminal aliases (among other things):
# - `ghce` to ask Copilot to explain something
# - `ghcs` to ask Copilot to suggest something

function github_copilot_activate() {
    eval "$(gh copilot alias -- zsh)"
}
alias ghca='github_copilot_activate'
