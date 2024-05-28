# [[ Status ]]

alias g='git status --show-stash' # Show the status of the git repository, including about the stash
alias gg='g'                      # Alias to `g`, for when the key is sticky
alias ggg='g'                     # Alias to `g`, for when the key is sticky

# [[ Branch ]]

alias gb='git branch'           # Branch: list local branches
alias gbr='git branch --remote' # Branch remote: list remote branches
alias gba='git branch --all'    # Branch all: list local & remote branches

alias gbd='git branch --delete'          # Branch delete: delete a local branch
alias gbdf='git branch --delete --force' # Branch delete force: delete a local branch even if not merged

# [[ Clone ]]

alias gcl='git clone'         # Clone: clone a repository
alias gclb='git clone --bare' # Clone bare: clone a repository as a bare repository (useful when working with git worktrees)

# [[ Commit ]]

# Add a "c" for create, for consistency with Neogit & to avoid conflicts with other `gc` aliases
alias gcc='git commit'              # Commit create: create a regular commit
alias gccf='git commit --no-verify' # Commit create: create a regular commit without running Git hooks

alias gca='git commit --amend'              # Commit amend: add staged changes to last commit
alias gcaf='git commit --amend --no-verify' # Commit amend force: add staged changes to last commit without running Git hooks

function git_commit_fixup() {
    git reset --message "fixup! $1"
}
function git_commit_fixup_force() {
    git reset --message "fixup! $1" --no-verify
}
alias gcf='git_commit_fixup'        # Commit fixup: create a fixup commit
alias gcff='git_commit_fixup_force' # Commit fixup force: create a fixup commit without running Git hooks

alias gcw='git commit --message "🚧 WIP [skip ci]"'              # Commit WIP: create a WIP commit not triggering any CI stuff
alias gcwf='git commit --message "🚧 WIP [skip ci]" --no-verify' # Commit WIP force: create a WIP commit not triggering any CI stuff without running Git hooks

# [[ Diff ]]

alias gd='git diff'      # Diff: show changes between commits, commit and working tree, etc.
alias gdt='git difftool' # Difftool: show changes between commits, commit and working tree, etc. using a difftool

# [[ Fetch ]]

alias gf='git fetch'           # Fetch: download objects and refs from the remote repository
alias gfp='git fetch --prune'  # Fetch prune: download objects and refs from the remote repository & remove refs to deleted remote branches
alias gfu='git fetch upstream' # Fetch upstream: download objects and refs from the upstream repository (useful to update forks)

# [[ Init ]]

alias gi='git init' # Init: create a new local Git repository

# [[ Log ]]

alias gl='git lg'   # Log: show the commit log using in the short log format
alias gll='git log' # Log long: show the commit log using the long log format

# [[ Pull ]]

alias gpl='git pull' # Pull: download objects and refs from the remote repository & merge them into the current branch

# [[ Push ]]

alias gps='git push'                  # Push: upload the current branch to the remote repository
alias gpsf='git push --force'         # Push force: upload the current branch to the remote repository & overwrite any conflicting changes
alias gpsu='git push --set-upstream'  # Push upstream: upload the current branch to the remote repository and set the relevant upstream if neede (not needed if `autoSetupRemote` is `true`)
alias gpst='git push --tags'          # Push tags: upload the current branch & all local tags to the remote repository
alias gpsd='git push --delete origin' # Push delete: delete the listed ref (e.g. tag) from the remote repository

# [[ Rebase ]]

alias grb='git rebase --autostash'                           # Rebase: apply the current branch changes on top of another branch
alias grbi='git rebase --autostash --interactive'            # Rebase interactive: apply the current branch selected changes & actions on top of another branch
alias grbo='git rebase --autostash --strategy-option=theirs' # Rebase overwrite: apply the current branch changes on top of another branch & overwrite conflicting changes

alias grba='git rebase --abort'    # Rebase abort: stop a rebase in progress
alias grbc='git rebase --continue' # Rebase continue: continue a rebase in progress
alias grbs='git rebase --skip'     # Rebase skip: skip a commit's changes during a rebase in progress

# [[ Remove ]]

alias grm='git rm'           # Remove: delete a file from the Git repository and the file system
alias grmc='git rm --cached' # Remove cached: delete a file from the Git repository but not from the file system

# [[ Reset ]]
# `reset` can be used in 3 forms:
#   - with nothing (target all tracked files/directories),
#   - with a path (target the corresponding tracked files/directories),
#   - or with a commit reference.
# It can also be used with 3 modes:
#   - mixed (unstage & keep the changes),
#   - soft (keep the changes as staged),
#   - or hard (unstage & discard the changes).
# I only use `git reset` to act on commits, as I prefer to use the `git unstage` & `git discard` aliases (they are not actual Git
# keywords) for files and directories

