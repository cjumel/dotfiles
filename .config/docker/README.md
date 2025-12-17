# [Docker](https://www.docker.com/)

## Install

For MacOS, Linux or Windows, install Docker Desktop following it's
[installation guide](https://docs.docker.com/get-started/introduction/get-docker-desktop/).

> [!NOTE]
>
> Even though I don't really use the Docker Desktop application, I haven't find any other way to
> install the Docker CLI alone.

## Shell completions

As recommanded by the
[shell autocompletion guide](https://docs.docker.com/engine/cli/completion/#zsh) but adapted to the
standard `~/.zfunc/` completion directory approach for zsh, run the following commands:

```bash
mkdir -p ~/.zfunc
docker completion zsh > ~/.zfunc/_docker
```
