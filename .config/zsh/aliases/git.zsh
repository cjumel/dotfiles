# [G]it: a version control system for tracking changes in source code

# [[ Add ]]

alias ga='git add'           # [G]it [A]dd: add the targeted files' changes to the staging area
alias gaa='git add --all'    # [G]it [A]dd [A]ll: add all changes to the staging area
alias gau='git add --update' # [G]it [A]dd [U]pdate: add the tracked files' changes to the staging area

# [[ Branch ]]

alias gb='git branch'           # [G]it [B]ranch: list local branches
alias gba='git branch --all'    # [G]it [B]ranch [A]ll: list local & remote branches
alias gbr='git branch --remote' # [G]it [B]ranch [R]emote: list remote branches

alias gbd='git branch --delete'          # [G]it [B]ranch [D]elete: delete a local branch
alias gbdf='git branch --delete --force' # [G]it [B]ranch [D]elete [F]orce: delete a local branch even if not merged

# [[ Commit ]]

alias gc='git commit'              # [G]it [C]ommit: create a commit
alias gcn='git commit --no-verify' # [G]it [C]ommit [N]o-verify: create commit without running commit hooks

alias gca='git commit --amend'              # [G]it [C]ommit [A]mend: commit by amending the last commit
alias gcan='git commit --amend --no-verify' # [G]it [C]ommit [A]mend [N]o-verify: commit by amending the last commit without running commit hooks

function git_commit_fixup() {
    local no_verify=""
    if [[ "$1" == "--no-verify" ]]; then
        no_verify="--no-verify"
    fi
    local commit
    commit=$(git log --oneline --no-merges -n 50 |
        fzf --preview='git show --color=always {1}' \
            --prompt="Commit > " |
        awk '{print $1}')
    if [[ -n "$commit" ]]; then
        git commit --fixup="$commit" $no_verify
    else
        echo "No commit selected"
        return 1
    fi
}
alias gcf='git_commit_fixup'              # [G]it [C]ommit [F]ixup: create a fixup commit
alias gcfn='git_commit_fixup --no-verify' # [G]it [C]ommit [F]ixup [N]o-verify: create a fixup commit without running commit hooks

alias gcw='git commit --message "🚧 WIP [skip ci]" --no-verify' # [G]it [C]ommit [W]IP: create a WIP commit

# [[ Check-ignore ]]

alias gci='git check-ignore'            # [G]it [C]heck [I]gnore: if a file is ignored by Git, print its path
alias gciv='git check-ignore --verbose' # [G]it [C]heck [I]gnore [V]erbose: if a file is ignored by Git, print its path & the ignore rule

# [[ Clean ]]

alias gcle='git clean'       # [G]it [CLE]an: remove untracked files from the working tree
alias gcled='git clean -d'   # [G]it [CLE]an [D]irectories: remove untracked files & directories from the working tree
alias gclen='git clean -n'   # [G]it [CLE]an [N]o-act: show which untracked files would be removed from the working tree
alias gcledn='git clean -dn' # [G]it [CLE]an [D]irectories [N]o-act: show which untracked files & directories would be removed from the working tree

# [[ Clone ]]

alias gclo='git clone'         # [G]it [CLO]ne: clone a repository
alias gclob='git clone --bare' # [G]it [CLO]ne [B]are: clone a repository as a bare repository (useful for git worktrees)

# [[ Checkout ]]

alias gco='git checkout' # [G]it [C]heck[O]ut: switch to a branch or restore working tree files (e.g. to a specific commit)

# [[ Diff ]]

alias gd='git diff'           # [G]it [D]iff: show differences between working tree and staging area (index), i.e. unstaged changes
alias gds='git diff --staged' # [G]it [D]iff [S]taged: show differences between staging area (index) and last commit (head), i.e. staged changes

# [[ Fetch ]]

alias gf='git fetch'           # [G]it [F]etch: download objects and refs from the remote repository
alias gfp='git fetch --prune'  # [G]it [F]etch [P]rune: download objects and refs from the remote repository & remove refs to deleted remote branches
alias gfu='git fetch upstream' # [G]it [F]etch [U]pstream: download objects and refs from the upstream repository (useful to update forks)

# [[ Init ]]

alias gi='git init' # [G]it [I]nit: create a new local Git repository

# [[ Log ]]

alias gl='git log --oneline --graph --decorate --color' # [G]it [L]og: show the commit log using in the short log format
alias gll='git log'                                     # [G]it [L]og [L]ong: show the commit log using the long log format

# [[ Pull ]]

alias gpl='git pull' # [G]it [P]u[L]l: download objects and refs from the remote repository & merge them into the current branch

# [[ Push ]]

alias gps='git push'                 # [G]it [P]ush: upload the current branch to the remote repository
alias gpsf='git push --force'        # [G]it [P]ush [F]orce: upload the current branch to the remote repository & overwrite any conflicting changes
alias gpst='git push --tags'         # [G]it [P]ush [T]ags: upload the current branch & all local tags to the remote repository
alias gpsu='git push --set-upstream' # [G]it [P]ush [U]pstream: upload the current branch to the remote repository and set the relevant upstream if needed

