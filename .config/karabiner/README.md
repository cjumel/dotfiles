# [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

Karabiner is an amazing tool for MacOS, enabling simple but powerful system-wide keyboard behavior
customization. It is essential in my workflow in order to:

- make some essential keys easier to access (I typically made the control and escape keys a lot
  simpler to access while not losing any other key, by mapping combination of caps lock and any key
  to control and the key, caps lock used alone to escape, and combination of shift and caps lock to
  actual caps lock; in my opinion, this is a really game changer)

- simplify typing some character (e.g. I made typing the `~` character only take two key strokes
  instead of three)

- make my non-Apple keyboard behave exactly like an Apple keyboard (e.g. I fixed the modifiers keys,
  as well as some function keys and special characters)

Since I'm working a lot within my terminal, I also defined some keybindings directly in the set up
of my terminal, Wezterm, which you can fine [here](/.config/wezterm/).

## Install

I try to avoid installing GUI applications with Homebrew, as I don't really like how the versioning
can get out of synchronization when updating the application through the GUI (or worse, with
auto-updates, enabled on many applications). Thus, to install Karabiner, I simply followed the
[installation guide](https://karabiner-elements.pqrs.org/docs/getting-started/installation/).

## Configuration

If you used the `stow` command described in the main [README.md](/README.md) file, Karabiner should
be already set up with all my custom mappings.

Otherwise, to manually set up some of my mappings, create a symbolic link from the
`.config/karabiner/assets` directory to `~/.config/karabiner/assets` with the following command:

```shell
ln -s ~/dotfiles/.config/karabiner/assets ~/.config/karabiner/assets
```

Then, open the Karabiner-Elements GUI, and import any desired rule in the "Complex Modifications"
section.

Or, to set up all my mappings without using `stow`, you can create a symbolic link from the
`.config/karabiner/karabiner.json` file to `~/.config/karabiner/karabiner.json` with the following
comaand:

```shell
ln -s ~/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```
