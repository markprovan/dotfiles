source /usr/local/share/antigen/antigen.zsh

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

source $HOME/dev/dotfiles/zsh/aliases
source $HOME/dev/dotfiles/zsh/functions

# Completions
source ~/.rbenv/completions/rbenv.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle nvm
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme robbyrussell

antigen apply


# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
