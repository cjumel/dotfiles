# Git: open source distributed version control system

_git_fuzzy_select_commit() {
    git log --oneline --no-merges |
        fzf --prompt="Commit > " --preview='git show --color=always {1}' |
        awk '{print $1}'
}
_git_get_head_commit() {
    if [ -z "$1" ]; then
        echo "HEAD"
    else
        echo "HEAD~$1"
    fi
}

alias ga='git add'           # [G]it [A]dd: add the targeted files' changes to the staging area
alias gaa='git add --all'    # [G]it [A]dd [A]ll: add all changes to the staging area
alias gau='git add --update' # [G]it [A]dd [U]pdate: add the tracked files' changes to the staging area

alias gb='git branch'           # [G]it [B]ranch: list local branches
alias gba='git branch --all'    # [G]it [B]ranch [A]ll: list local & remote branches
alias gbr='git branch --remote' # [G]it [B]ranch [R]emote: list remote branches

alias gbd='git branch --delete'          # [G]it [B]ranch [D]elete: delete a local branch
alias gbdf='git branch --delete --force' # [G]it [B]ranch [D]elete [F]orce: delete a local branch even if not merged

function _git_commit_fixup_fuzzy() {
    local commit=$(_git_fuzzy_select_commit)
    if [[ -n "$commit" ]]; then
        git commit --fixup="$commit" "$@"
    else
        echo "No commit selected"
        return 1
    fi
}
function _git_commit_fixup_head() {
    git commit --fixup="$(_git_get_head_commit "$1")" "${@:2}"
}
function _git_commit_wip() {
    git commit --message "🚧 WIP [skip ci]" --no-verify "$@"
}

alias gc='git commit'                # [G]it [C]ommit: create a commit
alias gca='git commit --amend'       # [G]it [C]ommit [A]mend: commit by amending the last commit
alias gcf='git commit --fixup'       # [G]it [C]ommit [F]ixup: fixup the targeted commit
alias gcff='_git_commit_fixup_fuzzy' # [G]it [C]ommit [F]ixup [F]uzzy: fixup a fuzzy-found commit
alias gcfh='_git_commit_fixup_head'  # [G]it [C]ommit [F]ixup [H]ead: fixup the HEAD commit or a number of commits before HEAD
alias gcw='_git_commit_wip'          # [G]it [C]ommit [W]IP: create a WIP commit

alias gci='git check-ignore'            # [G]it [C]heck [I]gnore: if a file is ignored by Git, print its path
alias gciv='git check-ignore --verbose' # [G]it [C]heck [I]gnore [V]erbose: if a file is ignored by Git, print its path & the ignore rule

alias gcl='git clean'       # [G]it [CL]ean: remove untracked files from the working tree
alias gclx='git clean -x'   # [G]it [CL]ean including ignored: remove untracked & ignored files from the working tree
alias gcld='git clean -d'   # [G]it [CL]ean [D]irectories: remove untracked files & directories from the working tree
alias gcldx='git clean -dx' # [G]it [CL]ean [D]irectories including ignored: remove untracked & ignored files & directories from the working tree

alias gclo='git clone'         # [G]it [CLO]ne: clone a repository
alias gclob='git clone --bare' # [G]it [CLO]ne [B]are: clone a repository as a bare repository (useful for git worktrees)

alias gco='git checkout' # [G]it [C]heck[O]ut: switch to a branch or restore working tree files (e.g. to a specific commit)

alias gd='git diff'           # [G]it [D]iff: show differences between working tree and staging area (index), i.e. unstaged changes
alias gds='git diff --staged' # [G]it [D]iff [S]taged: show differences between staging area (index) and last commit (head), i.e. staged changes

alias gf='git fetch'           # [G]it [F]etch: download objects and refs from the remote repository
alias gfp='git fetch --prune'  # [G]it [F]etch [P]rune: download objects and refs from the remote repository & remove refs to deleted remote branches
alias gfu='git fetch upstream' # [G]it [F]etch [U]pstream: download objects and refs from the upstream repository (useful to update forks)

alias gi='git init' # [G]it [I]nit: create a new local Git repository

alias gl='git log'                        # [G]it [L]og: show the commit log
alias glg='git log --graph'               # [G]it [L]og [G]raph: show the commit log as a graph
alias glf='git log --graph --format=full' # [G]it [L]og [F]ull: show the commit log as a graph with full commit messages

alias gpl='git pull' # [G]it [P]u[L]l: download objects and refs from the remote repository & merge them into the current branch

