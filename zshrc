export ZSH=/Users/mark/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/dev/dotfiles/zsh/aliases
source $HOME/dev/dotfiles/zsh/functions

# Completions
source ~/.rbenv/completions/rbenv.zsh

# Golang
export GOPATH="$HOME/dev/go"

# ChefDK
export UNBUNDLED_COMMANDS=(knife)
export PATH="$PATH:$HOME/.chefdk/gem/ruby/2.3.0/bin"

#MySql
export PATH="$PATH:/usr/local/Cellar/mysql@5.6/5.6.36_1/bin"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias vim="/usr/local/bin/vim"
alias ctags="`brew --prefix`/bin/ctags"