alias gpsd='git push --delete'         # [G]it [P]ush [D]elete: delete the listed ref (e.g. a tag)
alias gpsdo='git push --delete origin' # [G]it [P]ush [D]elete [O]rigin: delete the listed ref (e.g. a tag) from the origin remote

# [[ Rebase ]]

alias grb='git rebase'                # [G]it [R]e[B]ase: apply the current branch changes on top of another branch
alias grbi='git rebase --interactive' # [G]it [R]e[B]ase [I]nteractive: apply the current branch selected changes & actions on top of another branch

function git_rebase_default() {
    local interactive=""
    if [[ "$1" == "--interactive" ]]; then
        interactive="--interactive"
    fi
    local default_branch
    default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
    if [[ -n "$default_branch" ]]; then
        git rebase $interactive "$default_branch"
    else
        echo "Could not determine default branch"
        return 1
    fi
}
function git_rebase_main() {
    local interactive=""
    if [[ "$1" == "--interactive" ]]; then
        interactive="--interactive"
    fi
    if git show-ref --verify --quiet refs/heads/main; then
        git rebase $interactive main
    elif git show-ref --verify --quiet refs/heads/master; then
        git rebase $interactive master
    else
        echo "Branch 'main' or 'master' doesn't exist"
        return 1
    fi
}
function git_rebase_origin_default() {
    local interactive=""
    if [[ "$1" == "--interactive" ]]; then
        interactive="--interactive"
    fi
    local default_branch
    default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
    if [[ -n "$default_branch" ]]; then
        git rebase $interactive "origin/$default_branch"
    else
        echo "Could not determine default branch"
        return 1
    fi
}
function git_rebase_origin_main() {
    local interactive=""
    if [[ "$1" == "--interactive" ]]; then
        interactive="--interactive"
    fi
    if git show-ref --verify --quiet refs/remotes/origin/main; then
        git rebase $interactive origin/main
    elif git show-ref --verify --quiet refs/remotes/origin/master; then
        git rebase $interactive origin/master
    else
        echo "Branch 'origin/main' or 'origin/master' doesn't exist"
        return 1
    fi
}

alias grbd='git_rebase_default'                        # [G]it [R]e[B]ase [D]efault: rebase onto the default branch
alias grbm='git_rebase_main'                           # [G]it [R]e[B]ase [M]ain: rebase onto the main branch ('main' or 'master')
alias grbod='git_rebase_origin_default'                # [G]it [R]e[B]ase [O]rigin [D]efault: rebase onto the origin's default branch
alias grbom='git_rebase_origin_main'                   # [G]it [R]e[B]ase [O]rigin [M]ain: rebase onto the origin's main branch ('main' or 'master')
alias grbid='git_rebase_default --interactive'         # [G]it [R]e[B]ase [I]nteractive [D]efault: interactively rebase onto the default branch
alias grbim='git_rebase_main --interactive'            # [G]it [R]e[B]ase [I]nteractive [M]ain: interactively rebase onto the main branch ('main' or 'master')
alias grbiod='git_rebase_origin_default --interactive' # [G]it [R]e[B]ase [I]nteractive [O]rigin [D]efault: interactively rebase onto the origin's default branch
alias grbiom='git_rebase_origin_main --interactive'    # [G]it [R]e[B]ase [I]nteractive [O]rigin [M]ain: interactively rebase onto the origin's main branch ('main' or 'master')

alias grba='git rebase --abort'    # [G]it [R]e[B]ase [A]bort: stop a rebase in progress
alias grbc='git rebase --continue' # [G]it [R]e[B]ase [C]ontinue: continue a rebase in progress
alias grbs='git rebase --skip'     # [G]it [R]e[B]ase [S]kip: skip a commit's changes during a rebase in progress

# [[ Remove ]]

alias grm='git rm'           # [G]it [R]emove: delete a file from the Git repository and the file system
alias grmc='git rm --cached' # [G]it [R]emove [C]ached: delete a file from the Git repository but not from the file system

# [[ Reset ]]

function git_reset_head() {
    git reset "$1" HEAD~"$2"
}

alias grs='git reset'                # [G]it [R]eset: undo the targeted commit(s), or unstage the targeted files' changes
alias grsh='git reset --hard'        # [G]it [R]eset [H]ard: undo & discard the changes of the targeted commit(s), or discard the targeted files' changes
alias grshh='git_reset_head --hard'  # [G]it [R]eset [H]ard [H]ead: undo & discard the changes of a number of the last commits (default to 1)
alias grsm='git reset --mixed'       # [G]it [R]eset [M]ixed: undo & unstage the targeted commit(s), or unstage the targeted files' changes
alias grsmh='git_reset_head --mixed' # [G]it [R]eset [M]ixed [H]ead: undo & unstage a number of the last commits (default to 1)
alias grss='git reset --soft'        # [G]it [R]eset [S]oft: undo but keep staged the targeted commit(s)
alias grssh='git_reset_head --soft'  # [G]it [R]eset [S]oft [H]ead: undo but keep staged a number of the last commits (default to 1)

