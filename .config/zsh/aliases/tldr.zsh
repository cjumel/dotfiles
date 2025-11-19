# [TL]dr: user-friendly & synthetic variant to the man pages

function tldr_alias() {
    alias_definition=$(alias "$1") # Of the form "l=ls" or "l='ls'" (without the surrounding double quotes)
    alias_length=${#1}             # Length of the alias itself (e.g. 1 for "l=ls")

    alias_content="${alias_definition:$alias_length+1}" # Remove the alias definition prefix (e.g. "l=")
    alias_content="${alias_content%\'}"                 # Remove the trailing single quote if any
    alias_content="${alias_content#\'}"                 # Remove the leading single quote if any

    tldr $=alias_content # Perform word splitting on the alias content when passing it to `tldr`
}

alias tl='tldr'        # [TL]dr: user-friendly & synthetic variant to the man pages
alias tla='tldr_alias' # [TL]dr [A]lias: call the tldr page on the content of an alias
