alias pt='pytest'

alias ptff='pytest --failed-first' # Run the tests that failed last time first

alias ptlf='pytest --last-failed' # Run only the tests that failed last time

alias ptm='pytest -m' # Run tests with a marker
alias ptmf='pytest -m "not slow"' # Marked as fast
alias ptmfx='pytest -m "not slow" -x' # Marked as fast and stop on first failure
alias ptmfxs='pytest -m "not slow" -x -s' # Marked as fast and stop on first failure and show output
alias ptms='pytest -m "slow"' # Marked as slow
alias ptmsx='pytest -m "slow" -x' # Marked as slow and stop on first failure
alias ptmfxs='pytest -m "slow" -x -s' # Marked as slow and stop on first failure and show output

alias ptnf='pytest --new-first' # Run the tests that have been added most recently first

alias pts='pytest -s' # Show output

alias ptx='pytest --exitfirst' # Stop on first failure
alias ptxs='pytest --exitfirst -s' # Stop on first failure & show output
