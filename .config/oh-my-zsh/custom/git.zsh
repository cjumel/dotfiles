alias g='git status --show-stash' # Show the status of the git repository
alias gg='g'                      # Alias to `g`, for when the key is sticky
alias ggg='g'                     # Alias to `g`, for when the key is sticky

alias gb='git branch'           # List local branches
alias gba='git branch --all'    # List both local & remote branches
alias gbd='git branch -d'       # Delete a local branch but fail if not merged
alias gbdf='git branch -D'      # Force delete a local branch (delete it even if not merged)
alias gbr='git branch --remote' # List remote branches

alias gca='git commit --amend'                         # Amend last commit with the staged changes
alias gcan='git commit --amend --no-edit'              # Amend last commit with the staged changes with no message edit
alias gcas='git commit --amend --no-verify'            # Amend last commit with the staged changes & skip commit hooks
alias gcans='git commit --amend --no-edit --no-verify' # Amend last commit with the staged changes with no message edit & skip commit hooks

# Add a "c" for create, to make this the same as in Neovim plugin Neogit
alias gcc='git commit'                         # Create commit
alias gccn='git commit --no-edit'              # Create commit with no message edit
alias gccs='git commit --no-verify'            # Create commit & skip commit hooks
alias gccns='git commit --no-edit --no-verify' # Create commit with no message edit & skip commit hooks

alias gcf='git commit --message "🚧 FIXUP"' # Create a fixup commit

alias gcl='git clone'         # Clone a repository
alias gclb='git clone --bare' # Clone a repository as a bare repository

alias gcw='git commit --no-verify --message "🚧 WIP [skip ci]"' # Create a work-in-progress commit

alias gd='git diff'      # Show changes between commits, commit and working tree, etc.
alias gdt='git difftool' # Show changes between commits, commit and working tree, etc. using a difftool

alias gf='git fetch'           # Fetch the remote repository
alias gfp='git fetch --prune'  # Fetch & remove unused remote branches
alias gfu='git fetch upstream' # Fetch the remote repository upstream branch (useful to update forks)

alias gl='git lg' # Show the commit log

alias gpl='git pull' # Fetch the remote repository & merge it into the current branch

alias gps='git push'                 # Push the current branch to the remote repository
alias gpsf='git push --force'        # Force push the current branch to the remote repository
alias gpsu='git push --set-upstream' # Set the upstream of a local branch and push it (not needed if `autoSetupRemote` is `true`)

alias grb='git rebase'                                          # Rebase the current branch on top of another branch
alias grbo='git rebase --strategy-option=theirs'                # Rebase the current branch on top of another branch & overwrite conflicting changes
alias grbi='git rebase --interactive'                           # Interactively rebase the current branch on top of another branch
alias grbio='git rebase --interactive --strategy-option=theirs' # Interactively rebase the current branch on top of another branch & overwrite conflicting changes
alias grba='git rebase --abort'                                 # Abort a rebase in progress
alias grbc='git rebase --continue'                              # Continue a rebase in progress
alias grbs='git rebase --skip'                                  # Skip a commit during a rebase in progress

alias grm='git rm'           # Remove a file from the repository and the file system
alias grmc='git rm --cached' # Remove a file from the reposiory but not from the file system

# `reset` can be used in 3 forms: with nothing (target all tracked files/directories), with a path (target the corresponding tracked
# files/directories), or with a commit reference, and with 3 modes: mixed (unstage & keep the changes), soft (keep the changes as staged),
# and hard (unstage & discard the changes)
function git_reset_last() {
    git reset --mixed HEAD~"$1"
}
function git_reset_soft_last() {
    git reset --soft HEAD~"$1"
}
function git_reset_hard_last() {
    git reset --hard HEAD~"$1"
}
alias grs='git reset'             # Mixed reset the targeted files/directories or commit(s)
alias grsl='git_reset_last'       # Mixed reset a number of the last commits
alias grss='git reset --soft'     # Soft reset the targeted commit(s)
alias grssl='git_reset_soft_last' # Soft reset a number of the last commits
alias grsh='git reset --hard'     # Hard reset the targeted commit(s)
alias grshl='git_reset_hard_last' # Hard reset the last $1 commit(s)

alias grv='git revert'             # Revert the targeted commit(s)
alias grvl='git revert HEAD'       # Revert the last commit
alias grva='git revert --abort'    # Abort a revert in progress
alias grvc='git revert --continue' # Continue a revert in progress
alias grvs='git revert --skip'     # Skip a commit during a revert in progress

alias gs='git stage'         # Stage the targeted files
alias gsa='git add --all'    # Stage all the files
alias gsu='git add --update' # Stage all the unstaged files (not untracked ones)

alias gsh='git stash'                      # Stash local changes in tracked files
alias gsha='git stash apply'               # Apply the last stash entry
alias gshc='git stash clear'               # Clear all the stash entries
alias gshd='git stash drop'                # Drop one stash entry (last one by default)
alias gshi='git stash --include-untracked' # Like `git stash` but include untracked files
alias gshl='git stash list'                # List all the stash entries
alias gshp='git stash pop'                 # Like `git stash apply` but remove the applied stash entry if applied without conflict

alias gso='git show' # Show various types of objects

alias gsw='git switch'           # Switch to a branch by its name
alias gswc='git switch --create' # Create & switch to a new branch
alias gswp='git switch -'        # Switch to the previous branch

alias gt='git tag'
alias gtd='git tag --delete'          # Delete the provided tag locally
alias gtdr='git push --delete origin' # Delete the provided tag remotely
alias gtp='git push --tags'           # Push all local tags

alias gw='git worktree'         # Base command for git worktree
alias gwa='git worktree add'    # Add a new worktree
alias gwl='git worktree list'   # List all the worktrees
alias gwr='git worktree remove' # Remove a worktree

alias gu='git restore --staged' # (git unstage) Unstage the targeted files
alias gua='git reset'           # (git unstage --all) Unstage all the files

alias gx='git restore'       # (git discard) Discard the changes of the targeted files
alias gxu='git clean -dn'    # (git discard --untracked) Dry-run to discard untracked files (except ignored)
alias gxuf='git clean -df'   # (git discard --untracked --force) Force discard untracked files (except ignored)
alias gxui='git clean -di'   # (git discard --intracked --interactive) Interactively discard untracked files (except ignored)
alias gxua='git clean -dxn'  # (git discard --untracked --all) Dry-run to discard all untracked files
alias gxuaf='git clean -dxf' # (git discard --untracked --all --force) Force discard all untracked files
alias gxuai='git clean -dxi' # (git discard --untracked --all --interactive) Interactively discard all untracked files
