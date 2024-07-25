alias bb='brew bundle'       # [B]undle: base command for Brewfile management
alias bbd='brew bundle dump' # [B]undle [D]ump: write the installed formulae & casks in a Brewfile

alias bc='brew cleanup' # [C]leanup: remove old versions of installed formulae & casks

alias bi='brew install'         # [I]nstall: install a formula or cask
alias bic='brew install --cask' # [I]nstall [C]ask: install a cask

alias bif='brew info' # [I]n[F]o: show information about a formula or cask

alias bl='brew list'            # [L]ist: list installed formulae & casks
alias blc='brew list --cask'    # [L]ist [C]ask: list installed casks
alias blf='brew list --formula' # [L]ist [F]ormula: list installed formulae

alias blv='brew leaves' # [L]ea[V]es: list installed formulae which are not the dependency of another one

alias bo='brew outdated'           # [O]utdated: list outdated formulae & casks
alias bog='brew outdated --greedy' # [O]utdated [G]reedy: list outdated formulae & casks, including casks with auto-updates or version "latest"

alias bp='brew pin' # [P]in: prevent a formula or cask from being upgraded

alias bud='brew update' # [U]p[D]ate: update Homebrew itself

alias bug='brew upgrade'           # [U]p[G]rade: update a target formula or cask or all of them
alias bugg='brew upgrade --greedy' # [U]p[G]rade [G]reedy: update a target formula or cask or all of them, including casks with auto-updates or version "latest"

alias bui='brew uninstall' # [U]n[I]nstall: uninstall a formula or cask

alias bup='brew unpin' # [U]n[P]in: allow a formula or cask to be upgraded
