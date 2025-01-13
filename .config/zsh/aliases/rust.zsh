# Various commands bundled in Rust installtion to handle Rust projects

# [C]ar[G]o: Rust's package manager

alias cgb='cargo build'            # [B]uild: compile a Rust program in debug mode
alias cgbr='cargo build --release' # [B]uild [R]elease: compile a Rust program in release mode
alias cgc='cargo check'            # [C]heck: check a local package and all its dependencies for errors
alias cgi='cargo init'             # [I]nit: create a new Cargo package in an existing directory
alias cgn='cargo new'              # [N]ew: create a new Cargo package in a new directory
alias cgr='cargo run'              # [R]un: compile and run a Rust program

# [R]u[S]t[C]: Rust's compiler

alias rsc='rustc'            # Compile a Rust program (in general, cargo should be used instead of this)
alias rsce='rustc --explain' # [E]xplain: explain a compiler rule

# [R]u[S]t[U]p: Rust's toolchain installer

alias rsud='rustup doc'         # [R]u[S]t[U]p [D]oc: open the documentation for the current toolchain
alias rsudb='rustup doc --book' # [R]u[S]t[U]p [D]oc [B]ook: open "The Rust Programming Language" book for the current toolchain
