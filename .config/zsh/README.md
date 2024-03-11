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

- [Bat](https://github.com/sharkdp/bat), see [here](/.config/bat/README.md)
- [Dust](https://github.com/bootandy/dust), see [here](/.config/dust/README.md)
- [Eza](https://github.com/eza-community/eza), see [here](/.config/eza/README.md)
- [Fzf](https://github.com/junegunn/fzf), see [here](/.config/fzf/README.md)
- [IPython](https://ipython.org/documentation.html), see [here](/.config/ipython/README.md)
- [Starship](https://starship.rs/), see [here](/.config/starship/README.md)
- [Zoxide](https://github.com/ajeetdsouza/zoxide), see [here](/.config/zoxide/README.md)
- [Tldr](https://github.com/tldr-pages/tldr), see [here](/.config/tldr/README.md)