alias gps='git push'                 # [G]it [P]ush: upload the current branch to the remote repository
alias gpsf='git push --force'        # [G]it [P]ush [F]orce: upload the current branch to the remote repository & overwrite any conflicting changes
alias gpst='git push --tags'         # [G]it [P]ush [T]ags: upload the current branch & all local tags to the remote repository
alias gpsu='git push --set-upstream' # [G]it [P]ush [U]pstream: upload the current branch to the remote repository and set the relevant upstream if needed

alias gpsd='git push --delete'         # [G]it [P]ush [D]elete: delete the listed ref (e.g. a tag)
alias gpsdo='git push --delete origin' # [G]it [P]ush [D]elete [O]rigin: delete the listed ref (e.g. a tag) from the origin remote

alias grb='git rebase'                # [G]it [R]e[B]ase: apply the current branch changes on top of another branch
alias grbi='git rebase --interactive' # [G]it [R]e[B]ase [I]nteractive: apply the current branch selected changes & actions on top of another branch

alias grba='git rebase --abort'    # [G]it [R]e[B]ase [A]bort: stop a rebase in progress
alias grbc='git rebase --continue' # [G]it [R]e[B]ase [C]ontinue: continue a rebase in progress
alias grbs='git rebase --skip'     # [G]it [R]e[B]ase [S]kip: skip a commit's changes during a rebase in progress

alias grm='git rm'           # [G]it [R]emove: delete a file from the Git repository and the file system
alias grmc='git rm --cached' # [G]it [R]emove [C]ached: delete a file from the Git repository but not from the file system

function _git_reset_fuzzy() {
    local commit=$(_git_fuzzy_select_commit)
    if [[ -n "$commit" ]]; then
        git reset "$commit" "$@"
    else
        echo "No commit selected"
        return 1
    fi
}
function _git_reset_head() {
    git reset "$(_git_get_head_commit "$2")" "$1" "${@:3}"
}

alias grs='git reset' # [G]it [R]eset: undo the targeted commit(s), or unstage the targeted files' changes

alias grsh='git reset --hard'         # [G]it [R]eset [H]ard: undo & discard the changes of the targeted commit(s), or discard the targeted files' changes
alias grshf='_git_reset_fuzzy --hard' # [G]it [R]eset [H]ard [F]uzzy: undo & discard the changes of a fuzzy-found commit
alias grshh='_git_reset_head --hard'  # [G]it [R]eset [H]ard [H]ead: undo & discard the changes of a number of the last commits (default to 1)

alias grsm='git reset --mixed'         # [G]it [R]eset [M]ixed: undo & unstage the targeted commit(s), or unstage the targeted files' changes
alias grsmf='_git_reset_fuzzy --mixed' # [G]it [R]eset [M]ixed [F]uzzy: undo & unstage a fuzzy-found commit
alias grsmh='_git_reset_head --mixed'  # [G]it [R]eset [M]ixed [H]ead: undo & unstage a number of the last commits (default to 1)

alias grss='git reset --soft'         # [G]it [R]eset [S]oft: undo but keep staged the targeted commit(s)
alias grssf='_git_reset_fuzzy --soft' # [G]it [R]eset [S]oft [F]uzzy: undo but keep staged a fuzzy-found commit
alias grssh='_git_reset_head --soft'  # [G]it [R]eset [S]oft [H]ead: undo but keep staged a number of the last commits (default to 1)

alias grt='git restore'     # [G]it [R]es[T]ore: restore the worktree, that is discard the unstaged changes, of the targeted files
alias grta='git restore :/' # [G]it [R]es[T]ore [A]ll: restore the worktree, that is discard all unstaged changes, of all tracked files

alias grts='git restore --staged'     # [G]it [R]es[T]ore [S]taged: restore the staged changes, that is unstage the changes, of the targeted files
alias grtsa='git restore --staged :/' # [G]it [R]es[T]ore [S]taged [A]ll: restore the staged changes, that is unstage all changes, of all tracked files

alias grtb='git restore --worktree --staged'     # [G]it [R]es[T]ore [B]oth: restore both the worktree & staged changes of the targeted files
alias grtba='git restore --worktree --staged :/' # [G]it [R]es[T]ore [B]oth [A]ll: restore both the worktree & staged changes of all tracked files

