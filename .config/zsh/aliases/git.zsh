# [G]it: a version control system for tracking changes in source code

alias g='gst' # Shortcut for the `gst` (Git status) alias
alias gg='g'  # Same as `g`, in case the key is sticky
alias ggg='g' # Same as `g`, in case the key is sticky

# [[ Branch ]]

alias gb='git branch'           # Branch: list local branches
alias gbr='git branch --remote' # Branch remote: list remote branches
alias gba='git branch --all'    # Branch all: list local & remote branches

alias gbd='git branch --delete'          # Branch delete: delete a local branch
alias gbdf='git branch --delete --force' # Branch delete force: delete a local branch even if not merged

# [[ Commit ]]
# The "h" for "skip hooks" is directly taken from Neogit

# Add a "c" for "create" out of consistency with Neogit & to avoid conflicts with other `gc` aliases
alias gcc='git commit'              # [C]ommit [C]reate: create a commit
alias gcch='git commit --no-verify' # [C]ommit [C]reate, skip [H]ooks: create commit without running commit hooks

alias gca='git commit --amend'                         # [C]ommit [A]mend: amend last commit
alias gcah='git commit --amend --no-verify'            # [C]ommit [A]mend, skip [H]ooks: amend last commit without running commit hooks
alias gcam='git commit --amend --no-edit'              # [C]ommit [A]mend, skip [M]essage: amend last commit without editing the commit message
alias gcamh='git commit --amend --no-edit --no-verify' # [C]ommit [A]mend, skip [M]essage & [H]ooks: amend last commit without editing the commit message or running commit hooks

function git_commit_fixup() {
    git reset --message "fixup! $1"
}
function git_commit_fixup_force() {
    git reset --message "fixup! $1" --no-verify
}
alias gcf='git_commit_fixup'        # [C]ommit [F]ixup: create a fixup commit
alias gcfh='git_commit_fixup_force' # [C]ommit [F]ixup, skip [H]ooks: create a fixup commit without running commit hooks

alias gcw='git commit --message "🚧 WIP [skip ci]" --no-verify' # [C]ommit [W]IP: create a WIP commit without running commit hooks

# [[ Check-ignore ]]

alias gci='git check-ignore'            # [C]heck [I]gnore: if a file is ignored by Git, print its path
alias gciv='git check-ignore --verbose' # [C]heck [I]gnore [V]erbose: if a file is ignored by Git, print its path & the ignore rule

# [[ Clone ]]

alias gcl='git clone'         # [C][L]one: clone a repository
alias gclb='git clone --bare' # [C][L]one [B]are: clone a repository as a bare repository (useful for git worktrees)

# [[ Checkout ]]

alias gco='git checkout' # [C]heck[O]ut: switch to a branch or restore working tree files (e.g. to a specific commit)

# [[ Diff ]]

alias gd='git diff'           # [D]iff: show differences between working tree and staging area (index), i.e. unstaged changes
alias gds='git diff --staged' # [D]iff [S]taged: show differences between staging area (index) and last commit (head), i.e. staged changes

# [[ Fetch ]]

alias gf='git fetch'           # Fetch: download objects and refs from the remote repository
alias gfp='git fetch --prune'  # Fetch prune: download objects and refs from the remote repository & remove refs to deleted remote branches
alias gfu='git fetch upstream' # Fetch upstream: download objects and refs from the upstream repository (useful to update forks)

# [[ Init ]]

alias gi='git init' # Init: create a new local Git repository

# [[ Log ]]

alias gl='git log --oneline --graph --decorate --color' # [L]og: show the commit log using in the short log format
alias gll='git log'                                     # [L]og [L]ong: show the commit log using the long log format

# [[ Pull ]]

alias gpl='git pull' # Pull: download objects and refs from the remote repository & merge them into the current branch

# [[ Push ]]

alias gps='git push'                  # [P]ush: upload the current branch to the remote repository
alias gpsd='git push --delete origin' # [P]ush [D]elete: delete the listed ref (e.g. a tag) from the remote repository
alias gpsf='git push --force'         # [P]ush [F]orce: upload the current branch to the remote repository & overwrite any conflicting changes
alias gpst='git push --tags'          # [P]ush [T]ags: upload the current branch & all local tags to the remote repository
alias gpsu='git push --set-upstream'  # [P]ush [U]pstream: upload the current branch to the remote repository and set the relevant upstream if needed

# [[ Rebase ]]

alias grb='git rebase'                           # [R]e[B]ase: apply the current branch changes on top of another branch
alias grbi='git rebase --interactive'            # [R]e[B]ase [I]nteractive: apply the current branch selected changes & actions on top of another branch
alias grbo='git rebase --strategy-option=theirs' # [R]e[B]ase [O]verwrite: apply the current branch changes on top of another branch & overwrite conflicting changes

alias grba='git rebase --abort'    # [R]e[B]ase [A]bort: stop a rebase in progress
alias grbc='git rebase --continue' # [R]e[B]ase [C]ontinue: continue a rebase in progress
alias grbs='git rebase --skip'     # [R]e[B]ase [S]kip: skip a commit's changes during a rebase in progress

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
# I only use `git reset` to act on commits, as I prefer to use the `git unstage` & `git discard` aliases (they are not actual Git keywords)
# for files and directories

