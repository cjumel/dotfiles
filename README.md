# Dotfiles

To use these dotfiles, simply clone this repository in your home folder, and run the
installation script:

```shell
cd ~
git clone https://github.com/clementjumel/dotfiles.git
cd ~/dotfiles
install.sh
```

Alternatively, below is a description on how to use each individual feature.

## Git

To use the git configuration, simply copy the content of the `.gitconfig` file in your
`~/.gitconfig` file, using:

```shell
cp ~/dotfiles/.gitconfig ~/.gitconfig
```

Alternatively, you can create a symlink from `~/.gitconfig` to the `.gitconfig` file using:

```shell
rm ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

## Oh-my-zsh

To use oh-my-zsh, first install it following the [standard method](https://ohmyz.sh/#install).

### Custom theme and prompt

To use the custom theme and prompt, simply copy the content of the `.zshrc` file in the
`~/.zshrc` file, using:

```shell
cp ~/dotfiles/.zshrc ~/.zshrc
```

Alternatively, you can create a symlink from `~/.zshrc` to the `.zshrc` file using:

```shell
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

### Custom aliases

To use the custom aliases, simply copy the content of the `.oh-my-zsh/custom` folder in the
`~/oh-my-zsh/custom` folder, using:

```shell
cp -r ~/dotfiles/.oh-my-zsh/custom ~/oh-my-zsh/custom
```

Alternatively, you can create a symlink from `~/oh-my-zsh/custom` to the `.oh-my-zsh/custom`
folder using:

```shell
rm -r ~/.oh-my-zsh/custom
ln -s ~/dotfiles/.oh-my-zsh/custom ~/.oh-my-zsh/custom
```
