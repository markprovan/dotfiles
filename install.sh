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

fancy_echo "Running Homebrew Bundle"
brew bundle

fancy_echo "Linking Homebrew SSL"
ln -s /usr/local/Cellar/openssl/VERSION/bin/openssl /usr/local/bin/openssl

fancy_echo "Installing Vim Plugged"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fancy_echo "Linking files"
ln -s zshrc ~/.zshrc
ln -s vimrc ~/.vimrc

fancy_echo "Creating zsh_history..."
touch ~/.zsh_history

fancy_echo "Done!"
