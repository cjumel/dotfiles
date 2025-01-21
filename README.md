# Dotfiles

This repository contains the configurations of most of the tools I use in my terminal. These
configurations are either defined as single (hidden) files at the root of this repository, or as
files in sub-directories inside the `./.config/` directory, which also often come with individual
`REAMDE.md` files.

## Requirements

To use these configuration files, you need:

- [Git](https://git-scm.com/), to clone this repository

- (optional) [GNU Stow](https://www.gnu.org/software/stow/), to set up all the configurations at
  once with a single command **(this might not be recommended for everyone, see details below)**

- (optional) [GNU Make](https://www.gnu.org/software/make/), to use Stow with the recommended
  command and some additional set up

## Usage

### Cloning the repository

For Stow to work, the content of this repository needs to be cloned inside a sub-directory of your
home directory. For instance, you can clone this repository with:

```shell
git clone --depth=1 https://github.com/cjumel/dotfiles.git ~/dotfiles
```

If you don't want to use Stow, you can clone the repository anywhere you want, and you can skip the
following section, but you'll need to set up the configuration files manually, for instance by
creating symbolic links (like Stow), or copying or moving files around.

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
directory. However, calling the `make` command will **not** install any software, this depends on
your operating system and needs to be done manually for each relevant tool.

You can look for further instructions, especially operating-system-dependent installation
instructions, in the `README.md` files in the sub-directories in `./.config/`, if any, and in the
tools' own documentations.

## [Neovim](https://neovim.io/) configuration

I use Neovim as my main text and code editor. Being a fork of a public repository, its configuration
is versioned in a dedicated repository. I first started with a full-feature distribution of Neovim,
installable with a one-liner, called [NvChad](https://nvchad.com/), and versioned in this
[repository](https://github.com/cjumel/NvChad). However, I ended switching to a smaller but more
customizable distribution, called [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim),
versioned in this [repository](https://github.com/cjumel/kickstart.nvim).
