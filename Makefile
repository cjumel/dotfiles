symlinks:
	stow --no-folding --adopt .

clean-completion-cache:
	rm -f ~/.zcompdump
