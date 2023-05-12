# Dotfiles

These files describe the tools I use to work on my computer and their configurations.
In the following, I will describe briefly what they do and how to set them up.

To use these dotfiles, first clone this repository in your home directory with git, using the
command:

```shell
git clone https://github.com/clementjumel/dotfiles.git ~/dotfiles/
```

## Package Management System

To manage most of my packages, being a user of macOS, I use [HomeBrew](https://brew.sh/).
HomeBrew is a package management system for macOS, which provides a unified way of installing
and updating almost all the packages I use.

The list of the packages I installed with brew is versioned in the file `./Brewfile`.
Thanks to [mas](https://github.com/mas-cli/mas), this file also contains the few
packages I installed through the App Store.
To install these packages, make sure mas is installed (for instance by running `brew install mas`)
and run:

```shell
cd ~/dotfiles/
brew bundle
```

To regenerate the `./Brewfile`, run:

```shell
cd ~/dotfiles/
rm -f Brewfile
brew bundle dump
```

In the following, if not stated otherwise, the tools I will describe should be installable with
HomeBrew.

## Terminal

### Iterm2

I don't use the default macOS terminal, but [Iterm2](https://iterm2.com/).
Iterm2 is a simple alternative to the default macOS terminal which provides many additional
features.

I set it up with the [Catppuccin color scheme](https://github.com/catppuccin/iterm) and the
`JetBrainsMono` [Nerd Font](https://www.nerdfonts.com/font-downloads).

### Oh My Zsh

I use [Oh My Zsh](https://ohmyz.sh) to customize my terminal prompt and define custom aliases.

To install it, follow the [installation guide](https://ohmyz.sh/#install).
To use my custom configuration, create a symlink from `~/.zshrc` to the `~/dotfiles/.zshrc` file
using:

```shell
rm -f ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

The prompt theme I use is [powerlevel10k](https://github.com/romkatv/powerlevel10k).
To install it for Oh My Zsh, follow this
[installation guide](https://github.com/romkatv/powerlevel10k#oh-my-zsh).
To use my custom configuration, create a symlink from `~/.p10k.zsh` to the `~/dotfiles/.p10k.zsh`
file using:

```shell
rm -f ~/.p10k.zsh
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
```

### Tmux

To manage work sessions, split my terminal in windows and panes, I use
[Tmux](https://doc.ubuntu-fr.org/tmux).

To set it up, I followed this
[video](https://www.youtube.com/watch?v=DzNmUNvnB04&ab_channel=DreamsofCode).
To use my custom configuration, create a symlink from `~/.config/tmux/tmux.conf` to the
`~/dotfiles/.config/tmux/tmux.conf` file using:

```shell
rm -f ~/.config/tmux/tmux.conf
ln -s ~/dotfiles/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

### neovim

I use [neovim](https://neovim.io/) as a lightweight code editor which can be accessed through
the terminal.
I set it up with the configuration provided by [NvChad](https://nvchad.com/).

To do so, I followed this
[video](https://www.youtube.com/watch?v=Mtgo-nP_r8Y&ab_channel=DreamsofCode).
More information on how to set up neovim with NvChad is available in the
[features documentation](https://nvchad.com/docs/features) or in the
[example configuration](https://github.com/NvChad/example_config) of NvChad.
To use my custom configuration, create a symlink from `~/.config/nvim` to the
`~/dotfiles/.config/nvim` directory using:

```shell
rm -rf ~/.config/nvim
ln -s ~/dotfiles/.config/nvim/ ~/.config/nvim/
```

### Git

Git is the only version control system I use.

To use my custom configuration, create a symlink from `~/.gitconfig` to the
`~/dotfiles/.gitconfig` file using:

```shell
rm -f ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

## IDE

I use [PyCharm](https://www.jetbrains.com/fr-fr/pycharm/) as my IDE.

I set up some custom keymaps to use it more efficiently.
To use them, change PyCharm's configuration and plugins paths directly in PyCharm, by clicking:
`Pycharm -> Help -> Edit Custom Properties...`, and set:

```shell
idea.config.path=${user.home}/.config/pycharm
idea.plugins.path=${idea.config.path}/plugins
```

Then, create a symlink from `~/.config/pycharm/keymaps` to the
`~/dotfiles/.config/pycharm/keymaps` directory using:

```shell
rm -rf ~/.config/pycharm/keymaps/
ln -s ~/dotfiles/.config/pycharm/keymaps/ ~/.config/pycharm/keymaps/
```

I also set PyCharm up with the [Catppuccin color scheme](https://github.com/catppuccin/jetbrains)
and the [IdeaVim plugin](https://plugins.jetbrains.com/plugin/164-ideavim).
To use my custom configuration, create a symlink from `~/.ideavimrc` to the
`~/dotfiles/.ideavimrc` file using:

```shell
rm -f ~/.ideavimrc
ln -s ~/dotfiles/.ideavimrc /.ideavimrc
```
