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
lock key as escape, and the escape key as caps lock). Karabiner's configuration files are located in
`./.config/karabiner`.

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

### PyCharm

**I switched to Neovim as my code editor, I don't maintain this configuration anymore. See below for
the part on my Neovim configuration.**

I used to use [PyCharm](https://www.jetbrains.com/fr-fr/pycharm/) as my IDE. I set it up with the
[Catppuccin color scheme](https://github.com/catppuccin/jetbrains) and, especially, the
[IdeaVim plugin](https://plugins.jetbrains.com/plugin/164-ideavim) to transform PyCharm into a
vim-like editor. PyCharm's configuration files are `./.ideavimrc` and in `./.config/pycharm/`.

**Install:**

```shell
# For MacOS:
brew install --cask pycharm

ln -s <path/to/this/repository>/.ideavimrc ~/.ideavimrc
ln -s <path/to/this/repository>/.config/pycharm/keymaps/ ~/.config/pycharm/keymaps/
ln -s <path/to/this/repository>/.config/pycharm/templates ~/.config/pycharm/templates
ln -s <path/to/this/repository>/.config/pycharm/tools ~/.config/pycharm/tools
```

Then follow the standard installation guides to install the Catppuccin colorscheme & the IdeaVim
plugin.

## Terminal Tools

### Git

Git is the version control system I use. Git's configuration file is `./.gitconfig`.

**Install:**

```shell
# For MacOS:
brew install git

ln -s <path-to-this-repository>/.gitconfig ~/.gitconfig
```

### Zsh, Oh-My-Zsh & powerlevel10k

I use Zsh as terminal shell, which I set up with [Oh-My-Zsh](https://ohmyz.sh) to define custom
aliases and introduce some plugins, and [powerlevel10k](https://github.com/romkatv/powerlevel10k) to
customize the terminal prompt. Their configurations are defined in `./.zshrc`, `./config/oh-my-zsh/`
& `./.p10k.zsh`.

**Requirements:**

- `curl` or `wget`
- `git`

**Install:**

```shell
mv .zshrc .zshrc.old

# oh-my-zsh: https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerlevel10k: https://github.com/romkatv/powerlevel10k#oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -s clement/dotfiles/.zshrc .zshrc
ln -s ~/clement/dotfiles/.p10k.zsh ~/.p10k.zsh
```

### Tmux

To manage work sessions, split my terminal in windows and panes, I use
[Tmux](https://doc.ubuntu-fr.org/tmux). To set it up, I followed this
[video](https://www.youtube.com/watch?v=DzNmUNvnB04&ab_channel=DreamsofCode).

Tmux's configuration file is `./.config/tmux/tmux.conf` and can be symlinked with the following
command:

```shell
ln -s <path-to-this-repository>/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

### Neovim

I use [Neovim](https://neovim.io/) as my main code editor. Its configuration is versioned in a
dedicated repository: I started up by configuring it with NvChad
[here](https://github.com/clementjumel/NvChad), but I ended up using kickstart.nvim
[here](https://github.com/clementjumel/kickstart.nvim) as it gives more flexibility and freedom.

**Requirements:**

- `ripgrep` & `fd` (optional, for Telescope)

**Install:**

```shell
# For MaxOS:
brew install ripgrep
brew install fd
brew install neovim

# For Ubuntu with Snap
sudo apt-get install ripgrep
sudo apt install fd-find
sudo snap install nvim --classic
```

### Fzf

I use [fzf](https://github.com/junegunn/fzf) to navigate in the file system through fuzzy finding.

**Requirements:**

- `fd`

**Install:**

```shell
brew install fzf
```

### Dust

I use [Dust](https://github.com/bootandy/dust) for a more user-friendly `du` command.

**Install:**

```shell
brew install dust
```
