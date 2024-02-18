# [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

Karabiner is a very powerful tool for MacOS to change the behavior of keyboards. It is essential in
my workflow in order to:

- make my non-Apple keyboard behave exactly like an Apple keyboard to make all my keyboards
  consistent with each other
- switch some important keys with less important ones to make the former more accessible
- simplify some key combinations to perform less key strokes or to perform them more easily

In my opinion, the most essential remappings I do with Karabiner are the ones done in the GUI (in
Simple Modifications -> For all devices) as following:

- Caps Lock -> Left Control
- Left Control -> Tab
- Tab -> Escape
- Escape -> Caps Lock

This enables me to access a lot more easily both the left control and escape keys.

Since I'm working a lot within my terminal, I also define some keybindings directly in my terminal
setup, which you can fine [here](/.config/wezterm/).

**Install:**

Karabiner only needs to be installed on my machine, a Macbook.

<details>
<summary>MacOS</summary>

```shell
brew install --cask karabiner-elements
```

</details>
