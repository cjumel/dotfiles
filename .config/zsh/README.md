# [Zsh](https://www.zsh.org/)

I use Zsh as terminal shell, as it is the default for MacOS. I set it up with
[Oh-My-Zsh](https://ohmyz.sh), a community-driven framework to bring many features to Zsh,
especially to add sane default options, a nicer default terminal prompt and manage easily custom
aliases.

This Zsh configuration comes with several optional tools (like an improved terminal prompt or
various CLI tools). Core features are good enough to work occasionally on a remote machine, while
optional tools are nice to have and are always setup on my own machine. See below for the list of
optional tools and details on how to install or disable them. **By default, all the tools are
enabled so you should either install them or disable their setup, therefore it is important to check
the documentation below.**

**Requirements:**

- `curl` or `wget`
- [Git](https://git-scm.com/)

**Install:**

<details>
<summary>MacOS</summary>

Zsh is the default terminal shell in MacOS, there's no need to install it.

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or: sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

</details>
<details>
<summary>Ubuntu</summary>

```shell
apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or: sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

</details>

## Additional Tools

I use a few main additional tools, which bring quite useful (but still optional) features & have
their own configuration files and documentation:

- [Starship](https://starship.rs/), see [here](/.config/starship/README.md)
- [Fzf](https://github.com/junegunn/fzf), see [here](/.config/fzf/README.md)
- [Zoxide](https://github.com/ajeetdsouza/zoxide), see [here](/.config/zoxide/README.md)

## Terminal Utilities

Besides the main tools listed above, I also use several terminal utilities to improve the user
experience, but they do not bring super useful features:

- [Bat](https://github.com/sharkdp/bat), a drop-in replacement of the builtin `cat`
- [Dust](https://github.com/bootandy/dust), a drop-in replacement of the builtin `du` (my go-to tool
  to clean up disk space)
- [Eza](https://github.com/eza-community/eza), a drop-in replacement of the builtin `ls`
- [Tldr](https://github.com/tldr-pages/tldr), a more user-friendly variant to the builtin `man`

**Install:**

I usually only install the terminal utilities on my machine, a MacOS.

<details>
<summary>MacOS</summary>

```shell
brew install bat
brew install dust
brew install eza
brew install tldr
```

</details>

**Disable:**

To disable the terminal utilities setup, simply delete the `.config/zsh/utilities.zsh` file. If
you've run the `make` command already, also remove the `~/.config/zsh/utilities.zsh` symlink that
have been created.
