# Dotfiles

## Usage

To use these configuration files, you need [git](https://git-scm.com/) to clone this repository,
[GNU Stow](https://www.gnu.org/software/stow/) to manage the symbolink links, and
[GNU sed](https://www.gnu.org/software/sed/) to perform automatic file updates. Hence, you can start
by installing these with your preferred package manager. I use [Homebrew](https://brew.sh/), so I
simply ran `brew install git stow gnu-sed`. Then, you can run the following commands:

```shell
# you can name change the name of the dotfiles directory, but it needs to be in the $HOME directory
git clone https://github.com/clementjumel/dotfiles.git ~/dotfiles
cd ~/dotfiles
# on Ubuntu, run `make init-ubuntu` instead
make
```

This will automatically create some alternative configuration files (not versioned with Git) and
create symbolink links for all the configuration files with Stow. The `make` command can also be
used to update the alternative configuration files when their base files are updated.

During the `make` command, if some files exist where Stow want to create symbolic links, Stow will
fail. In that case, you can either remove or rename the conflicting files and run `stow .` again
within this repository, or run `stow --adopt .` to adopt the conflicting files.

## General Tools

### Karabiner

I use [Karabiner-Elements](https://karabiner-elements.pqrs.org/) to modify the keys I use on my
different keyboards. This enables me to fix some keys in my non-Apple keyboard for instance, as well
as modify keys for all keyboards (such as using the caps lock key as escape, and the escape key as
caps lock) and create complex keymaps (like remapping several control-key combinations to make them
easier to use).

**Install:**

```shell
# macos
brew install --cask karabiner-elements
```

### Iterm2

I don't use the default macOS terminal, as some features didn't work for me, but
[Iterm2](https://iterm2.com/), a quite simple alternative. I set it up with the
[Catppuccin color scheme](https://github.com/catppuccin/iterm) and the `JetBrainsMono`
[Nerd Font](https://www.nerdfonts.com/font-downloads).

**Install:**

```shell
# macos
brew install --cask iterm2
```

Then follow the standard installation guides to install the Catppuccin colorscheme & the
JetBrainsMono Nerd Fond.

## Terminal Tools

### Git & Pre-commit

Git is the Version Control System I use. Along with it, I use pre-commit to perform various checks
before each Git commit.

**Install:**

```shell
# macos
brew install git pre-commit

# ubuntu:
apt install git pre-commit
```

To setup a Git configuration adapted to remote machines, you can change the symlink to use
`./.gitconfig.remote` instead of `./.gitconfig`.

### Zsh, Oh-My-Zsh & powerlevel10k

I use Zsh as terminal shell, which I set up with [Oh-My-Zsh](https://ohmyz.sh) to define custom
aliases and introduce some plugins, and [powerlevel10k](https://github.com/romkatv/powerlevel10k) to
customize the terminal prompt.

**Requirements:**

- `curl` or `wget`
- `git`
- `fd`, `fzf`, `zoxide` (see the Terminal Utilities section below to install them)

**Install:**

```shell
# ubuntu (no need for macos)
sudo apt install zsh

# see https://ohmyz.sh/#install; oh-my-zsh gets installed in ~/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or: sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# See https://github.com/romkatv/powerlevel10k#oh-my-zsh (command below is slightly modified)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/oh-my-zsh/themes/powerlevel10k
```

### Tmux

To manage work sessions, split my terminal in windows and panes and add persistency (especially
useful on remote machines), I use [Tmux](https://doc.ubuntu-fr.org/tmux). To set it up, I followed
this [video](https://www.youtube.com/watch?v=DzNmUNvnB04&ab_channel=DreamsofCode).

**Install:**

```shell
# macos
brew install tmux
# ubuntu
sudo apt install tmux

# TPM (Tmux Plugin Manager), see https://github.com/tmux-plugins/tpm#installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start tmux (with the command `tmux` for instance), press `<prefix>I` to install tmux's plugins
(prefix is `<C-space>` in this configuration), and restart tmux (with `exit` and then `tmux` for
instance). The light theme can be activated/deactivated with the following commands from within a
Tmux session:

```shell
tmux source ~/.config/tmux/tmux.conf.light
tmux source ~/.config/tmux/tmux.conf
```

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
# macos
brew install neovim
# ubuntu
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

- [dust](https://github.com/bootandy/dust) as a drop-in replacement of `du`,
- [eza](https://github.com/eza-community/eza) as a drop-in replacement of `ls`,
- [fd](https://github.com/sharkdp/fd) as a replacement of `find`,
- [fzf](https://github.com/junegunn/fzf) for a variety of fuzzy finding features (including new
  key-bindings & fuzzy completion, provided by the installation script),
- [tldr](https://github.com/tldr-pages/tldr) as a user-friendly alternative to `man`,
- [zoxide](https://github.com/ajeetdsouza/zoxide) as a drop-in replacement of `cd`.

Zoxide, fzf & fd are mandatory for the Zsh configuration to work as they are configured directly in
`./.zshrc`.

**Install:**

```shell
# macos
brew install dust eza fd fzf tldr zoxide
# for fzf additional features (auto-completion, key bindings, etc.)
$(brew --prefix)/opt/fzf/install
cp ~/dotfiles/.config/oh-my-zsh/ignored/* ~/dotfiles/.config/oh-my-zsh

# ubuntu (without all utilities)
apt install fd-find fzf zoxide
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
```

## More Vim Movements Integration

### PyCharm

To use vim movements in PyCharm, I use the [IdeaVim](https://github.com/JetBrains/ideavim) plugin.
It should be installed directly from PyCharm, along with the
[AceJump](https://github.com/acejump/AceJump) and
[IdeaVim-EasyMotion](https://github.com/AlexPl292/IdeaVim-EasyMotion) plugins, to support
EasyMotion-like movements. The custom configuration file is `./.ideavimrc` and it can be symlinked
from the home directory.

### Web Brower

For Chromium-based web browsers, I use the [Vimium](https://github.com/philc/vimium) extension to
use vim movements in the browser. The configuration file is `./.vimiumrc`, however its content needs
to be copy/pasted in the extension's configuration page, it cannot be symlinked.
