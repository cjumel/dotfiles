" Vimium configuration
"
" The following Vimium configuration needs to be copy/pasted manually in
" various sections of the Vimium options to be used

" [[ Keymaps ]]

unmapAll

" Scrolling
map h scrollLeft
map j scrollDown
map k scrollUp
map l scrollRight
map d scrollPageDown
map u scrollPageUp
map f scrollFullPageDown
map b scrollFullPageUp
map gg scrollToTop
map G scrollToBottom

" Navigation
" s/S to open links is similar to cursor navigation in hop.nvim
map s LinkHints.activateMode
map S LinkHints.activateModeToOpenInNewTab
map o goBack
map i goForward
map ] nextTab
map [ previousTab

" Tab management
map t createTab
map T restoreTab
map r reload
map y copyCurrentUrl
map p openCopiedUrlInCurrentTab
map P openCopiedUrlInNewTab
map q removeTab
map gd duplicateTab
map gm toggleMuteTab
map gp togglePinTab

" Vim modes
map / enterFindMode
map n performFind
map N performBackwardsFind

map ? showHelp

" [[ Link Hint Characters ]]

hgjfkdlsayturieowpqnbmvc
