# Tools

## Applications

### [AeroSpace](https://github.com/nikitabobko/AeroSpace)

AeroSpace is a tiling window manager for macOS. It is great to manage window layouts and workspace
with a keyboard-centric and developper-friendly approach. See this
[YouTube video](https://www.youtube.com/watch?v=5nwnJjr5eOo&t) for a more detailed explanation of
what AeroSpace can do.

I additionally use [SwipeAeroSpace](https://github.com/MediosZ/SwipeAeroSpace), to keep being able
to use trackpad gestures to swipe workspaces.

#### Install

For macOS, run the following commands:

```bash
brew install --cask nikitabobko/tap/aerospace
brew install --cask mediosz/tap/swipeaerospace
```

Then start the AeroSpace and SwipeAeroSpace applications and follow the prompts to give them the
relevant system access, enable them on startup and configure them if necessary.

Lastly, change the following settings:

- enable `System Settings → Desktop & Dock → Group windows by application`
- disable `System Settings → Trackpad → More Gestures → Swipe between full-screen applications`

### [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

Karabiner is a great tool for macOS to customize a keyboard's behavior. I use it to:

- Implement home row mods (see this [YouTube video](https://www.youtube.com/watch?v=sLWQ4Gx88h4&t)
  for an explanation and a similar implementation)
- Overload the Caps Lock key with Escape (see this other
  [Youtube video](https://www.youtube.com/watch?v=XuQVbZ0wENE) for an explanation and a slightly
  different implementation)
- Inverting numbers and symbols on the numerical row (for a French AZERTY layout behavior)
- Fix my non-Apple keyboard to behave like an Apple one

#### Install

For macOS, install Karabiner-Elements following its
[installation guide](https://karabiner-elements.pqrs.org/docs/getting-started/installation/).

### [SketchyBar](https://felixkratz.github.io/SketchyBar/)

SketchyBar is a highly flexible, customizable, fast and powerful replacement or complement for
macOS's builtin status bar. Being community driven, it provides many modules for very cool
customization, like displaying and interacting with AeroSpace workspaces.

#### Requirements

- the JetBrains Mono [Nerd Font](https://github.com/ryanoasis/nerd-fonts) (which can be installed
  with `brew install --cask font-jetbrains-mono-nerd-font`)

#### Install

For macOS, run the following commands:

```bash
brew tap FelixKratz/formulae
brew install sketchybar
chmod +x config/sketchybar/plugins/aerospace.sh
```

Lastly, change the following settings:

- enable `System Settings → Desktop & Dock → Displays have separate Spaces`

### [Vimium](https://github.com/philc/vimium)

I use Vimium for Vim-like key bindings in a web browser. It's install instructions depend on the web
browser, and, to use my settings, you need to copy the content of
[this file](.config/vimium/vimiumrc.vim) in the Vimium settings in your web browser.

### [WezTerm](https://wezfurlong.org/wezterm/index.html)

Wezterm is my terminal emulator of choice, as it is very simple to install, has all the standard
terminal features (unlike the builtin macOS terminal emulator or [iTerm2](https://iterm2.com/),
which I both used at some point), is very performant, and is very configurable through Lua code (the
same language as neovim configuration).

#### Install

To install the terminal emulator and a font, for macOS, run the following commands:

```bash
brew install font-jetbrains-mono-nerd-font
brew install --cask wezterm
# or, to install nightly:
# brew install --cask wezterm@nightly
```

## Terminal tools

### [bat](https://github.com/sharkdp/bat)

#### Install

For macOS, run the following command:

```bash
brew install bat
```

### [Docker](https://www.docker.com/)

#### Install

For macOS, Linux or Windows, install Docker Desktop following its
[installation guide](https://docs.docker.com/get-started/introduction/get-docker-desktop/).

> [!NOTE]
>
> Even though I don't really use the Docker Desktop application, I haven't find any other way to
> install the Docker CLI alone.

#### Shell completions

As recommanded by the
[shell autocompletion guide](https://docs.docker.com/engine/cli/completion/#zsh) but adapted to the
standard `~/.zfunc/` completion directory approach for zsh, run the following command:

```bash
mkdir -p ~/.zfunc; docker completion zsh > ~/.zfunc/_docker
```

### [Dust](https://github.com/bootandy/dust)

#### Install

For macOS, run the following command:

```bash
brew install dust
```

### [eza](https://github.com/eza-community/eza)

#### Install

For macOS, run the following command:

```bash
brew install eza
```

### [fd](https://github.com/sharkdp/fd)

#### Install

For macOS, run the following commanda;

```bash
brew install fd
```

For Linux, run the following commanda;

```bash
apt install fd-find
```

### [fzf](https://github.com/junegunn/fzf)

#### Requirements

- `fd` as search source
- `bat` as file previewer
- `eza` as directory previewer

#### Install

For macOS, run the following commands:

```bash
brew install fzf
## for additional auto-completion & key bindings features
$(brew --prefix)/opt/fzf/install
```

For Linux, run the following command:

```bash
apt install fzf
```

### [gh](https://cli.github.com/)

#### Install

For macOS, run the following command:

```bash
brew install gh
```

### [neovim](https://neovim.io/)

I use Neovim as my main text and code editor. Being a fork of a public repository, its configuration
is versioned in a [dedicated repository](https://github.com/cjumel/kickstart.nvim), based on the
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) starting point. See this repository for
more details and install instructions.

### [nvm](https://github.com/nvm-sh/nvm)

#### Install

For macOS, as recommanded in the
[install guide](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating), run the
following command:

```bash
PROFILE=/dev/null bash -c \
    'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'
```

### [OpenCode](https://opencode.ai/)

#### Install

For macOS, run the following command:

```bash
brew install opencode
```

### [Poetry](https://python-poetry.org/)

#### Install

For macOS and Linux, as recommanded by the
[official installer guide](https://python-poetry.org/docs/#installation), run the following command:

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

> [!IMPORTANT]
>
> Since I need to be able to use whatever version of `poetry` a Python project requires, I avoid
> installing `poetry` with a package manager like Homebrew (where you can only access the latest
> version of a package). That way, I can use the `poetry self update ...` command to change
> `poetry`'s own version.

#### Shell completions

As recommanded by the [shell completion guide](https://python-poetry.org/docs/#zsh), run the
following command:

```bash
mkdir -p ~/.zfunc; poetry completions zsh > ~/.zfunc/_poetry
```

### [ripgrep](https://github.com/BurntSushi/ripgrep)

#### Install

For macOS, run the following command:

```bash
brew install ripgrep
```

For Linux, run the following command:

```bash
apt-get install ripgrep
```

### [starship](https://starship.rs/)

#### Install

For macOS, run the following command:

```bash
brew install starship
```

### [tmux](https://github.com/tmux/tmux)

#### Install

I use tmux with [TPM](https://github.com/tmux-plugins/tpm), the Tmux Plugin Manager, which also
needs to be installed.

For macOS, run the following commands:

```bash
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

For Linux, run the following commands:

```bash
apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start tmux with the command `tmux`, press `<prefix>I` to install tmux plugins (prefix is
`<C-space>` in my configuration), and restart tmux with `exit` and then `tmux`.

### [uv](https://docs.astral.sh/uv/)

#### Install

For macOS and Linux, as recommanded by the
[standalone installer guide](https://docs.astral.sh/uv/getting-started/installation/#standalone-installer),
run the following command:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

> [!IMPORTANT]
>
> Since I need to be able to use whatever version of `uv` a Python project requires, I avoid
> installing `uv` with a package manager like Homebrew (where you can only access the latest version
> of a package). That way, I can use the `uv self update ...` command to change `uv`'s own version.

#### Shell completions

As recommanded by the
[shell autocompletion guide](https://docs.astral.sh/uv/getting-started/installation/#shell-autocompletion)
but adapted to the standard `~/.zfunc/` completion directory approach for zsh, run the following
commands:

```bash
mkdir -p ~/.zfunc
uv generate-shell-completion zsh > ~/.zfunc/_uv
uvx --generate-shell-completion zsh > ~/.zfunc/_uvx
```

### [zoxide](https://github.com/ajeetdsouza/zoxide)

#### Install

For macOS, run the following command:

```bash
brew install zoxide
```

For Linux, run the following command:

```bash
apt install zoxide
```
