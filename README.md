# Dotfiles

This repository contains most of my personal configuration files for the different tools I use.

## Requirements

To use these configuration files, you need:

- [Git](https://git-scm.com/), to clone this repository
- (optional) [GNU Stow](https://www.gnu.org/software/stow/), if you want to set up all the
  configuration files at once with a single command **(this might not be recommended for everyone,
  see details below)**
- (optional) [GNU Make](https://www.gnu.org/software/make/), if you want to use Stow with the
  recommended commands and some additional set up

Refer to the documentation of each requirement for installation instructions depending on your
operating system, but they should typically be installable with `brew install` on MacOS or
`apt install` on Ubuntu.

## Usage

### Cloning the repository

Once you have installed the requirements if needed, you can clone this repository with:

```shell
git clone --depth=1 https://github.com/clementjumel/dotfiles.git ~/dotfiles
```

The target directory name, `dotfiles`, can be changed, but the directory needs to be located in your
home directory `~/` for Stow to work. Out of simplicity, in the rest of the documentation, I'll
assume that the repository is cloned in `~/dotfiles`.

If you don't want to use Stow, you can clone the repository in any directory of your choice. In that
case, you can also skip the following section, but you'll need to:

- install any software you want to use
- set up the configuration files manually, for instance by creating symbolic links

You can look for further instruction in the `README.md` files of this repository and the tools'
documentations.

### Creating symbolic links using Stow and Make

Using Stow will automatically create most of the relevant symbolic links to the configuration files
in this repository. This is convenient if you want to use all the configuration files (which is my
case), but this might not be what you want, and, more importantly, this might mess up existing
configuration files. **Hence, I recommend to use Stow only if you want the whole configuration and
if you have backed up all your important configuration files, by creating local copies or, even
better, by versionning them with a Version Control System like Git.**

I recommand to use `stow` through the `Makefile` provided in this repository with the `make` command
from within the `~/dotfiles` directory, as it contains the right `stow` command as well as
additional set up. This will create all the relevant symbolic links in your home directory `~/` and
in sub-directories of `~/.config`, replacing any conflicting configuration file. The content of any
replaced configuration files will not be lost, though, it will be adopted by the linked file. If you
want to discard the replaced configuration, you need to discard these changes in the `~/dotfiles`
directory (but make sure any change you discard is not important or is backed up somewhere).
However, calling the `make` command will **not** install any software, this depends on your
operating system and needs to be done manually for each relevant tool.

## Content

### `.config/` directory

Many configuration files are in the `.config/` directory. Each directory comes with a `README.md`
explaining the role of the tool, how to install it, its requirements, etc. You can check them
directly for more details.

### Root directory

Some configuration files need to live in the root of the user directory, such as `.zshrc` or
`.gitconfig`, hence they are located in the root of this repository, to avoid any additional setup.

#### [Vimium](https://github.com/philc/vimium)

For Chromium-based web browsers (like Google Chrome or Arc Browser), I use the Vimium extension to
enable Vim motions. This enables me to switch from Neovim to a web browser and keep using the same
keymaps for simple navigation. I don't use it for longer/more complex navigation, like when I'm
simply scrolling the web, though, as the mouse is still more convenient in this case.

My configuration is located in a `.vimiumrc`, just like a `.vimrc`. However Vimium doesn't support
confiuration file, therefore the confiuration needs to be manually copy & pasted to the extension's
option page (e.g. by pressing `?` in the web browser if the extension is enabled and then clicking
on "Options") in the relevant section (don't forget to click on "Save changes" afterwards). In Arc
Browser, this must be done for each different profile.

### Other

Here I describe some other tools I use & which have a configuration that don't live in this
repository or no file-based configuration at all.

#### [Neovim](https://neovim.io/)

I use Neovim as my main text & code editor. Given some efforts to configure it & get the hang of it,
it comes with all the features of modern IDEs, while being very light-weight, almost infinitly
customizable, and living in the terminal (meaning it can be installed and used directly through SSH
on remote machines).

Being a fork of a public repository, its configuration is versioned in a dedicated repository. I
first started with a full-feature distribution of Neovim, installable with a one-liner, called
[NvChad](https://nvchad.com/), and developped in this
[repository](https://github.com/clementjumel/NvChad). However, I ended switching to a smaller but
more customizable distribution, called [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim),
in this [repository](https://github.com/clementjumel/kickstart.nvim).

#### [AltTab](https://github.com/lwouis/alt-tab-macos)

I use AltTab to improve the builtin Alt-Tab feature of MacOS. It provides nice (but still basic)
features, like supporting multiple windows of the same application, or directly interacting with
applications through AltTab (closing, hiding, etc.)

#### [Raycast](https://www.raycast.com/)

I use Raycast to improve the builtin Cmd-Space feature of MacOS. It provides many useful builtin
extensions, but also many plugins to integrate it with other applications. It is, for instance, my
tool of choice for window management (e.g. moving windows between displays, resizing, creating
splits, etc.)

#### [Tldr](https://github.com/tldr-pages/tldr)

`tldr` is a collaborative tool providing a user-friendly & synthetic documentation to many commands.
It is designed to be complementary to the `man` pages & can replace it in many cases as long as the
desired information is not too "niche", but it doesn't aim at replacing it entirely. It is very
simple to use and I use it without any configuration at all.

##### Install

<details>
<summary>MacOS</summary>

The `tldr` formula does exist on Homebrew, but the recommanded one is `tlrc`, the official Rust
client for `tldr`.

```shell
brew install tlrc
```

</details>
