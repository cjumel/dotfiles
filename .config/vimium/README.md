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
    # Use s/S to search and click a link instead of f/F (like s key in EasyMotion or Hop.nvim)
    unmap f
    unmap F
    map s LinkHints.activateMode
    map S LinkHints.activateModeToOpenInNewTab
    # Use ,/; to scroll half page up/down
    map , scrollPageDown
    map ; scrollPageUp
    # Disable mappings that don't work well
    # J/K follow a kind of most recent tab behavior, see https://github.com/philc/vimium/issues/4230
    unmap J
    unmap K
    # Since I remapped J/K to <C-J>/<C-K> in the browser, let's do the same for H/L
    unmap H
    unmap L
    # x works but tabs closed with it can't be restored with neither regular keymap nor X
    unmap x
    unmap X
    unmap t
    ```
</details>

<details>
    <summary>Characters used for link hints</summary>
    ```
    hgjfkdlsmqyturieozpabvn
    ```
</details>
