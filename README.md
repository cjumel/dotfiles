# Dotfiles

These files describe the tools I use to work on my computer and their configurations. To use these
configuration files, clone this repository anywhere with Git, to a path of your choice:

```shell
git clone https://github.com/clementjumel/dotfiles.git <path/to/this/repository>
```

For instance, on my machine, `<path/to/this/repository>` is `~/Code/clementjumel/dotfiles/`.

On my machine (a Macbook), I use [Homebrew](https://brew.sh/) to manage my packages. The list of the
packages I installed with brew can be seen in the `./Brewfile`. Thanks to
[mas](https://github.com/mas-cli/mas), this file also contains the few packages I installed through
the App Store.

To generate the `./Brewfile`, run `brew bundle dump`, and to install all the packages, install mas
if needed (for instance with `brew install mas`), then run `brew bundle`.

## General Tools

### Karabiner

To modify the keys I use on my keyboards, I use
[Karabiner-Elements](https://karabiner-elements.pqrs.org/). This enables me to fix some keys in my
non-Apple keyboard for instance, as well as modify keys for all keyboards (such as using the caps
lock key as escape, and the escape key as caps lock).

**Install:**

```shell
# For MacOS:
brew install --cask karabiner-elements

ln -s <path/to/this/repository>/.config/karabiner ~/.config/karabiner
```

As mentionned [here](https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/),
the whole configuration directory needs to be symlinked, not individual files and sub-directories.

### Iterm2

I don't use the default macOS terminal, which didn't work for me with some features, but
[Iterm2](https://iterm2.com/). Iterm2 is a simple alternative to the default macOS terminal, it
provides many additional features. I set it up with the
[Catppuccin color scheme](https://github.com/catppuccin/iterm) and the `JetBrainsMono`
[Nerd Font](https://www.nerdfonts.com/font-downloads).

**Install:**

```shell
# For MacOS:
brew install --cask iterm2
```

Then follow the standard installation guides to install the Catppuccin colorscheme & the
JetBrainsMono Nerd Fond.

## Terminal Tools

### Git

Git is the version control system I use. Along with Git, I use pre-commit to perform various checks
before each commit.

**Install:**

```shell
# For MacOS:
brew install git
brew install pre-commit
# For Ubuntu:
sudo apt install git
sudo apt install pre-commit

# For regular version:
ln -s <path/to/this/repository>/.gitconfig ~/.gitconfig
# or, for a remote version (without user/OS-specific configurations):
# ln -s <path/to/this/repository>/.gitconfig.remote ~/.gitconfig
```

### Zsh, Oh-My-Zsh & powerlevel10k

I use Zsh as terminal shell, which I set up with [Oh-My-Zsh](https://ohmyz.sh) to define custom
aliases and introduce some plugins, and [powerlevel10k](https://github.com/romkatv/powerlevel10k) to
customize the terminal prompt.

**Requirements:**

- `curl` or `wget`
- `git`

**Install:**

```shell
## Zsh

# No need for MacOS, for Ubuntu:
sudo apt install zsh

# If needed, a backup of the zsh configuration file can be done:
mv ~/.zshrc ~/.zshrc.old

ln -s <path/to/this/repository>/.zshrc ~/.zshrc

## Oh-my-zsh

# See https://ohmyz.sh/#install
# oh-my-zsh gets installed in ~/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or: sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

ln -s <path/to/this/repository>/.config/oh-my-zsh ~/.config/oh-my-zsh

# To also include user/OS-specific aliases:
cp <path/to/this/repository>/.config/oh-my-zsh/ignored/* <path/to/this/repository>/.config/oh-my-zsh

## powerlevel10k (doesn't work on Ubuntu)

# See https://github.com/romkatv/powerlevel10k#oh-my-zsh (command below is slightly modified)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/oh-my-zsh/themes/powerlevel10k

ln -s <path/to/this/repository>/.p10k.zsh ~/.p10k.zsh
```

### Tmux

To manage work sessions, split my terminal in windows and panes and add persistency (especially
useful on remote machines), I use [Tmux](https://doc.ubuntu-fr.org/tmux). To set it up, I followed
this [video](https://www.youtube.com/watch?v=DzNmUNvnB04&ab_channel=DreamsofCode).

**Install:**

```shell
# For MacOS:
brew install tmux
# For Ubuntu:
sudo apt install tmux

# TPM (Tmux Plugin Manager):
# See https://github.com/tmux-plugins/tpm#installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s <path/to/this/repository>/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

Then start tmux (with the command `tmux` for instance), press `<prefix>I` to install tmux's plugins
(prefix is `<C-space>` in this configuration), and restart tmux (with `exit` and then `tmux` for
instance).

### Neovim

I use [Neovim](https://neovim.io/) as my main code editor. Its configuration is versioned in a
dedicated repository: I started up by configuring it with NvChad
[here](https://github.com/clementjumel/NvChad), but I ended up using kickstart.nvim
[here](https://github.com/clementjumel/kickstart.nvim) as it gives more flexibility and freedom.

**Requirements:**

- `git`
- `ripgrep` & `fd` (optional, for Telescope)
- `npm` & `python3.10-venv` (optional, for external tools)

**Install:**

```shell
# For MaxOS:
brew install neovim
# For Ubuntu:
sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
# or with Snap: sudo snap install nvim --classic

git clone https://github.com/clementjumel/kickstart.nvim <path/to/kickstart.nvim>
ln -s <path/to/kickstart.nvim> ~/.config/nvim

# Optionally, to install plugins & external tools from the command line
nvim "+Lazy install" +MasonInstallAll +qall
```

Then, open Neovim with `nvim` and run `:MasonInstallAll` to install Neovim external dependencies.

### Terminal Utilities

I use a variety of terminal tools to improve the user-experience when navigating in the terminal.

- [bat](https://github.com/sharkdp/bat) as a drop-in replacement of `cat`,
- [dust](https://github.com/bootandy/dust) as a drop-in replacement of `du`,
- [eza](https://github.com/eza-community/eza) as a drop-in replacement of `ls`,
- [fd](https://github.com/sharkdp/fd) as a replacement of `find`,
- [fzf](https://github.com/junegunn/fzf) for a variety of fuzzy finding features (including new
  key-bindings & fuzzy completion, provided by the installation script),
- [zoxide](https://github.com/ajeetdsouza/zoxide) as a drop-in replacement of `cd`.

Only zoxide is mandatory for this configuration to work. Besides, to use them, you need to copy the
alias files from `./.config/.oh-my-zsh/ignored/` to `./.config/.oh-my-zsh/`

**Install:**

```shell
# For MacOS:
brew install bat
brew install dust
brew install eza
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install zoxide

# For Ubuntu:
apt install zoxide
apt install fd-find
# For the following command, you might need to run `mkdir ~/.local.bin` if it fails
ln -s $(which fdfind) ~/.local/bin/fd
apt install fzf

ln -s <path/to/this/repository>/.fzf.zsh ~/.fzf.zsh
```
