export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/shims:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export VISUAL=vim
export EDITOR=$VISUAL

function wip() {
  git commit -m "WIP: $1"
}

function lmk() {
  if [ $? -eq 0 ]; then
    osascript -e 'display notification "👍🏻" with title "Success"'
    say "Success"
  else
    osascript -e 'display notification "👎🏻" with title "Failed"'
    say "Failure"
  fi
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
