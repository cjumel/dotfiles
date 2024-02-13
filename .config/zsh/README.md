# [Zsh](https://www.zsh.org/)

## Core

I use Zsh as terminal shell, as it is the default for MacOS. I set it up with
[Oh-My-Zsh](https://ohmyz.sh), a community-driven framework to bring many features to Zsh,
especially to add sane default options, a nicer default terminal prompt and manage easily custom
aliases.

This Zsh configuration comes with several optional features (like an improved terminal prompt or
various CLI tools), which are setup with lines marked by `# NOTE:` comments in `.config/zsh/.zshrc`.
You can disable them by removing the relevant lines, or install them (see below). Core features are
good enough to work occasionally on a remote machine, while optional features are nice to have and
are always setup on my own machine.

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

## Optional Features

### [Starship](https://starship.rs/)

See [here](.config/starship/README.md).

### [Fzf](https://github.com/junegunn/fzf)

See [here](.config/fzf/README.md).

### [Zoxide](https://github.com/ajeetdsouza/zoxide)

Zoxide provides a drop-in replacement of the builtin `cd`, with the additional feature of being able
to jump directly to any directory visited in the past.

**Install:**

<details>
    <summary>MacOS</summary>
    ```shell
    brew install zoxide
    ```
</details>

<details>
    <summary>Ubuntu</summary>
    ```shell
    apt install zoxide
    ```
</details>

### [Eza](https://github.com/eza-community/eza)

Eza provides a drop-in replacement of the builtin `ls` with a nicer & more informative display.

**Install:**

<details>
    <summary>MacOS</summary>
    ```shell
    brew install eza
    ```
</details>

### [Bat](https://github.com/sharkdp/bat)

Bat provides a drop-in replacement of the builtin `cat` with a nicer display.

**Install:**

<details>
    <summary>MacOS</summary>
    ```shell
    brew install bat
    ```
</details>

### [Dust](https://github.com/bootandy/dust)

Dust provides a drop-in replacement of the builtin `du` with improved performance, a nicer & more
informative display, while being more user-friendly. It is now my go-to tool to clean up disk space.

**Install:**

<details>
    <summary>MacOS</summary>
    ```shell
    brew install dust
    ```
</details>

### [Tldr](https://github.com/tldr-pages/tldr)

Tldr provides a more user-friendly variant to the builtin `man`. It doesn't provide as much in-depth
information but it is easier to read and understand.

**Install:**

<details>
    <summary>MacOS</summary>
    ```shell
    brew install tldr
    ```
</details>
