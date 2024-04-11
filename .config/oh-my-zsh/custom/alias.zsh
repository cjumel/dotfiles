# List all aliases starting with the prefix passed as argument using grep
function alias_grep_list() {
    alias | grep "^$1"
}

# Builtin alias command aliases; useful as they list all aliases, even those defined outside of the `~/.config` directory
alias alb='alias'            # List all aliases if no argument, or show an alias definition, or define a new alias (builtin alias command)
alias albl='alias_grep_list' # List all aliases starting with the prefix passed as argument using the builtin alias command
