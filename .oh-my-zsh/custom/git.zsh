alias ga='git add'
alias gaa='git add --all'  # Add all files, both tracked & untracked
alias gad='git add .'  # Add the files in the current directory
alias gau='git add --update'  # Add all tracked files

alias gb='git branch'
alias gbd='git branch -D'  # Force delete a local branch
alias gbr='git branch -r'  # Act on remote branches

alias gch='git checkout'
alias gchd='git checkout --'  # Discard local changes
alias gchm='git checkout main'  # Checkout to main

alias gcle='git clean'

alias gclo='git clone'

alias gcm='git commit'
alias gcma='git commit --amend'
alias gcman='git commit --amend --no-edit'
alias gcmanf='git commit --amend --no-edit --no-verify'
alias gcmf='git commit --no-verify'
alias gcmfwip='git commit --no-verify -m "🚧 WIP"'

alias gcf='git config'
alias gcfg='git config --global'

alias gcp='git cherry-pick'  # Apply the changes introduced by some existing commits

alias gdf='git diff' # Show changes between commits, commit and working tree, etc.
alias gdft='git difftool'

alias gf='git fetch'
alias gfp='git fetch --prune'  # Remove unused remote branches

alias glg='git lg'
alias glgm='git lg origin..HEAD'  # Show the log since the divergence from origin/main

alias gm='gitmoji'

alias gpl='git pull'

alias gps='git push'
alias gpst='git push --tags'  # Push all tags
alias gpstd='git push --delete origin'  # Push local tags deletions

alias grb='git rebase'
alias grbm='git rebase origin/main'  # Rebase in interactive mode from the fork with main

# Actions during rebase:
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias grm='git rm'  # Remove a file from the repository and the file system
alias grmc='git rm --cached'  # Remove a file from the reposiory but not from the file system

alias grs='git reset'  # Reset commits but keep changes in the working tree as not added
alias grsha='git reset --hard'  # Reset commits & changes in the working tree
alias grshal='git reset --hard HEAD~1'  # Reset the last commit & its changes in the working tree
function grshan(){ git reset --hard HEAD~$1 }  # Reset the N last commits & their changes in the working tree
alias grshe='git reset HEAD'  # Make all added changes not added
alias grsl='git reset HEAD~1'  # Reset the last commit but keep its changes in the working tree as not added
function grsn(){ git reset HEAD~$1 }  # Reset the N last commits but keep their changes in the working tree as not added
alias grsso='git reset --soft'  # Reset commits but keep changes in the working tree as added
alias grssol='git reset --soft HEAD~1'  # Reset the last commit but keep its changes in the working tree as added
function grsson(){ git reset --soft HEAD~$1 }  # Reset the N last commits but keep their changes in the working tree as added

alias grt='git restore'  # Restore the targeted files work tree 
alias grts='git restore --staged'  # Unstage the targeted staged files

alias grv='git revert'
alias grvhe='git revert HEAD'  # Revert the last commit

alias gs='git status'

alias gsh='git show'  # Show various types of objects

alias gst='git stash'  # Stash the uncommited changes
alias gsta='git stash apply'  # Re-apply the last stashed changes (don't clear them)
alias gstclr='git stash clear'
alias gstls='git stash list'
alias gstp='git stash pop'  # Re-apply the last stashed changes & clear them

alias gsw='git switch'  # Switch branches
alias gswm='git switch main'  # Switch branches

alias gt='git tag'
