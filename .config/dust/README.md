# [Dust](https://github.com/bootandy/dust)

`dust` is my go-to tool to clean up disk space on my machine. I use it as a drop-in replacement of
the builtin `du`.

**Install:**

I usually only install `dust` on my machine, a MacOS.

<details>
<summary>MacOS</summary>

```shell
brew install dust
```

</details>

**Disable:**

To disable `dust` setup, simply delete the `.config/dust/dust.zsh` file. If you've run the `make`
command already, also remove the `~/.config/dust/dust.zsh` symlink which should have been created.
