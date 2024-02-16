# [Zoxide](https://github.com/ajeetdsouza/zoxide)

Zoxide provides a drop-in replacement of the builtin `cd`, with the additional feature of being able
to jump directly to any directory visited in the past without having to type the full path but using
a matching algorithm based on the directory frecency.

By default, zoxide is enabled in this configuration, so you need to install it for this to work.
Alternatively, you can entirely disable its setup (for instance if you're working on a remote
machine and don't want to bother with this). See below for details on how to do either option.

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

**Disable:**

To disable zoxide setup, simply delete the `.config/zoxide/` directory. If you've run the `make`
command already, also remove the `~/.config/zoxide/` directory to remove the symlinks that have been
created.
