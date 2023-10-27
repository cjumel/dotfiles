# Tmux Cheat Sheet

This cheat sheet gathers the keybindings I use actively. They can be either custom or Tmux's default
ones. All these keybindings are only available **within** a Tmux session. I use as prefix
`<C-Space>`.

To see the list of available key bindings, you can press `<prefix>?`.

### Sessions

- `<prefix>d`: dettach from session

### Windows

- `<prefix>w`: windows and sessions preview
- `<prefix>a`: add window (custom)
- `<prefix>r`: rename window (custom)
- `<prefix>p`: previous window
- `<prefix>n`: next window
- `<prefix>q`: kill window (custom)

### Panes

- `<prefix>v`: vertically split pane (custom)
- `<prefix>s`: (horizontally) split pane (custom)
- `<prefix><space>`: toggle between pane layouts
- `<prefix>z`: toggle pane zoom
- `<prefix>b`: break pane into window (custom)
- `<prefix>x`: close pane
- `<C-h/j/k/l>`: switch between panes (custom)
- `<prefix><C-h/j/k/l>`: resize panes (custom)

### Copy Mode

- `<prefix>c`: Enter copy mode (custom)

Within copy mode:

- `h/j/k/l`: move cursor
- `w`: move forward one word at a time
- `b`: move backward one word at a time
- `g`: go to top
- `G`: go to bottom
- `/`: search forward
- `?`: search backward
- `n`: when searching, next keyword occurance
- `N`: when searching, previous keyword occurance
- `v`: begin selection (custom)
- `<C-v>`: toggle rectangle selection (custom)
- `y`: yank selection (custom)
- `q/<CR>`: exit copy mode