# [[ Restore ]]

alias grt='git restore'     # [G]it [R]es[T]ore: discard the unstaged changes of the targeted files
alias grta='git restore :/' # [G]it [R]es[T]ore [A]ll: discard the unstaged changes of all tracked files

alias grts='git restore --staged'     # [G]it [R]es[T]ore [S]taged: unstage the targeted files' changes
alias grtsa='git restore --staged :/' # [G]it [R]es[T]ore [S]taged [A]ll: unstage the changes of all tracked files

# [[ Revert ]]

function git_revert_head() {
    git revert --no-commit HEAD~"$1"..
    git commit
}
alias grv='git revert'       # [G]it [R]e[V]ert: create a new commit to undo the targeted commit
alias grvh='git_revert_head' # [G]it [R]e[V]ert [H]ead: create a new commit to undo a number of the last commits (default to 1)

alias grva='git revert --abort'    # [G]it [R]evert [A]bort: stop a revert in progress
alias grvc='git revert --continue' # [G]it [R]evert [C]ontinue: resume a revert in progress
alias grvs='git revert --skip'     # [G]it [R]evert [S]kip: skip a commit during a revert in progress

# [[ Status ]]

alias gs='git status' # [G]it [S]tatus: show the git status

# [[ Show ]]

function git_show_head() {
    if [ -z "$1" ]; then
        git show HEAD
    else
        git show HEAD~"$(($1 - 1))" # Use arithmetic expansion to convert input to number
    fi
}
alias gsh='git show'       # [G]it [SH]ow: give details on the targeted object (commit, tag, etc.)
alias gshh='git_show_head' # [G]it [SH]ow [H]ead: give details on the n'th latest commit (default to 1, the latest one)

# [[ Stash ]]

alias gst='git stash'                                 # [G]it [ST]tash: move local changes in tracked files to the stash
alias gstm='git stash --message'                      # [G]it [ST]tash with [M]essage: move local changes in tracked files to the stash with a custom message
alias gstu='git stash --include-untracked'            # [G]it [ST]tash including [U]ntracked: move local changes in tracked & untracked files to the stash
alias gstum='git stash --include-untracked --message' # [G]it [ST]tash including [U]ntracked with [M]essage: move local changes in tracked & untracked files to the stash with a custom message

alias gsta='git stash apply'            # [G]it [ST]tash [A]pply: copy the stash changes to the local files
alias gstc='git stash clear'            # [G]it [ST]tash [C]lear: remove all the stash entries
alias gstd='git stash drop'             # [G]it [ST]tash [D]rop: remove one stash entry (default to the last)
alias gstl='git stash list'             # [G]it [ST]tash [L]ist: list the stash entries
alias gstpp='git stash pop'             # [G]it [ST]tash [P]o[P]: move the statsh changes to the local files (or copy them if there is any conflict)
alias gstps='git stash push'            # [G]it [ST]tash [P]u[S]h: move the local changes in tracked files to the stash
alias gstpsm='git stash push --message' # [G]it [ST]tash [P]u[S]h with [M]essage: move the local changes in tracked files to the stash with a custom message
alias gsts='git stash show'             # [G]it [ST]tash [S]how: show the changes in the latest stash entry

# [[ Switch ]]

function git_switch_default() {
    local default_branch
    default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
    if [[ -n "$default_branch" ]]; then
        git switch "$default_branch"
    else
        echo "Could not determine default branch"
        return 1
    fi
}
function git_switch_main() {
    if git show-ref --verify --quiet refs/heads/main || git show-ref --verify --quiet refs/remotes/origin/main; then
        git switch main
    elif git show-ref --verify --quiet refs/heads/master || git show-ref --verify --quiet refs/remotes/origin/master; then
        git switch master
    else
        echo "Branch 'main' or 'master' doesn't exist"
        return 1
    fi
}

alias gsw='git switch'           # [G]it [SW]itch: switch to a branch
alias gswc='git switch --create' # [G]it [SW]itch [C]reate: create a branch & switch to it
alias gswd='git_switch_default'  # [G]it [SW]itch [D]efault: switch to the default branch
alias gswm='git_switch_main'     # [G]it [SW]itch [M]ain: switch to the main branch ('main' or 'master')
alias gswp='git switch -'        # [G]it [SW]itch [P]revious: switch to the previous branch

# [[ Tag ]]

alias gt='git tag'           # [G]it [T]ag: create a local tag
alias gtd='git tag --delete' # [G]it [T]ag [D]elete: delete a local tag

# [[ Worktree ]]

alias gw='git worktree'         # [G]it [W]orktree: base command for Git worktrees
alias gwa='git worktree add'    # [G]it [W]orktree [A]dd: create a new worktree
alias gwl='git worktree list'   # [G]it [W]orktree [L]ist: list all existing worktrees
alias gwr='git worktree remove' # [G]it [W]orktree [R]emove: delete a worktree
