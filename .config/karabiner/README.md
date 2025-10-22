# [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

Karabiner is an amazing tool for MacOS, enabling simple but powerful system-wide keyboard behavior
customization. It is essential in my workflow in order to:

- make my non-Apple keyboard behave like my Apple keyboards, by fixing the modifier keys, the
  function keys and some special characters

- simplify typing some important special characters (e.g. I made typing the `~` character only take
  two key strokes instead of three)

- create more complex, but essential, remappings, see below for more details

Since I'm working a lot within my terminal, I also defined some keybindings directly in the set up
of my terminal, Wezterm, which you can find [here](config/wezterm/keys.lua).

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
command:

```shell
ln -s ~/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

## Complex Remappings

### Caps Lock

I defined [here](.config/karabiner/assets/complex_modifications/caps_lock.json) a remapping of the
Caps Lock key, in order to overload it with Escape and optionally Control, since its default
behavior is not super useful compared to those keys. With this, I can use the Caps Lock key as
followed:

- when tapped, it acts as Escape
- when hold, it acts as Control (optional)
- when tapped while holding Shift, it acts as Caps Lock

This remapping is really essential for me when working in a terminal and in Neovim, as the Control
and the Escape keys become of paramount importance in these contexts. However, when using the Home
Row Mods described below, using Caps Lock as Control becomes less useful so I don't use it then.

I found the basic version of this remapping in a random GitHub Gist, while looking into the subject,
and then improved it. A simpler version is covered by this
[video](https://www.youtube.com/watch?v=XuQVbZ0wENE) of the excellent
[Dreams of Code](https://www.youtube.com/@dreamsofcode).

### Home Row Mods

#### Description

I defined [here](.config/karabiner/assets/complex_modifications/home_row_mods.json) an even more
complex remapping, which overloads the 8 main home row keys ("f", "d", "s", "q" for the
left-hand-side, and "j", "k", "l", "m" for the right-hand-side) with all the modifiers (Control,
Option, Command, Shift) when hold, while keeping the original behavior when tapped. This has two
small disadvantages: it adds a notion of timing when typing keys (which can lead to some errors when
typing some combinations too fast for instance) and a bit of general keyboard complexity, but it has
the amazing advantage of making all modifiers available under each hand directly in the home row.
This makes typing a lot of key combinations simpler, sometimes quite radically (like `<C-w>` which
I've always hated to type until then).

Contrary to the Caps Lock remapping, I don't find this remapping completly essential (in the sense
that one can live without it), but it's a really great addition which I am actually using, given
some time to get used to it and create muscle memory.

This remapping has been entirely motivated by this
[video](https://www.youtube.com/watch?v=sLWQ4Gx88h4&t=913s) of the excellent
[Dreams of Code](https://www.youtube.com/@dreamsofcode), and the Karabiner setup was largely helped
by posts on this [issue](https://github.com/pqrs-org/Karabiner-Elements/issues/3559) on the matter.

> [!NOTE]
>
> There is a small issue with Home Row Mods with the builtin Macbook keyboard: when using Command
> and Shift with the right hand Home Row Modifiers ("j" and "m"), the "f", "d", "s" and "q" keys
> don't send any event to Karabiner, and thus are not working. Note that this phenomenon doesn't
> appear on external keyboards, so it's not a big deal for me. This is very likely related to this
> [issue](https://github.com/pqrs-org/Karabiner-Elements/issues/3113).

This remapping exists in two versions: a base one with all individual key remappings, and one which
adds additional simultaneous mappings. The later comes with a small disadvantage, as it adds a small
additional delay to trigger the hold behaviors, but it makes possible to type directly combinations
of several modifiers (like Command+Control+Option) without having to pause between each key to
trigger the hold behavior.

#### Parameters

To use Home Row Mods, I set in `Parameters`:

```text
to_if_held_down_threshold_milliseconds: 150
to_delayed_action_delay_milliseconds: 150
```
