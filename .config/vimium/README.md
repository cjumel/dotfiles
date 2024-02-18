# [Vimium](https://github.com/philc/vimium)

For Chromium-based web browsers (like Google Chrome or Arc Browser), I use the Vimium extension to
enable Vim motions. This enables me to switch from Neovim to a web browser and keep using the same
keymaps for simple navigation. I don't use it for longer/more complex navigation, like when I'm
simply scrolling the web, though, as the mouse is still more convenient in this case.

## Configuration

Vimium doesn't support confiuration file, therefore the confiuration needs to be manually copy &
pasted to the extension's option page (e.g. by pressing `?` in the web browser if the extension is
enabled and then clicking on "Options") in the relevant section (don't forget to click on "Save
changes" afterwards). In Arc Browser, this must be done for each different profile.

<details>
<summary>Custom key mappings</summary>

```
# Disable all default mappings
# I don't use many mappings and several default mappings don't work as intented in my browser
unmapAll

# Vim-like crolling
map j scrollDown
map k scrollUp
map h scrollLeft
map l scrollRight
map gg scrollToTop
map G scrollToBottom
map <C-d> scrollPageDown
map <C-u> scrollPageUp
map <C-f> scrollFullPageDown
map <C-b> scrollFullPageUp

# Clicking
map <enter> LinkHints.activateMode
map <C-m> LinkHints.activateMode
map <S-enter> LinkHints.activateModeToOpenInNewTab

# Other
map ? showHelp
```

</details>

<details>
<summary>Characters used for link hints</summary>

```
hgjfkdlsmqyturieozpabvn
```

</details>

<details>
<summary>Settings set in the web browser (Arc Browser)</summary>

- `<C-j>` & `<C-k>` are mapped to next & previous tab, respectively (Vimium's `nextTab` &
  `previousTab` follow a kind of most recent tab behavior I don't want, see this
  [issue](https://github.com/philc/vimium/issues/4230))
- `<C-h>` & `<C-l>` are mapped to previous & next profile, respectively
- `<C-o>` & `<C-i>` are mapped to go back & forward, respectively
- I use the web browser's `<M-t>` instead of Vimium's `createTab` to open a new tab, as when using
  the latter, the new tab is blank without even a search bar
- I use the web browser's `<M-w>` instead of Vimium's `removeTab` to close a tab, as when using the
  latter, the tab can't be re-opened neither with the web browser feature nor with Vimium's one

</details>
