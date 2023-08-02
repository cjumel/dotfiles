alias ga='git add'
alias gaa='git add --all'  # Add all files, both tracked & untracked
alias gad='git add .'  # Add the files in the current directory
alias gau='git add --update'  # Add all tracked files

alias gb='git branch'
alias gbd='git branch -D'  # Force delete a local branch
alias gbr='git branch -r'  # Act on remote branches

alias gcl='git clone'

alias gcm='git commit'
alias gcma='git commit --amend'
alias gcman='git commit --amend --no-edit'
alias gcmanf='git commit --amend --no-edit --no-verify'
alias gcmf='git commit --no-verify'
alias gcmwip='git commit --no-verify -m "🚧 WIP"'

alias gcf='git config'
alias gcfg='git config --global'

alias gcp='git cherry-pick'  # Apply the changes introduced by some existing commits

alias gd='git diff' # Show changes between commits, commit and working tree, etc.
alias gdt='git difftool'

alias gf='git fetch'
alias gfp='git fetch --prune'  # Remove unused remote branches

alias gl='git lg'
alias glm='git lg origin..HEAD'  # Show the log since the divergence from origin/main

alias gm='gitmoji'
alias gmc='gitmoji --config'
alias gmi='gitmoji --init'
alias gmr='gitmoji --remove'

alias gpl='git pull'

alias gps='git push'
alias gpst='git push --tags'  # Push all tags
alias gpstd='git push --delete origin'  # Push local tags deletions

alias grb='git rebase'
alias grbi='git rebase --interactive'
alias grbim='git rebase --interactive origin/main'
alias grbm='git rebase origin/main'  # Rebase in interactive mode from the fork with main

# Actions during rebase:
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias grm='git rm'  # Remove a file from the repository and the file system
alias grmc='git rm --cached'  # Remove a file from the reposiory but not from the file system

alias grs='git reset'  # Mixed reset: reset commits but keep their changes as unstaged
alias grsl='git reset HEAD~1'  # Mixed reset the last commit
function grsn(){ git reset HEAD~$1 }  # Mixed reset the N last commits 

alias grsh='git reset --hard'  # Hard reset: reset commits and discard all their changes
alias grshl='git reset --hard HEAD~1'  # Hard reset the last commit
function grshn(){ git reset --hard HEAD~$1 }  # Hard reset the N last commits

alias grss='git reset --soft'  # Soft reset: reset commits and keep their changes as staged
alias grssl='git reset --soft HEAD~1'  # Soft reset the last commit
function grssn(){ git reset --soft HEAD~$1 }  # Soft reset the N last commits

alias grt='git restore'  # Discard the changes of the targeted unstaged files
alias grts='git restore --staged'  # Unstage the targeted staged files

alias grv='git revert'
alias grvl='git revert HEAD'  # Revert the last commit

alias gs='git status'

alias gsh='git show'  # Show various types of objects

alias gst='git stash'  # Stash the uncommited changes
alias gsta='git stash apply'  # Re-apply the last stashed changes (don't clear them)
alias gstc='git stash clear'
alias gstl='git stash list'
alias gstp='git stash pop'  # Re-apply the last stashed changes & clear them

alias gsw='git switch'  # Switch branches
alias gswm='git switch main'  # Switch branches

alias gt='git tag'
