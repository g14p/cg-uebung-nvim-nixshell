# What is this?

An opiniated quick setup for nixos users that want to solve the computer
graphics exercise with:

- the nvim editor configured via `nvf` (not too bloated)
  - using the `Oil` as file manager
  - using a linter for `nvim` instead of ai (to learn more)
- git cli for version management
- `cmake` and `make` in the terminal for compiling
- checking the difference of reference and created images via the `compare` tool
  from `imagemagick` and the image viewer `feh`

# Installation

0. clone the repo with `git`
1. download all the cg-exercise-XX.zip into a private repo.
2. unzip them all with `unzip`
3. loosely read the `lesgo.sh` then run it it will show you the latest commits
   and some tasks. the tasks are for you to adapt whenever you achieved sth new.
   Also it shows you shortcuts. F.e. `v` to nvim into the source code Also you
   can comment out lines on the top of the `lesgo.sh` to select the exercise you
   are working on.

# Known Problems

| Step                 | Error                                      | Fix                                                      |
| -------------------- | ------------------------------------------ | -------------------------------------------------------- |
| Setting up Compiling | make and cmake not found                   | make sure u are in nix-shell                             |
| Compiling            | cmake deprecated                           | Increase cmake version in CMakeLists.txt                 |
| Solving exercises    | cpp headers are not found by nvim's linter | Ensure that CMakeLists.txt exports compile-commands.json |
