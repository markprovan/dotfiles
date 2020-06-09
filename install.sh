#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "Installing Xcode Developer Tools"
xcode-select --install

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
fi

fancy_echo "Installing Vim Plugged"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fancy_echo "Linking files"
ln -s zsh/zshrc ~/.zshrc
ln -s zsh/zsh_aliases ~/.zsh_aliases
ln -s zsh/zsh_plugins ~/.zsh_plugins

ln -s vimrc ~/.vimrc

ln -s gitconfig ~/.gitconfig

fancy_echo "Creating zsh_history..."
touch ~/.zsh_history

fancy_echo "Done! Start a new prompt and run antibody"
