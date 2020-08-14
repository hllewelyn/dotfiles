export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/shims:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

function wip() {
  git commit -m "WIP: $1"
}

# Silence direnv
export DIRENV_LOG_FORMAT=

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

# load custom executable functions
# for function in ~/.zsh/functions/*; do
#   source $function
# done

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# aliases
source $HOME/.zsh/aliases

PROMPT='%2~ # '
