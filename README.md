# Dotfiles

These files describe the tools I use to work on my computer and their configurations.

To use these configuration files, first clone this repository anywhere with git, using:

```shell
git clone https://github.com/clementjumel/dotfiles.git ~/your/path/dotfiles/
```

For instance, on my machine, `~/your/path/dofiles/` is `~/Code/clementjumel/`.
Then, create a symlink from the home directory to the dotfiles directory, with:

```shell
ln -s ~/your/path/dotfiles/ ~/dotfiles/
```

For the following, you will need to go inside the `dotfiles/` directory, so run:

```shell
cd ~/your/path/dotfiles
```

## Neovim

I use [Neovim](https://neovim.io/) as my main code editor.
Its configuration is versioned in a dedicated
[repository](https://github.com/clementjumel/NvChad).

## HomeBrew

To manage most of my packages, I use [HomeBrew](https://brew.sh/).
The list of the packages I installed with brew can be seen in the `./Brewfile`.
Thanks to [mas](https://github.com/mas-cli/mas), this file also contains the few
packages I installed through the App Store.

To generate the `./Brewfile`, run `brew bundle dump`, and to install the packages, install mas if
needed (for instance with `brew install mas`), then run `brew bundle`.

## Karabiner

To modify the key bindings I use on my various keyboards, I use
[Karabiner-Elements](https://karabiner-elements.pqrs.org/).
This enables me to fix some keys in my non-Apple keyboard, as well as modify keys for all keyboards
(such as using the caps lock key as escape, and the escape key as caps lock).

Karabiner's configuration files are in `./.config/karabiner` and can be symlinked from
`~/.config/karabiner`.

## Iterm2

I don't use the default macOS terminal, but [Iterm2](https://iterm2.com/).
Iterm2 is a simple alternative to the default macOS terminal which provides many additional
features.

I set it up with the [Catppuccin color scheme](https://github.com/catppuccin/iterm) and the
`JetBrainsMono` [Nerd Font](https://www.nerdfonts.com/font-downloads).

## Oh-My-Zsh

I use [Oh-My-Zsh](https://ohmyz.sh) to customize my terminal prompt and define custom aliases.
To install it, follow the [installation guide](https://ohmyz.sh/#install).

Oh-My-Zsh's configuration files are `./.zshrc`, which can be symlinked from `~/.zshrc`, and in
`./oh-my-zsh/custom` (no need to symlink it).

The prompt theme I use is [powerlevel10k](https://github.com/romkatv/powerlevel10k).
To install it for Oh-My-Zsh, follow this
[installation guide](https://github.com/romkatv/powerlevel10k#oh-my-zsh).

powerlevel10k's configuration file is `./.p10k.zsh` and can be symlinked from `~/.p10k.zsh`.

## Tmux

To manage work sessions, split my terminal in windows and panes, I use
[Tmux](https://doc.ubuntu-fr.org/tmux).
To set it up, I followed this
[video](https://www.youtube.com/watch?v=DzNmUNvnB04&ab_channel=DreamsofCode).

Tmux's configuration file is `./.config/tmux/tmux.conf` and can be symlinked from
`~/.config/tmux/tmux.conf`.

## Git

Git is the version control system I use.

Git's configuration file is `./.gitconfig` and can can be symlinked from `~/.gitconfig`.

## PyCharm

**I switched to neovim as my code editor, I don't maintain this configuration anymore.**

I use to use [PyCharm](https://www.jetbrains.com/fr-fr/pycharm/) as my IDE.
I set it up with the [Catppuccin color scheme](https://github.com/catppuccin/jetbrains)
and, especially, the [IdeaVim plugin](https://plugins.jetbrains.com/plugin/164-ideavim) to
transform PyCharm into a vim-like editor.

PyCharm's configuration files are `./.ideavimrc` and in `./.config/pycharm/`,
and can be symlinked from `~/.ideavimrc` and `~/.config/pycharm/` respectively.
