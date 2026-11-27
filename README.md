# What is this?
<img width="692" height="374" alt="image" src="https://github.com/user-attachments/assets/15e33293-500d-4912-9e86-412343a3112d" />

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
1. in your `configuration.nix` u have to add flakes and add nvf. This repo kinda
   assumes you [set up nvf](https://www.youtube.com/watch?v=uP9jDrRvAwM)
   already. then just replace your nvf configuration with
   `nvf-configuration.nix` from this repo.
2. download all the cg-exercise-XX.zip into a private repo.
3. unzip them all with `unzip`
4. loosely read the `lesgo.sh` then run it it will show you the latest commits
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


# Disclaimer 

Although i did lesgo.sh myself, nvf_configuration.nix is just a reduced version of https://github.com/NotAShelf/nvf/blob/main/configuration.nix and also the default.nix is just AI generated. But it works and doesnt look sus to me so i'd go with it in your case. :) 

