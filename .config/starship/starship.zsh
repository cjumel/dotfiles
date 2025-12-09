# Change starship configuration file location
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Fix undesired new line at top top of terminal when entering or clearing it with `add_new_line = true` (source: https://github.com/starship/starship/issues/560)
# shellcheck disable=SC1009,SC1056,SC1072,SC1073,SC1083
precmd() { precmd() { echo "" } }
alias clear="precmd() { precmd() { echo } } && clear"

# Initialize starship
eval "$(starship init zsh)"
