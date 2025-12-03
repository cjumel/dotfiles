# Miscellaneous aliases for various non-builtin tools

# [[ GitHub ]]

alias ghi='gh issue'         # [G]it[H]ub [I]ssue: manage issues
alias ghic='gh issue create' # [G]it[H]ub [I]ssue [C]reate: create a new issue

alias ghp='gh pr'                 # [G]it[H]ub [P]R: manage pull requests
alias ghpc='gh pr create'         # [G]it[H]ub [P]R [C]reate: create a new pull request
alias ghpcb='gh pr create --base' # [G]it[H]ub [P]R [C]reate [B]ase: create a pull request with the specified base branch

# [[ Gitleaks ]]

alias glk='gitleaks git --verbose'  # [G]it[L]ea[K]s: detect secrets in a Git repository
alias glkd='gitleaks dir --verbose' # [G]it[L]ea[K]s [D]irectory: detect secrets in a directory

# [[ OpenCode ]]

alias oc='opencode'             # [O]pen[C]ode: open Opencode
alias occ='opencode --continue' # [O]pen[C]ode [C]ontinue: continue the last OpenCode session

# [[ TLDR ]]

alias tl='tldr' # [TL]dr: user-friendly & synthetic variant to the man pages

# [[ Neovim ]]

alias vi='nvim'                                             # N[VI]m: open Neovim
alias via='NVIM_ENABLE_ALL_PLUGINS=1 nvim'                  # N[VI]m [A]ll-plugins: open Neovim with all plugins enabled, for updating purposes
alias vic='nvim --clean'                                    # N[VI]m [C]lean: open Neovim without any custom configuration
alias vid='nvim -d'                                         # N[VI]m [D]iff: open Neovim in diff mode, to compare several files
alias vii='NVIM_ENABLE_ALL_PLUGINS=1 nvim +MasonInstallAll' # N[VI]m [I]nstall: open Neovim and install everything that needs to be installed

# [[ Zinit ]]

alias zid='zinit delete'       # [ZI]nit [D]elete: delete a plugin
alias zis='zinit status'       # [ZI]nit [S]tatus: show git status of plugins
alias zisu='zinit self-update' # [ZI]nit [S]elf-[U]pdate: update zinit itself
alias ziu='zinit update'       # [ZI]nit [U]pdate: update a plugin (all by default)
