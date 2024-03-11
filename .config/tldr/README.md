# [Tldr](https://github.com/tldr-pages/tldr)

`tldr` is a more user-friendly & synthetic variant to the builtin `man` however it doesn't provide
as much information.

**Install:**

I usually only install `tldr` on my machine, a MacOS.

<details>
<summary>MacOS</summary>

```shell
brew install tldr
```

</details>

**Disable:**

To disable `tldr` setup, simply delete the `.config/tldr/tldr.zsh` file. If you've run the `make`
command already, also remove the `~/.config/tldr/tldr.zsh` symlink which should have been created.
