# [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

Karabiner is an amazing tool for MacOS, enabling simple but powerful system-wide keyboard behavior
customization. It is essential in my workflow in order to:

- customize the keyboard layout to better fit my needs by:

  - overloading the Caps Lock key with Escape,

  - overloading the Home Row keys ("f", "d", "s", "q", "j", "k", "l", "m") with modifiers when hold,

  > [!TIP]
  >
  > This has been entirely motivated by this
  > [YouTube video](https://www.youtube.com/watch?v=sLWQ4Gx88h4&t=913s) of the excellent
  > [Dreams of Code](https://www.youtube.com/@dreamsofcode), and the setup was largely helped by
  > posts on this [GitHub issue](https://github.com/pqrs-org/Karabiner-Elements/issues/3559) on the
  > matter.

  > [!NOTE]
  >
  > There is a small issue with Home Row Mods with the builtin Macbook keyboard in some generations:
  > when using Command and Shift with the right hand Home Row Modifiers ("j" and "m"), the "f", "d",
  > "s" and "q" keys don't send any event to Karabiner, and thus are not working. This phenomenon
  > doesn't appear on external keyboards, so it's not a big deal for me. This is very likely related
  > to this [issue](https://github.com/pqrs-org/Karabiner-Elements/issues/3113).

  - and making number keys output symbols when alone and numbers when combined with Shift,

- and make my non-Apple external keyboard behave exactly like my Apple keyboards.

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

```bash
ln -s ~/dotfiles/.config/karabiner/assets ~/.config/karabiner/assets
```

Then, open the Karabiner-Elements GUI, and import any desired rule in the "Complex Modifications"
section.

Or, to set up all my mappings without using `stow`, you can create a symbolic link from the
`.config/karabiner/karabiner.json` file to `~/.config/karabiner/karabiner.json` with the following
command:

```bash
ln -s ~/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```
