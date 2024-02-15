# [Neovim](https://neovim.io/)

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

**Requirements:**

- `git`
- `ripgrep` & `fd` (optional, for Telescope plugin)
- `npm` & `python3.10-venv` (optional, for external tools install)

**Install:**

<details>
<summary>MacOS</summary>

```shell
brew install neovim

git clone --depth=1 https://github.com/clementjumel/kickstart.nvim ~/.config/nvim
# optionally, to install plugins & external tools from the command line:
nvim "+Lazy install" +MasonInstallAll +qall
# or to do so within Neovim, run `:MasonInstallAll`
```

</details>
<details>
<summary>Ubuntu</summary>

```shell
apt install software-properties-common
add-apt-repository ppa:neovim-ppa/unstable
apt update
apt install neovim
git clone --depth=1 https://github.com/clementjumel/kickstart.nvim ~/.config/nvim
# optionally, to install plugins & external tools from the command line:
nvim "+Lazy install" +MasonInstallAll +qall
# or to do so within Neovim, run `:MasonInstallAll`
```

</details>
