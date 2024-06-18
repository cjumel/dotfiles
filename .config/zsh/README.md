# [Zsh](https://www.zsh.org/)

`zsh` has become the default shell for MacOS, and, as such, my shell of choice, and it fits my needs
perfectly. For quite some time, I've used it with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh), a
great `zsh` framework, providing sane defaults and a basic plugin manager. However, `oh-my-zsh` is a
bit bloated and not very fast, and it does a lot of stuff under the hood. Hence, to really
understand my configuration and make it leaner, I stopped using it to favor manual settings and
plugins managed by [zinit](https://github.com/zdharma-continuum/zinit).

My `zsh` configuration is first and foremost defined in the `.zshrc` file at the root of this
repository, but this file also sources several files in the `.config/zsh/` directory for general
`zsh` configuration, aliases or plugins, and also in `.zsh` files defined in the various tools I
use, to set them up.
