# MacOS

- In `Keyboard > Keyboard Shortcuts...`:
  - Dock:
    - Turn Dock hiding on/off: ctrl+cmd+d
  - Mission control:
    - Show notification center: ctrl+cmd+n
  - Input Sources:
    - Select the previous input source: unset
    - Select next input source: unset
  - Screenshots:
    - Save picture of a screen as a file: ctrl+shift+command+3
    - Copy picture of a screen to the clipboard: ctrl+command+3
    - Save picture of selected aera as a file: ctrl+shift+command+4
    - Copy picture of selected area to the clipboard: ctrl+command+4
    - Screenshot and recording options: ctrl+command+5
  - Spotlight:
    - Show Spotligh search: unset
    - Show Finder search window: unset
  - Show Apps: ctrl+cmd+space

- Turn off the press-and-hold key feature which shows an accent menu when holding a key

  ```bash
  defaults write -g ApplePressAndHoldEnabled -bool false
  ```
