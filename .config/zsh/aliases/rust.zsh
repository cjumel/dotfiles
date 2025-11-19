# [C]ar[G]o: Rust's package manager

alias cgb='cargo build'            # [C]ar[G]o [B]uild: compile a Rust program in debug mode
alias cgbr='cargo build --release' # [C]ar[G]o [B]uild [R]elease: compile a Rust program in release mode
alias cgc='cargo check'            # [C]ar[G]o [C]heck: check a local package and all its dependencies for errors
alias cgi='cargo init'             # [C]ar[G]o [I]nit: create a new Cargo package in an existing directory
alias cgn='cargo new'              # [C]ar[G]o [N]ew: create a new Cargo package in a new directory
alias cgr='cargo run'              # [C]ar[G]o [R]un: compile and run a Rust program

# [R]u[S]t[C]: Rust's compiler

alias rsc='rustc'            # [R]u[S]t[C]: compile a Rust program (in general, cargo should be used instead of this)
alias rsce='rustc --explain' # [R]u[S]t[C] [E]xplain: explain a compiler rule

# [R]u[S]t[U]p: Rust's toolchain installer

alias rsud='rustup doc'         # [R]u[S]t[U]p [D]oc: open the documentation for the current toolchain
alias rsudb='rustup doc --book' # [R]u[S]t[U]p [D]oc [B]ook: open "The Rust Programming Language" book for the current toolchain
