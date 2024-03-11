# All aliases can be used with "-m <marker>" to run tests with a specific marker, however
# I don't define aliases for it since it can be used in combination with any other alias
# and the markers are project specific.

alias pt='pytest'

alias ptff='pytest --failed-first' # Run the tests that failed last time first

alias ptlf='pytest --last-failed' # Run only the tests that failed last time

alias ptnf='pytest --new-first' # Run the tests that have been added most recently first

alias pts='pytest -s' # Show output

alias ptx='pytest --exitfirst'     # Stop on first failure
alias ptxs='pytest --exitfirst -s' # Stop on first failure & show output
