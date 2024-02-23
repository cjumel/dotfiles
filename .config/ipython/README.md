# [IPython](https://ipython.org/documentation.html)

IPython is an improved Python console, providing many useful features by default, like
auto-completion, or syntax highlighting.

By default, IPython is enabled in this configuration, so you need to install it for this to work.
Alternatively, you can entirely disable its setup (for instance if you're working on a remote
machine and don't want to bother with this). See below for details on how to do either option.

**Install:**

IPython can be installed on the global system, however it might work better if it's installed within
the Python environment you wish to use.

<details>
<summary>MacOS</summary>

```shell
brew install ipython
```

</details>

**Disable:**

To disable IPython's setup, simply delete the `.config/ipython/` directory. If you've run the `make`
command already, also remove the `~/.config/ipython/` directory to remove the symlinks that have
been created.
