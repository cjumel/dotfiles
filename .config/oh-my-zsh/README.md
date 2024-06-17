# [Oh-My-Zsh](https://ohmyz.sh)

I use [Zsh](https://www.zsh.org/) as terminal shell, as it is the default for MacOS. I set it up
with `oh-my-zsh`, a community-driven framework to bring many features to Zsh, especially to add sane
default options, a nicer default terminal prompt and manage easily custom aliases.

## Requirements

To use `oh-my-zsh`, you simply need:

- [curl](https://curl.se/) or [wget](https://www.gnu.org/software/wget/) to download the
  installation scripts

- [Git](https://git-scm.com/) to clone plugins repositories

Additionally, my `oh-my-zsh` configuration defines some aliases to some external tools (sometimes
overriding builtin commands, like `ls`), which you need to install separately to use:

- [dust](https://github.com/bootandy/dust), my go-to tool to diplay disk space usage on my machine;
  I use it as a drop-in replacement of the builtin `du` command
- [eza](https://github.com/eza-community/eza), an improved `ls` command with a more modern look and
  feel; I use it as a drop-in replacement of the builtin `ls` command

## Install

<details>
<summary>MacOS</summary>

Zsh is the default terminal shell in MacOS, there's no need to install it.

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or: sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Clone plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

</details>
<details>
<summary>Ubuntu</summary>

```shell
apt install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or: sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Clone plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tabj
```

</details>
