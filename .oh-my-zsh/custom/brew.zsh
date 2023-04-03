alias b='brew'
alias bb='brew bundle'
alias bbd='brew bundle dump'
alias bbddot='
    cd ~/dotfiles
    rm -f Brewfile
    brew bundle dump
    echo "Brewfile written successfully in ~/dotfiles!"
    1
'
alias bi='brew install'
alias bif='brew info'
alias bls='brew list'
alias bui='brew uninstall'
alias bup='
    brew update
    brew upgrade
    brew upgrade --cask --greedy
    brew cleanup
    brew cleanup -s
    echo "Brew Formulae and Casks updated successfully!"
'
