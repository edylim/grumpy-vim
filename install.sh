#!/usr/bin/env bash

unattended_mode=false
install_dir=""

install_gv() {
  add_kitty="y"

  if ! $unattended_mode ; then
    read -p "Include kitty terminal (recommended) as part of setup? (y/n): " add_kitty
  fi

  if [[ $( which brew ) ]] 
  then
    printf "\n*** Homebrew installed. Installing required formulae... ***\n"
  else
    printf "\n*** Homebrew not installed. Installing now... ***\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if [[ $( which brew ) ]] 
  then
    brew install gcc
    brew install lazygit
    brew install neovim
    brew install ripgrep
    brew install stow

    if [ $add_kitty == "y" ]; then
      printf "\n*** Installing kitty terminal... ***\n"
      brew install --cask kitty 
    else
      printf "\n*** Skipping kitty install ***\n"
    fi

    # backup current nvim
    if [[ -d ~/.config/nvim ]] || [[ ~/.config/nvim ]]; then
      random=$RANDOM
      printf "\n*** Nvim config already exists. Copying old config to nvim_${random} ***\n"
      mv $HOME/.config/nvim $HOME/.config/nvim_${random}
      mv $HOME/.local/share/nvim $HOME/.local/share/nvim_${random}
    fi

    printf "\n*** Creating nvim folder in ~/.config ***\n"
    mkdir -p $HOME/.config/nvim

    printf "\n*** Creating symlinks ***\n"

    stow -v -R --target=$HOME/.config/nvim --dir=${install_dir%/*} ${install_dir##*/}
  else
    printf "\n!!! Was not able to find 'brew'. Exiting... !!!\n"
    exit 1
  fi
}

display_help() {
  printf "Usage: $0 [-u] [-d <required_path>]\n\n"
  printf "Options:\n\n"
  printf " -d, --dir       REQUIRED: Absolute path to grumpy-vim directory.\n"
  printf "                 Ex: $HOME/grumpy-vim, ~/dotfiles/grumpy-vim\n\n"
  printf " -u              Unattended install with no prompts.\n"
  printf "                 Do not cry if something breaks.\n\n"
  printf " -h, --help      Display this help message.\n"
}

has_arg() {
    [[ ("$1" == *=* && -n ${1#*=}) || ( ! -z "$2" && "$2" != -*)  ]];
}

get_arg() {
  echo "${2:-${1#*=}}"
}

handle_options() {
  if [ $# == 0 ]; then
    display_help
    exit 1
  fi
  while [ $# -gt 0 ]; do
    case $1 in
      -h | --help)
        display_help
        exit 0
        ;;
      -u)
        unattended_mode=true
        ;;
      -d | --dir*)
        if ! has_arg $@; then
          printf "Nvim path not specified." >&2
          display_help
          exit 1
        fi

        install_dir=$(get_arg $@)

        if [[ -d $install_dir ]] && [[ -f $install_dir/init.lua ]]; then
          printf "\n*** Using dir = $install_dir ***\n"
          install_gv
        else
          printf "\nSomething's not right..."
          printf "\nThe directory specified does not exist or does"
          printf "\nnot include the expected files"
        fi

        shift
        ;;
      *)
        echo "Invalid option: $1" >&2
        display_help
        exit 1
        ;;
    esac
    shift
  done
}

handle_options "$@"
