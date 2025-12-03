# Brew: the missing package manager for MacOS

alias bra='brew autoremove' # [BR]ew [A]utoremove: uninstall formulae that were only installed as a dependency of another formula and are now no longer needed

alias brc='brew cleanup' # [BR]ew [C]leanup: remove stale lock files and outdated downloads for all formulae and casks, and remove old versions of installed formulae and casks

alias bri='brew install'         # [BR]ew [I]nstall: install a formula or cask
alias bric='brew install --cask' # [BR]ew [I]nstall [C]ask: install a cask

alias brif='brew info' # [BR]ew [I]n[F]o: display brief statistics for your Homebrew installation

alias brl='brew list'            # [BR]ew [L]ist: list all installed formulae and casks
alias brlc='brew list --cask'    # [BR]ew [L]ist [C]ask: list all installed casks
alias brlf='brew list --formula' # [BR]ew [L]ist [F]ormula: list all installed formulae

alias brlv='brew leaves' # [BR]ew [L]ea[V]es: list installed formulae that are not dependencies of another installed formula or cask

alias bro='brew outdated'           # [BR]ew [O]utdated: list installed casks and formulae that have an updated version available
alias brog='brew outdated --greedy' # [BR]ew [O]utdated [G]reedy: list installed casks and formulae that have an updated version available, including casks with auto-updates or version "latest"

alias brp='brew pin' # [BR]ew [P]in: pin the specified formula, preventing them from being upgraded when issuing the `brew upgrade` formula command

alias brr='brew reinstall' # [BR]ew [R]einstall: uninstall and then reinstall a formula or cask using the same options it was originally installed with, plus··

alias brs='brew search'            # [BR]ew [S]earch: perform a substring search of cask tokens and formula names for text
alias brsc='brew search --cask'    # [BR]ew [S]earch [C]ask: perform a substring search of cask tokens for text
alias brsf='brew search --formula' # [BR]ew [S]earch [F]ormula: perform a substring search of formula names for text

alias brsv='brew services'         # [BR]ew [S]er[V]ices: manage background services
alias brsvl='brew services list'   # [BR]ew [S]er[V]ices [L]ist: list all available services
alias brsvsa='brew services start' # [BR]ew [S]er[V]ices [S]t[A]rt: start a service
alias brsvso='brew services stop'  # [BR]ew [S]er[V]ices [S]t[O]p: stop a service

alias brud='brew update' # [BR]ew [U]p[D]ate: fetch the newest version of Homebrew and all formulae

alias brug='brew upgrade'           # [BR]ew [U]p[G]rade: upgrade outdated casks and outdated, unpinned formulae using the same options they were originally installed with
alias brugg='brew upgrade --greedy' # [BR]ew [U]p[G]rade [G]reedy: upgrade outdated casks (including those with auto-updates or version "latest") and outdated, unpinned formulae using the same options they were originally installed with

alias brui='brew uninstall' # [BR]ew [U]n[I]nstall: uninstall a formula or cask

alias brup='brew unpin' # [BR]ew [U]n[P]in: unpin formula, allowing them to be upgraded by `brew upgrade` formula
