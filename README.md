# Dotfiles

This repository contains the configurations of many tools I use, along with some install
instructions and sometimes some explanations of their usage.

## Requirements

To use all these configuration files, you need:

- [Git](https://git-scm.com/), to clone this repository
- [GNU Stow](https://www.gnu.org/software/stow/), to set up all the configuration symbolic links at
  once with a single command
- [GNU Make](https://www.gnu.org/software/make/), to use the recommended commands

You can also use these configurations files manually without any requirement, but the rest of this
file doesn't cover how to do so.

## Install

### Cloning the repository

For Stow to work, the content of this repository needs to be cloned **precisely** inside a
sub-directory of your home directory (the directory name is not important). For instance, you can
clone this repository with:

```bash
git clone --depth=1 https://github.com/cjumel/dotfiles.git ~/dotfiles
```

### Creating symbolic links

Using Stow will automatically create all of the relevant symbolic links to the configuration files
in this repository. This is convenient if you want to use all the configuration files (which is my
case), but this might not be what you want, and, more importantly, this might mess up existing
configuration files. **Hence, I recommend to use Stow only if you want the whole configuration and
if you have backed up all your important configuration files.**

To create the configuration symbolic links, simply run the following command:

```bash
make symlinks
```

This will create all the relevant symbolic links in your home directory and in sub-directories of
`~/.config`, replacing any conflicting configuration file. If files already exist, their content
will not be lost, it will be adopted in the linked file, so if you want to discard the replaced
configuration, you need to discard these changes.

Note that this command will **not** install any software, this depends on your operating system and
needs to be done manually for each relevant tool. For additional instructions on how I install each
tool, see the [Tools documentation](TOOLS.md).
