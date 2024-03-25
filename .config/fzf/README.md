# [Fzf](https://github.com/junegunn/fzf)

Fzf is a general-purpose command-line fuzzy finder and provides many useful features especially to
fuzzy find files and directories.

By default, fzf is enabled in this configuration, so you need to install it for this to work.
Alternatively, you can entirely disable its setup (for instance if you're working on a remote
machine and don't want to bother with this). See below for details on how to do either option.

**Requirements:**

- `fd` as search source
- `eza` as directory previewer

**Install:**

<details>
<summary>MacOS</summary>

```shell
brew install fzf
# for additional auto-completion & key bindings features
$(brew --prefix)/opt/fzf/install
```

</details>
<details>
<summary>Linux</summary>

```shell
apt install fzf
```

</details>

**Disable:**

To disable fzf's setup, simply delete the `.config/fzf/` directory. If you've run the `make` command
already, also remove the `~/.config/fzf/` directory to remove the symlinks that have been created.
