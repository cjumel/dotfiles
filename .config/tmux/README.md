# [Tmux](https://github.com/tmux/tmux)

Tmux is part of my daily workflow, to manage sessions, panes (terminal split screens), a terminal
copy mode, or persistent jobs for instance. It is all the more convenient that all these features
are also accessible on remote machines if Tmux is installed and started on one.

**Requirements:**

- [Git](https://git-scm.com/) to clone [TPM](https://github.com/tmux-plugins/tpm), Tmux Plugin
  Manager

**Install:**

<details>
<summary>MacOS</summary>

```shell
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start Tmux with the command `tmux` for instance, press `<prefix>I` to install Tmux plugins
(prefix is `<C-space>` in this configuration), and restart Tmux with `exit` and then `tmux` for
instance.

</details>
<details>
<summary>Ubuntu</summary>

```shell
apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start Tmux with the command `tmux` for instance, press `<prefix>I` to install Tmux plugins
(prefix is `<C-space>` in this configuration), and restart Tmux with `exit` and then `tmux` for
instance.

</details>
