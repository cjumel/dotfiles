# Initialize zoxide
# `--cmd cd` will make zoxide automatically use `cd` & `cdi`
eval "$(zoxide init --cmd cd zsh)"

# `c` is globally aliased to `cd`
# Let's alias `ci` to `cdi` but only when using zoxide
alias ci='cdi'
