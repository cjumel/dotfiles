# Dotfiles

## Requirements

To make these configuration files directly usable, you simply need:

- [Git](https://git-scm.com/) to clone this repository
- [GNU Stow](https://www.gnu.org/software/stow/) to manage the symbolic links automatically

**Install:**

<details>
<summary>MacOS</summary>

```shell
brew install git
brew install stow
```

</details>
<details>
<summary>Linux</summary>

```shell
apt install git
apt install stow
```

</details>

## Usage

After the installation of the requirements, you can setup the configuration files with the following
commands:

```shell
# you can change the target directory name, but it needs to be in `~/` for stow to work
git clone https://github.com/clementjumel/dotfiles.git ~/dotfiles
cd ~/dotfiles
make
```

This will:

- clone this repository in `~/dotfiles` (or in a directory of your choice)
- create symbolic links in `~/.config` for all the configuration files with Stow
- create additional symbolic links in `~/` for configuration files where the `~/.config` location is
  not supported or implemented
- create additional symbolic links for terminal-wide theme management (shared theme between WezTerm,
  Tmux and Neovim)

However, this will **not**:

- install any software, this depends on your operating system and needs to be done manually
- setup the configuration files for Neovim as they are versionned in a different repository

During the `make` command, if any file exists where Stow wants to create a symbolic link, Stow will
fail. In that case, you can simply remove or rename the conflicting files and run `make` again.
Alternatively, to adopt in this repository the conflicting files instead, you can run the `stow`
command from the `Makefile` manually with the additional `--adopt` flag.

The `make` command can also be re-used safely to update the symbolink links, for instance when a new
configuration file is added.

## Content

All the actual configuration files are in the `.config/` directory. Each tool configuration comes
with a `README.md` explaining the role of the tool, how to install it, its requirements, etc.

The general tools I setup on my machine are:

- [Karabiner-Elements](/.config/karabiner/), an (essential) keyboard remapper
- [WezTerm](/.config/wezterm/), a terminal with plenty of features and very customizable
- [Vimium](/.config/vimium/), a web browser extension for Vim motions

As for the terminal tools, which should be installed on whatever machine I'm working on to be
usable, are:

- [Bat](/.config/bat/), a drop-in replacement for `cat`
- [Dust](/.config/dust/), a drop-in replacement for `du`
- [Eza](/.config/eza/), a drop-in replacement for `ls`
- [Fzf](/.config/fzf/), a powerful fuzzy finding tool
- [IPython](/.config/ipython/), an enhanced Python shell
- [Neovim](/.config/nvim/) as main text & code editor
- [Oh-my-zsh](/.config/oh-my-zsh/), a standard Zsh configuration framework
- [Starship](/.config/starship/), a modern terminal prompt
- [Tldr](/.config/tldr/), a simpler alternative to `man`
- [Tmux](/.config/tmux/), an awesome terminal multiplexer
- [Zoxide](/.config/zoxide/), a drop-in replacement for `cd`
