# [uv](https://docs.astral.sh/uv/)

## Install

For MacOS and Linux, as recommanded by the
[standalone installer guide](https://docs.astral.sh/uv/getting-started/installation/#standalone-installer),
run the following command:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

> [!IMPORTANT]
>
> Since I need to be able to use whatever version of `uv` a Python project requires, I avoid
> installing `uv` with a package manager like Homebrew (where you can only access the latest version
> of a package). That way, I can use the `uv self update ...` command to change `uv`'s own version.

## Shell completions

As recommanded by the
[shell autocompletion guide](https://docs.astral.sh/uv/getting-started/installation/#shell-autocompletion)
but adapted to the standard `~/.zfunc/` completion directory approach for zsh, run the following
commands:

```bash
mkdir -p ~/.zfunc
uv generate-shell-completion zsh > ~/.zfunc/_uv
uvx --generate-shell-completion zsh > ~/.zfunc/_uvx
```
