alias g='git status'

alias ga='git add'
alias gaa='git add --all'    # Add all files, both tracked & untracked
alias gau='git add --update' # Add all tracked files

alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'          # Delete a local branch
alias gbdf='git branch --delete --force' # Force delete a local branch (overcome warnings preventing the deletion)
alias gbr='git branch --remote'          # Act on remote branches

alias gca='git commit --amend'                         # Amend commit by adding the staged changes to it
alias gcaf='git commit --amend --no-verify'            # Amend & skip hooks
alias gcan='git commit --amend --no-edit'              # Amend & skip commit message
alias gcanf='git commit --amend --no-edit --no-verify' # Amend & skip commit message & hooks

alias gcf='git commit --message "🚧 FIXUP"' # Fixup commit (to be squashed later with another commit)

alias gcle='git clean'         # Do nothing without any option
alias gclef='git clean -f'     # Clean untracked files in target directory
alias gclefx='git clean -fx'   # Clean untracked files in target directory, including ignored
alias gclefd='git clean -fd'   # Clean untracked files in target directory & sub-directories
alias gclefdx='git clean -fdx' # Clean untracked files in target directory & sub-directories, including ignored

alias gclo='git clone'
alias gclob='git clone --bare' # Clone only the .git directory (useful for git worktrees)

alias gcm='git commit'                         # Create commit
alias gcmf='git commit --no-verify'            # Create & skip hooks
alias gcmn='git commit --no-edit'              # Create & skip commit message (useful with gitmoji)
alias gcmnf='git commit --no-edit --no-verify' # Create & skip commit message & hooks

alias gcn='git config'
alias gcng='git config --global'

alias gco='git checkout'
alias gcod='git checkout --' # Discard the changes of the targeted files

alias gcp='git cherry-pick' # Apply the changes introduced by some existing commits

alias gcw='git commit --no-verify --message "🚧 WIP"' # WIP commit

alias gd='git diff' # Show changes between commits, commit and working tree, etc.
alias gdt='git difftool'

alias gf='git fetch'           # Fetch the remote repository
alias gfp='git fetch --prune'  # Fetch & remove unused remote branches
alias gfu='git fetch upstream' # Fetch the remote repository upstream branch (useful to update forks)

alias gl='git lg'

alias gpl='git pull'

alias gps='git push'
alias gpsf='git push --force'
alias gpsu='git push --set-upstream' # Set the upstream of a local branch and push it (needed iff autoSetupRemote is not True)

alias grb='git rebase'
alias grbo='git rebase --strategy-option=theirs' # Overwrite conflicting changes (reversal with the option is on purpose)
alias grbi='git rebase --interactive'
alias grbio='git rebase --interactive --strategy-option=theirs' # Overwrite conflicting changes (reversal with the option is on purpose)

# Actions during rebase:
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias grm='git rm'           # Remove a file from the repository and the file system
alias grmc='git rm --cached' # Remove a file from the reposiory but not from the file system

# Reset have 3 modes:
# - mixed (default): unstage & keep the changes
# - soft: keep as staged & keep the changes
# - hard: unstage & discard the changes
# Reset can be used in 3 forms:
# - with nothing, reset all the tracked files and directories in the index
# - with a path, reset the targeted tracked files and directories
# - with a commit, undo the targeted commit(s) & reset their changes
alias grs='git reset'
function git_reset_last() {
    git reset --mixed HEAD~$1
}
alias grsl='git_reset_last' # Mixed reset the last $1 commit(s)
alias grss='git reset --soft'
function git_reset_soft_last() {
    git reset --soft HEAD~$1
}
alias grssl='git_reset_soft_last' # Soft reset the last $1 commit(s)
alias grsh='git reset --hard'
function git_reset_hard_last() {
    git reset --hard HEAD~$1
}
alias grshl='git_reset_hard_last' # Hard reset the last $1 commit(s)

alias grt='git restore'           # Discard the changes of the targeted unstaged files
alias grts='git restore --staged' # Like `git restore` but unstage the targeted staged files

alias grv='git revert'
alias grvl='git revert HEAD' # Revert the last commit

# Actions during revert:
alias grva='git revert --abort'
alias grvc='git revert --continue'
alias grvs='git revert --skip'

alias gs='git status'

alias gsh='git stash'                      # Stash local changes in tracked files
alias gsha='git stash apply'               # Apply the last stash entry
alias gshc='git stash clear'               # Clear all the stash entries
alias gshd='git stash drop'                # Drop one stash entry (last one by default)
alias gshi='git stash --include-untracked' # Like `git stash` but include untracked files
alias gshl='git stash list'
alias gshp='git stash pop' # Like `git stash apply` but remove the applied stash entry if applied without conflict

alias gso='git show' # Show various types of objects

alias gsw='git switch'           # Switch to a branch by its name
alias gswc='git switch --create' # Create & switch to a new branch
alias gswp='git switch -'        # Switch to the previous branch

alias gt='git tag'
alias gtd='git tag --delete'          # Delete the provided tag locally
alias gtdr='git push --delete origin' # Delete the provided tag remotely
alias gtp='git push --tags'           # Push all local tags

alias gw='git worktree'
alias gwa='git worktree add'
alias gwl='git worktree list'
alias gwr='git worktree remove'
