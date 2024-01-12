alias pe='pytest'

alias peff='pytest --failed-first' # Run the tests that failed last time first

alias pelf='pytest --last-failed' # Run only the tests that failed last time

alias pem='pytest -m' # Run tests with a marker
alias pemf='pytest -m "not slow"' # Marked as fast
alias pemfx='pytest -m "not slow" -x' # Marked as fast and stop on first failure
alias pemfxs='pytest -m "not slow" -x -s' # Marked as fast and stop on first failure and show output
alias pems='pytest -m "slow"' # Marked as slow
alias pemsx='pytest -m "slow" -x' # Marked as slow and stop on first failure
alias pemfxs='pytest -m "slow" -x -s' # Marked as slow and stop on first failure and show output

alias penf='pytest --new-first' # Run the tests that have been added most recently first

alias pes='pytest -s' # Show output

alias pex='pytest --exitfirst' # Stop on first failure
alias pexs='pytest --exitfirst -s' # Stop on first failure & show output