function git_reset_mixed_head() {
    git reset --mixed HEAD~"$1"
}
function git_reset_soft_head() {
    git reset --soft HEAD~"$1"
}
function git_reset_hard_head() {
    git reset --hard HEAD~"$1"
}
alias grsm='git reset --mixed'     # [R]eset [M]ixed: undo & unstage the targeted commit(s), or unstage the targeted files' changes
alias grsmh='git_reset_mixed_head' # [R]eset [M]ixed [H]ead: undo & unstage a number of the last commits (default to 1)
alias grss='git reset --soft'      # [R]eset [S]oft: undo but keep staged the targeted commit(s)
alias grssh='git_reset_soft_head'  # [R]eset [S]oft [H]ead: undo but keep staged a number of the last commits (default to 1)
alias grsh='git reset --hard'      # [R]eset [H]ard: undo & discard the changes of the targeted commit(s), or discard the targeted files' changes
alias grshh='git_reset_hard_head'  # [R]eset [H]ard [H]ead: undo & discard the changes of a number of the last commits (default to 1)

# [[ Revert ]]

function git_revert_head() {
    git revert --no-commit HEAD~"$1"..
    git commit
}
alias grv='git revert'       # [R]e[V]ert: create a new commit to undo the targeted commit
alias grvh='git_revert_head' # [R]e[V]ert [H]ead: create a new commit to undo a number of the last commits (default to 1)

alias grva='git revert --abort'    # Revert abort: stop a revert in progress
alias grvc='git revert --continue' # Revert continue: resume a revert in progress
alias grvs='git revert --skip'     # Revert skip: skip a commit during a revert in progress

# [[ Stage ]]
# I prefer `git stage` over `git add` to add changes to the staging area out of consistency with my Neovim keymaps (for technical reasons,
# "a" can't be used as nicely as "s" in git-related keymaps) and because I find this wording a bit clearer

alias gs='git stage'           # Stage: add the targeted files' changes to the staging area
alias gsu='git stage --update' # Stage update: add the tracked files' changes to the staging area
alias gsa='git stage --all'    # Stage all: add all files' changes to the staging area

# [[ Show ]]

function git_show_head() {
    if [ -z "$1" ]; then
        git show HEAD
    else
        git show HEAD~"$(($1 - 1))" # Use arithmetic expansion to convert input to number
    fi
}
alias gsh='git show'       # [S][H]ow: give details on the targeted object (commit, tag, etc.)
alias gshh='git_show_head' # [S][H]ow [H]ead: give details on the n'th latest commit (default to 1, the latest one)

# [[ Status ]]

alias gst='git status'          # [S][T]atuts: show the Git status of the repository
alias gsts='git status --short' # [S][T]atuts [S]hort: show the status of the repository in shorter format

# [[ Switch ]]

alias gsw='git switch'           # [S][W]itch: switch to a branch
alias gswc='git switch --create' # [S][W]itch [C]reate: create a branch & switch to it
alias gswm='git switch main'     # [S][W]itch [M]ain: switch to the main branch
alias gswms='git switch master'  # [S][W]itch [M]a[S]ter: switch to the master branch
alias gswp='git switch -'        # [S][W]itch [P]revious: switch to the previous branch
alias gsws='git switch staging'  # [S][W]itch [S]taging: switch to the staging branch

# NOTE: "gt" & "gta" are kept free for "graphite"

# [[ Tag ]]

alias gtg='git tag'           # [T]a[G]: create a local tag
alias gtgd='git tag --delete' # [T]a[G] [D]elete: delete a local tag

# [[ Unstage ]]
# `git unstage` is not an actual git command, but I introduced it out of consistency with my Neovim keymaps and because it's a nice &
# simple feature

alias gu='git restore --staged'     # Unstage: remove from the staging area the targeted files' changes
alias gua='git restore --staged :/' # Unstage all: remove from the staging area all the changes

# [[ Worktree ]]

alias gw='git worktree'         # Worktree: base command for Git worktrees
alias gwa='git worktree add'    # Worktree add: create a new worktree
alias gwl='git worktree list'   # Worktree list: list all existing worktrees
alias gwr='git worktree remove' # Worktree remove: delete a worktree

# [[ Discard ]]
# `git discard` is not an actual git command, but I introduced it out of consistency with my Neovim keymaps and because it's a nice &
# simple feature

alias gx='git restore'                     # Discard: discard the unstaged changes of the targeted file(s)
alias gxt='git restore :/'                 # Discard tracked: discard the unstaged changes of all tracked files
alias gxu='git clean -dfq'                 # Discard untracked: discard all untracked but not ignored files
alias gxa='git restore :/; git clean -dfq' # Discard all: discard the unstaged changes of all tracked files & discard all untracked but not ignored files
alias gxi='git clean -dXf'                 # Discard ignored: discard all ignored files
alias gxin='git clean -dXn'                # Discard ignored dry-run: dry-run to discard all ignored files
alias gxii='git clean -dXi'                # Discard ignored interactive: interactively discard all ignored files

# [[ Stash ]]
# In Neovim (with Neogit and my Gitsigns keymaps), keys "s" (stage), "u" (unstage), and "x" (discard) are sanctified to manipulate Git
# hunks. To be consistent with that and because this command is supported in Neogit and can't be used with the "s" key, let's not use "s"
# for the "git stash" command here.

alias gz='git stash'                      # [Z]tash: without nothing, act like push, move local changes in tracked files to the stash
alias gzu='git stash --include-untracked' # [Z]tash including [U]ntracked: move local changes in tracked & untracked files to the stash

alias gza='git stash apply' # [Z]tash [A]pply: copy the stash changes to the local files
alias gzc='git stash clear' # [Z]tash [C]lear: remove all the stash entries
alias gzd='git stash drop'  # [Z]tash [D]rop: remove one stash entry (default to the last)
alias gzl='git stash list'  # [Z]tash [L]ist: list the stash entries
alias gzp='git stash pop'   # [Z]tash [P]op: move the statsh changes to the local files (or copy them if there is any conflict)
alias gzps='git stash push' # [Z]tash [P]u[S]h: move the local changes in tracked files to the stash (support additional options like paths)
