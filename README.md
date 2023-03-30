# Dotfiles

To use these dotfiles, first, simply clone this repository in your home folder.

```shell
cd ~
git clone https://github.com/clementjumel/dotfiles.git
```

Then, run the installation script:

```shell
cd ~/dotfiles
sh install.sh
```

This will link the `~/.zshrc` and `~/.gitconfig` files to the `~/dotfiles/.zshrc` and
`~/dotfiles/.gitconfig` files, respectively.
Therefore, you'll simply need to update the `~/dotfiles/.zshrc` and `~/dotfiles/.gitconfig` files
depending on your own installation.

Below is a description of each individual feature.

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
