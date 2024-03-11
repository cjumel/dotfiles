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

### `.config/` directory

Many configuration files are in the `.config/` directory. Each directory comes with a `README.md`
explaining the role of the tool, how to install it, its requirements, etc. You can check them
directly for more details.

### Root directory

Some configuration files need to live in the root of the user directory, such as `.zshrc` or
`.gitconfig`, hence they are located in the root of this repository, to avoid any additional setup.

### Other

Some tools I use & which have a configuration don't live in this repository.

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
