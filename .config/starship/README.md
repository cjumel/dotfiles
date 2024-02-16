# [Starship](https://starship.rs/)

I use Starship as an improved terminal prompt. It brings many additional features compared to
Oh-my-zsh's one, along with an improved look and without any sacrifice in performance, being written
in Rust. It is comparable to [Powerlevel10k](https://github.com/romkatv/powerlevel10k), which I used
to use before, but it is faster and a lot easier to configure.

By default, Starship is enabled in this configuration, so you need to install it for this to work.
Alternatively, you can entirely disable its setup (for instance if you're working on a remote
machine and don't want to bother with this). See below for details on how to do either option.

**Install:**

<details>
<summary>MacOS</summary>

```shell
brew install starship
```

</details>

**Disable:**

To disable Starship setup, simply delete the `.config/starship/` directory. If you've run the `make`
command already, also remove the `~/.config/starship/` directory to remove the symlinks that have
been created.
