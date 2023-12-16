alias ga='git add'
alias gaa='git add --all'  # Add all files, both tracked & untracked
alias gad='git add .'  # Add the files in the current directory
alias gau='git add --update'  # Add all tracked files

alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete --force'  # Force delete a local branch
alias gbr='git branch --remote'  # Act on remote branches

alias gca='git commit --amend'  # Amend commit by adding the staged changes to it
alias gcaf='git commit --amend --no-verify'  # Amend & skip hooks
alias gcan='git commit --amend --no-edit'  # Amend & skip commit message
alias gcanf='git commit --amend --no-edit --no-verify'  # Amend & skip commit message & hooks

alias gcf='git commit --message "🚧 FIXUP"'  # Fixup commit (to be squashed later with another commit)

alias gcl='git clone'
alias gclb='git clone --bare'  # Clone a repository without its files, only the .git content

alias gcm='git commit'  # Create commit
alias gcmf='git commit --no-verify'  # Create & skip hooks
alias gcmn='git commit --no-edit'  # Create & skip commit message (useful with gitmoji)
alias gcmnf='git commit --no-edit --no-verify'  # Create & skip commit message & hooks

alias gcn='git config'
alias gcng='git config --global'

alias gco='git checkout'
alias gcod='git checkout --' # Discard the changes of the targeted files or all of them

alias gcp='git cherry-pick'  # Apply the changes introduced by some existing commits

alias gcw='git commit --no-verify --message "🚧 WIP"'  # WIP commit

alias gd='git diff' # Show changes between commits, commit and working tree, etc.
alias gdt='git difftool'

alias gf='git fetch'  # Fetch the remote repository
alias gfp='git fetch --prune'  # Fetch & remove unused remote branches
alias gfu='git fetch upstream'  # Fetch the remote repository upstream branch (useful to update forks)

alias gl='git lg'

alias gpl='git pull'

alias gps='git push'
alias gpsf='git push --force'
alias gpsu='git push --set-upstream'  # Set the upstream of a local branch and push it (needed iff autoSetupRemote is not True)

alias grb='git rebase'
alias grbi='git rebase --interactive'
alias grbo='git rebase --strategy-option=theirs'  # Rebase changes and keep ours (reversal with the option is on purpose)
alias grbt='git rebase --strategy-option=ours'  # Rebase changes and keep theirs (reversal with the option is on purpose)

# Actions during rebase:
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias grm='git rm'  # Remove a file from the repository and the file system
alias grmc='git rm --cached'  # Remove a file from the reposiory but not from the file system

# Reset can have several forms
# - with a path or nothing, unstage the targeted staged files or all of them
# - with a commit, undo the targeted commit(s) & keep their changes as unstaged (mixed reset)
alias grs='git reset'

# Commit form
function grsl(){ git reset --mixed HEAD~$1 }  # Reset the last $1 commit(s)
alias grsh='git reset --hard'  # Same as mixed reset but discard all the commit changes
function grshl(){ git reset --hard HEAD~$1 }  # Hard reset the last $1 commit(s)
alias grss='git reset --soft' # Same as mixed reset but keep all the commit changes as staged
function grssl(){ git reset --soft HEAD~$1 }  # Soft reset the last $1 commit(s)

alias grt='git restore'  # Discard the changes of the targeted unstaged files
alias grtd='git restore .'
alias grts='git restore --staged'  # Unstage the targeted staged files
alias grtsd='git restore --staged .'

alias grv='git revert'
alias grvl='git revert HEAD'  # Revert the last commit

# Actions during revert:
alias grva='git revert --abort'
alias grvc='git revert --continue'
alias grvs='git revert --skip'

alias gs='git status'
alias gsd='git status .'

alias gsh='git stash'  # Stash the uncommited changes
alias gsha='git stash apply'  # Re-apply the last stashed changes (don't clear them)
alias gshc='git stash clear'
alias gshl='git stash list'
alias gshp='git stash pop'  # Re-apply the last stashed changes & clear them

alias gso='git show'  # Show various types of objects

alias gsw='git switch'  # Switch to a branch by its name
alias gswc='git switch --create'  # Create & switch to a new branch
alias gswp='git switch -'  # Switch to the previous branch

alias gt='git tag'
alias gtd='git tag --delete'  # Delete the provided tag locally
alias gtdr='git push --delete origin'  # Delete the provided tag remotely
alias gtp='git push --tags'  # Push all local tags

alias gw='git worktree'
alias gwa='git worktree add'
alias gwl='git worktree list'
alias gwr='git worktree remove'
