# [BR]ew: the missing package manager for MacOS

alias brc='brew cleanup' # [BR]ew [C]leanup: remove old versions of installed formulae & casks

alias bri='brew install'         # [BR]ew [I]nstall: install a formula or cask
alias bric='brew install --cask' # [BR]ew [I]nstall [C]ask: install a cask

alias brif='brew info' # [BR]ew [I]n[F]o: show information about a formula or cask

alias brl='brew list'            # [BR]ew [L]ist: list installed formulae & casks
alias brlc='brew list --cask'    # [BR]ew [L]ist [C]ask: list installed casks
alias brlf='brew list --formula' # [BR]ew [L]ist [F]ormula: list installed formulae

alias brlv='brew leaves' # [BR]ew [L]ea[V]es: list installed formulae which are not the dependency of another one

alias bro='brew outdated'           # [BR]ew [O]utdated: list outdated formulae & casks
alias brog='brew outdated --greedy' # [BR]ew [O]utdated [G]reedy: list outdated formulae & casks, including casks with auto-updates or version "latest"

alias brp='brew pin' # [BR]ew [P]in: prevent a formula or cask from being upgraded

alias brs='brew services'         # [BR]ew [S]ervices: manage background services with Homebrew
alias brsl='brew services list'   # [BR]ew [S]ervices [L]ist: list all services managed by Homebrew
alias brssa='brew services start' # [BR]ew [S]ervices [S]t[A]rt: start a service managed by Homebrew
alias brsso='brew services stop'  # [BR]ew [S]ervices [S]t[O]p: stop a service managed by Homebrew

alias brud='brew update' # [BR]ew [U]p[D]ate: update Homebrew itself

alias brug='brew upgrade'           # [BR]ew [U]p[G]rade: update a target formula or cask or all of them
alias brugg='brew upgrade --greedy' # [BR]ew [U]p[G]rade [G]reedy: update a target formula or cask or all of them, including casks with auto-updates or version "latest"

alias brui='brew uninstall' # [BR]ew [U]n[I]nstall: uninstall a formula or cask

alias brup='brew unpin' # [BR]ew [U]n[P]in: allow a formula or cask to be upgraded