function _git_revert_fuzzy() {
    local commit=$(_git_fuzzy_select_commit)
    if [[ -n "$commit" ]]; then
        git revert "$commit" "$@"
    else
        echo "No commit selected"
        return 1
    fi
}
function _git_revert_head() {
    git revert "$(_git_get_head_commit "$1")" "${@:2}"
}

alias grv='git revert'         # [G]it [R]e[V]ert: create a new commit to undo the targeted commit
alias grvf='_git_revert_fuzzy' # [G]it [R]e[V]ert [F]uzzy: create a new commit to undo a fuzzy-found commit
alias grvh='_git_revert_head'  # [G]it [R]e[V]ert [H]ead: create a new commit to undo the HEAD commit or a number of commits before HEAD

alias grva='git revert --abort'    # [G]it [R]evert [A]bort: stop a revert in progress
alias grvc='git revert --continue' # [G]it [R]evert [C]ontinue: resume a revert in progress
alias grvs='git revert --skip'     # [G]it [R]evert [S]kip: skip a commit during a revert in progress

alias gs='git status' # [G]it [S]tatus: show the git status

function _git_show_fuzzy() {
    local commit=$(_git_fuzzy_select_commit)
    if [[ -n "$commit" ]]; then
        git show "$commit" "$@"
    else
        echo "No commit selected"
        return 1
    fi
}
function _git_show_head() {
    git show "$(_git_get_head_commit "$1")" "${@:2}"
}

alias gsh='git show'         # [G]it [SH]ow: give details on the targeted object (commit, tag, etc.)
alias gshf='_git_show_fuzzy' # [G]it [SH]ow [F]uzzy: give details on a fuzzy-found commit
alias gshh='_git_show_head'  # [G]it [SH]ow [H]ead: give details on the HEAD commit or a number of commits before HEAD

alias gst='git stash'                      # [G]it [ST]tash: move local changes in tracked files to the stash
alias gstu='git stash --include-untracked' # [G]it [ST]tash including [U]ntracked: move local changes in tracked & untracked files to the stash

alias gsta='git stash apply' # [G]it [ST]tash [A]pply: copy the stash changes to the local files
alias gstc='git stash clear' # [G]it [ST]tash [C]lear: remove all the stash entries
alias gstd='git stash drop'  # [G]it [ST]tash [D]rop: remove one stash entry (default to the last)
alias gstl='git stash list'  # [G]it [ST]tash [L]ist: list the stash entries
alias gstp='git stash pop'   # [G]it [ST]tash [P]op: move the statsh changes to the local files (or copy them if there is any conflict)
alias gsts='git stash show'  # [G]it [ST]tash [S]how: show the changes in the latest stash entry

alias gstps='git stash push'                      # [G]it [ST]tash [P]u[S]h: move the local changes in tracked files to the stash
alias gstpsu='git stash push --include-untracked' # [G]it [ST]tash [P]u[S]h including [U]ntracked: move the local changes in tracked & untracked files to the stash

alias gsw='git switch'           # [G]it [SW]itch: switch to a branch
alias gswc='git switch --create' # [G]it [SW]itch [C]reate: create a branch & switch to it
alias gswp='git switch -'        # [G]it [SW]itch [P]revious: switch back to the previous branch

function _git_switch_detach_fuzzy() {
    local commit=$(_git_fuzzy_select_commit)
    if [[ -n "$commit" ]]; then
        git switch --detach "$commit" "$@"
    else
        echo "No commit selected"
        return 1
    fi
}
function _git_switch_detach_head() {
    git switch --detach "$(_git_get_head_commit "$1")" "${@:2}"
}

alias gswd='git switch --detach'       # [G]it [SW]itch [D]etach: switch to a specific commit in detached HEAD state
alias gswdf='_git_switch_detach_fuzzy' # [G]it [SW]itch [D]etach [F]uzzy: switch to a fuzzy-found commit in detached HEAD state
alias gswdh='_git_switch_detach_head'  # [G]it [SW]itch [D]etach [H]ead: switch to the HEAD commit or a number of commits before HEAD in detached HEAD state

alias gt='git tag'           # [G]it [T]ag: create a local tag
alias gtd='git tag --delete' # [G]it [T]ag [D]elete: delete a local tag

alias gw='git worktree'         # [G]it [W]orktree: base command for Git worktrees
alias gwa='git worktree add'    # [G]it [W]orktree [A]dd: create a new worktree
alias gwl='git worktree list'   # [G]it [W]orktree [L]ist: list all existing worktrees
alias gwr='git worktree remove' # [G]it [W]orktree [R]emove: delete a worktree
