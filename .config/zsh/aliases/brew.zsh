# [B][R]ew: the missing package manager for MacOS

alias brb='brew bundle'       # [B]undle: base command for Brewfile management
alias brbd='brew bundle dump' # [B]undle [D]ump: write the installed formulae & casks in a Brewfile

alias brc='brew cleanup' # [C]leanup: remove old versions of installed formulae & casks

alias bri='brew install'         # [I]nstall: install a formula or cask
alias bric='brew install --cask' # [I]nstall [C]ask: install a cask

alias brif='brew info' # [I]n[F]o: show information about a formula or cask

alias brl='brew list'            # [L]ist: list installed formulae & casks
alias brlc='brew list --cask'    # [L]ist [C]ask: list installed casks
alias brlf='brew list --formula' # [L]ist [F]ormula: list installed formulae

alias brlv='brew leaves' # [L]ea[V]es: list installed formulae which are not the dependency of another one

alias bro='brew outdated'           # [O]utdated: list outdated formulae & casks
alias brog='brew outdated --greedy' # [O]utdated [G]reedy: list outdated formulae & casks, including casks with auto-updates or version "latest"

alias brp='brew pin' # [P]in: prevent a formula or cask from being upgraded

alias brud='brew update' # [U]p[D]ate: update Homebrew itself

alias brug='brew upgrade'           # [U]p[G]rade: update a target formula or cask or all of them
alias brugg='brew upgrade --greedy' # [U]p[G]rade [G]reedy: update a target formula or cask or all of them, including casks with auto-updates or version "latest"

alias brui='brew uninstall' # [U]n[I]nstall: uninstall a formula or cask

alias brup='brew unpin' # [U]n[P]in: allow a formula or cask to be upgraded
