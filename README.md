# Dotfiles

## Usage

To use these configuration files, you need:

- [Git](https://git-scm.com/) to clone this repository
- [GNU Stow](https://www.gnu.org/software/stow/) to manage the symbolink links

Hence, you can start by installing these with your preferred package manager. I use
[Homebrew](https://brew.sh/), so I simply ran `brew install git stow`. Then, you can run the
following commands:

```shell
# you can change the name of the dotfiles directory, but it needs to be in $HOME
git clone https://github.com/clementjumel/dotfiles.git ~/dotfiles
cd ~/dotfiles
make
```

This will automatically create symbolink links for all the configuration files with Stow. This will
**not** install any software: this needs to be done manually and depends on your operating system.

During the `make` command, if some files exist where Stow want to create symbolic links, Stow will
fail. In that case, you can either remove or rename the conflicting files and run `stow .` again
within this repository, or run `stow --adopt .` to adopt the conflicting files.

The `make` command can also be re-used latter safely to update the dynamically created configuration
files and the symbolink links.

## General Tools

### Karabiner

I use [Karabiner-Elements](https://karabiner-elements.pqrs.org/) to modify the keys I use on my
different keyboards. This enables me to fix some keys in my non-Apple keyboard for instance, as well
as modify keys for all keyboards (such as using the caps lock key as escape, and the escape key as
caps lock) and create complex keymaps (like remapping several control-key combinations to make them
easier to use). With Homebrew, Karabiner-Elements can be installed with
`brew install --cask karabiner-elements`.

### WezTerm

I use [WezTerm](https://wezfurlong.org/wezterm/index.html) as my terminal emulator. The built-in
terminal of MacOS lacks some features some tools I use need, and WezTerm is a very performant
alternative, being written in Rust, while remaining super configurable via Lua code, just like
Neovim. With Homebrew, WezTerm can be installed with `brew install --cask wezterm`.

## Terminal Tools

### Git & Pre-commit

Git is the Version Control System I use. Along with it, I use pre-commit to perform various checks
before each Git commit.

**Install:**

```shell
# macos
brew install git pre-commit

# ubuntu
apt install git pre-commit
```

### Zsh

I use Zsh as terminal shell, which I set up with [Oh-My-Zsh](https://ohmyz.sh) especially to add a
default terminal prompt and manage custom aliases. Additionally, I set-up a
[starship](https://starship.rs/) terminal prompt, which can be disabled by commenting out the
relevant line in `./.zshrc`. In that case, the terminal prompt will fallback to Oh-My-Zsh's prompt.

**Requirements:**

- `curl` or `wget`
- `git`
- `fd`, `fzf`, `zoxide` (see the Terminal Utilities section below to install them)
- `starship` (optional)

**Install:**

```shell
# ubuntu (no need for macos)
sudo apt install zsh

# see https://ohmyz.sh/#install; oh-my-zsh gets installed in ~/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or: sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

### Tmux

To manage work sessions, split my terminal in windows and panes and add persistency (especially
useful on remote machines), I use [Tmux](https://doc.ubuntu-fr.org/tmux).

**Install:**

```shell
# macos
brew install tmux
# ubuntu
sudo apt install tmux

# TPM (Tmux Plugin Manager), see https://github.com/tmux-plugins/tpm#installation
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then start Tmux (with the command `tmux` for instance), press `<prefix>I` to install tmux's plugins
(prefix is `<C-space>` in this configuration), and restart Tmux (with `exit` and then `tmux` for
instance).

### Neovim

I use [Neovim](https://neovim.io/) as my main code editor. Its configuration is versioned in a
dedicated repository. I started up by configuring it with NvChad
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

git clone https://github.com/clementjumel/kickstart.nvim ~/.config/nvim

# Optionally, to install plugins & external tools from the command line
nvim "+Lazy install" +MasonInstallAll +qall
# or run within Neovim `:MasonInstallAll`
```

### Terminal Utilities

I use a variety of terminal tools to improve the user-experience when using the terminal.

- [bat](https://github.com/sharkdp/bat) as a drop-in replacement of `cat`
- [dust](https://github.com/bootandy/dust) as a drop-in replacement of `du`
- [eza](https://github.com/eza-community/eza) as a drop-in replacement of `ls`
- [fd](https://github.com/sharkdp/fd) as a replacement of `find`
- [fzf](https://github.com/junegunn/fzf) for a variety of fuzzy finding features (including new
  key-bindings & fuzzy completion, provided by the installation script)
- [tldr](https://github.com/tldr-pages/tldr) as a user-friendly alternative to `man`
- [zoxide](https://github.com/ajeetdsouza/zoxide) as a drop-in replacement of `cd`

Zoxide, fzf & fd are mandatory for the Zsh configuration to work as they are configured directly in
`./.zshrc`.

**Install:**

```shell
# macos
brew install bat dust eza fd fzf tldr zoxide
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

To use Vim movements in PyCharm, I use the [IdeaVim](https://github.com/JetBrains/ideavim) plugin.
It should be installed directly within PyCharm, along with the
[AceJump](https://github.com/acejump/AceJump) and
[IdeaVim-EasyMotion](https://github.com/AlexPl292/IdeaVim-EasyMotion) plugins, to support
EasyMotion-like movements. The configuration is defined in `./.ideavimrc`.

### Web Brower

For Arc Browser, a Chromium-based web browser, I use the [Vimium](https://github.com/philc/vimium)
extension to use Vim movements. The configuration is defined in `./.vimiumrc`, however its content
needs to be copy/pasted in the extension's configuration page, as it is not an actual configuration
file.
