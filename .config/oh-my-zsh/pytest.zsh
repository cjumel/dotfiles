alias pte='pytest'

alias pteff='pytest --failed-first' # Run the tests that failed last time first

alias ptelf='pytest --last-failed' # Run only the tests that failed last time

alias ptem='pytest -m' # Run tests with a marker
alias ptemf='pytest -m "not slow"' # Marked as fast
alias ptems='pytest -m "slow"' # Marked as slow

alias ptenf='pytest --new-first' # Run the tests that have been added most recently first

alias ptes='pytest -s' # Show output

alias ptex='pytest --exitfirst' # Stop on first failure
