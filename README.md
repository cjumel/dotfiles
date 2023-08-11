# Dotfiles

These files describe the tools I use to work on my computer and their configurations.
To use them, first clone this repository in your home directory with git and go inside the
directory:

```shell
git clone https://github.com/clementjumel/dotfiles.git ~/dotfiles/
cd ~/dotfiles/
```

## HomeBrew

To manage most of my packages, I use [HomeBrew](https://brew.sh/).
The list of the packages I installed with brew can be seen in the `./Brewfile`.
Thanks to [mas](https://github.com/mas-cli/mas), this file also contains the few
packages I installed through the App Store.

To generate the `./Brewfile`, run `brew bundle`, and to install the packages, install mas if
needed (for instance with `brew install mas`), then run `brew bundle dump`.

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

## Fig

I use [Fig](https://fig.io/) to add a super user-friendly completion feature to my terminal.

Fig's configuration files is `./.fig/settings.json` and can be symlinked from
`~/.fig/settings.json`.

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

## neovim

I use [neovim](https://neovim.io/) as a lightweight code editor alternative.
I set it up to edit generic configuration files, like this repository, but also to
support coding in Python.

To set it up, I used [NvChad](https://nvchad.com/), as recommanded by this
[video](https://www.youtube.com/watch?v=Mtgo-nP_r8Y&ab_channel=DreamsofCode).
To add features relative to Python, I also followed this
[video](https://www.youtube.com/watch?v=4BnVeOUeZxc).
More information on how to set up neovim with NvChad is available in the
[features documentation](https://nvchad.com/docs/features) or in the
[example configuration](https://github.com/NvChad/example_config).

To improve the use of `telescope.nvim` and as suggested by the package itself, I additionally
installed `ripgrep` and `fd` with `brew`.

neovim's configuration files are in `./.config/nvim/` which can be symlinked from
`~/.config/nvim/`.

## Git

Git is the version control system I use.

Git's configuration file is `./.gitconfig` and can can be symlinked from `~/.gitconfig`.

## PyCharm

I use [PyCharm](https://www.jetbrains.com/fr-fr/pycharm/) as my IDE.
I set it up with the [Catppuccin color scheme](https://github.com/catppuccin/jetbrains)
and the [IdeaVim plugin](https://plugins.jetbrains.com/plugin/164-ideavim).

PyCharm's configuration files are `./.ideavimrc` and in `./.config/pycharm/`,
and can be symlinked from `~/.ideavimrc` and `~/.config/pycharm/` respectively.
