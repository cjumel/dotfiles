# Dotfiles

To use these dotfiles, clone this repository in your home folder.

```shell
cd ~
git clone https://github.com/clementjumel/dotfiles.git
```

## Pycharm

I use [Pycharm](https://www.jetbrains.com/fr-fr/pycharm/) as my main IDE, to code with Python.
I defined a bunch of custom keymaps, which are versioned in `.config/pycharm/keymaps`.

To do so, I changed Pycharm configuration and plugins path in `Pycharm -> Help -> Edit Custom Properties...`:

```
idea.config.path=${user.home}/.config/pycharm
idea.plugins.path=${idea.config.path}/plugins
```

Then, I created a symlink to the dotfiles directory with the command:

```
ln -s ~/dotfiles/.config/pycharm/keymaps/ ~/.config/pycharm/keymaps/
```

## neovim

In addition to my main IDE, I use
[neovim](https://neovim.io/) with the configuration provided by [NvChad](https://nvchad.com/)
as a secondary code editor.
To set it up, I followed this
[Youtube video](https://www.youtube.com/watch?v=Mtgo-nP_r8Y&ab_channel=DreamsofCode).

## Tmux

To leverage new features when using my terminal, I use [Tmux](https://doc.ubuntu-fr.org/tmux).
To set it up, I followed this
[Youtube video](https://www.youtube.com/watch?v=DzNmUNvnB04&ab_channel=DreamsofCode).

## Iterm2

In order to make both neovim and Tmux custom configurations work, I had to switch to the
[Iterm2](https://iterm2.com/) terminal, which I also set up with the
[catppuccin color scheme](https://github.com/catppuccin/iterm), as for neovim and Tmux.

## Git

To use the custom git configuration, simply create a symlink from `~/.gitconfig` to the
`~/dotfiles/.gitconfig` file using:

```shell
rm -f ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

Then you might need to update the `~/dotfiles/.gitconfig` file, depending on your installation.

## Oh-my-zsh

To use oh-my-zsh, first install it following the [standard method](https://ohmyz.sh/#install).

To use the custom theme, prompt and aliases, simply create a symlink from `~/.zshrc` to the
`~/dotfiles/.zshrc` file using:

```shell
rm -f ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

Then you might need to update the `~/dotfiles/.zshrc` file, depending on your installation.

## Brewfile

The file `~/dotfiles/Brewfile` contains a list of the packages installed with
[brew](https://brew.sh/) or the AppStore, thanks to [mas](https://github.com/mas-cli/mas).
To install the packages, simply run in the folder `~/dotfiles`:

```shell
brew bundle
```

To regenerate the `Brewfile`, simply run in the folder `~/dotfiles`:

```shell
rm -f Brewfile
brew bundle dump
```