function git_reset_last() {
    git reset --mixed HEAD~"$1"
}
function git_reset_soft_last() {
    git reset --soft HEAD~"$1"
}
function git_reset_hard_last() {
    git reset --hard HEAD~"$1"
}
alias grs='git reset'             # Reset: undo & unstage the targeted commit(s), or unstage the targeted files' changes
alias grsl='git_reset_last'       # Reset last: undo & usntage a number of the last commits (default to 1)
alias grss='git reset --soft'     # Reset soft: undo but keep staged the targeted commit(s)
alias grssl='git_reset_soft_last' # Reset soft last: undo but keep staged a number of the last commits (default to 1)
alias grsh='git reset --hard'     # Reset hard: undo & discard the changes of the targeted commit(s), or discard the targeted files' changes
alias grshl='git_reset_hard_last' # Reset hard last: undo & discard the changes of a number of the last commits (default to 1)

# [[ Revert ]]

alias grv='git revert'       # Revert: create a new commit to undo the targeted commit
alias grvl='git revert HEAD' # Revert: create a new commit to undo the last commit

alias grva='git revert --abort'    # Revert abort: stop a revert in progress
alias grvc='git revert --continue' # Revert continue: resume a revert in progress
alias grvs='git revert --skip'     # Revert skip: skip a commit during a revert in progress

# [[ Stage ]]
# I prefer `git stage` over `git add` for several reasons:
#   - in Gitsigns & Neogit I use "stage" as well, so this is consistent with that ("a", like "add", cannot be used properly with Gitsigns
#       in visual mode with Hydra, due to conflicts with "arround" text-objects)
#   - it's the proper term for staging changes in Git
#   - it goes well with the "unstage" alias I define below & which is used in Gitsigns & Neogit

alias gs='git stage'           # Stage: add the targeted files' changes to the staging area
alias gsu='git stage --update' # Stage update: add the tracked files' changes to the staging area
alias gsa='git stage --all'    # Stage all: add all files' changes to the staging area

# [[ Show ]]

alias gso='git show' # Show: give details on the targeted object (commit, tag, etc.)

# [[ Switch ]]

alias gsw='git switch'           # Switch: change the current local branch to a new one
alias gswc='git switch --create' # Switch create: create a new branch & change the current local branch to it
alias gswp='git switch -'        # Switch previous: change the current local branch back to the previous one

# [[ Tag ]]

alias gt='git tag'           # Tag: create a local tag
alias gtd='git tag --delete' # Tag delete: delete a local tag

# [[ Unstage ]]
# `git unstage` is not an actual command, but I introduced it for several reasons:
#  - in Gitsigns & Neogit I use "unstage" as well, so this is consistent with that
#  - since theere is a "git stage" command, it makes sense to have a corresponding "git unstage" alias
#  - it reduces the burden on the "gr" aliases, as alternatives would involve "git restore" or "git reset"

alias gu='git restore --staged'     # Unstage: remove from the staging area the targeted files' changes
alias gua='git restore --staged :/' # Unstage all: remove from the staging area all the changes

# [[ Worktree ]]
# I don't use worktrees, but I gave it a try at some point so I'm keeping the aliases just in case they become handy again

alias gw='git worktree'         # Worktree: base command for Git worktrees
alias gwa='git worktree add'    # Worktree add: create a new worktree
alias gwl='git worktree list'   # Worktree list: list all existing worktrees
alias gwr='git worktree remove' # Worktree remove: delete a worktree

# [[ Discard ]]
# `git discard` is not an actual command, but I introduced it for several reasons:
#   - in Gitsigns & Neogit I use "x" for discard as well, so this is consistent with that
#   - it's in my opinion the proper term for discarding changes in Git
#   - it reduces the burden on the "gr" & "gc" aliases, as alternatives would involve "git restore" or "git clean"

alias gx='git restore'       # Discard: throw away the unstaged changes of the targeted tracked files
alias gxa='git restore :/'   # Discard all: throw away all unstaged changes in tracked files
alias gxu='git clean -dn'    # Discard untracked: dry-run to discard untracked, not ignored files
alias gxuf='git clean -df'   # Discard untracked force: actually discard untracked, not ignored files
alias gxui='git clean -di'   # Discard intracked interactive: interactively discard untracked, not ignored files
alias gxua='git clean -dxn'  # Discard untracked all: dry-run to discard all untracked files
alias gxuaf='git clean -dxf' # Discard untracked all force: actually discard all untracked files
alias gxuai='git clean -dxi' # Discard untracked all interactive: interactively discard all untracked files

# [[ Stash ]]
# I use `gz` as prefix for `git stash` aliases to avoid any conflict with `git stage` which I use a lot & because this is consistent
# with Neogit

alias gz='git stash'                      # Stash: move local changes in tracked files to the stash
alias gzu='git stash --include-untracked' # Stash with untracked: move local changes in tracked & untracked files to the stash

alias gza='git stash apply' # Stash apply: copy the stash changes to the local files
alias gzc='git stash clear' # Stash clear: remove all the stash entries
alias gzd='git stash drop'  # Stash drop: remove one stash entry (default to the last)
alias gzl='git stash list'  # Stash list: list the stash entries
alias gzp='git stash pop'   # Stash pop: move the statsh changes to the local files (or copy them if there is any conflict)
