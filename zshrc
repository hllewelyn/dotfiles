export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/opt/homebrew/opt/heroku-node/bin:$PATH"

export VISUAL=vim
export EDITOR=$VISUAL
export BAT_THEME="OneHalfLight"

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

bindkey -v # set to vi bindings
bindkey '^r' history-incremental-pattern-search-backward # replace built-in bindings
bindkey '^s' history-incremental-pattern-search-forward # replace built-in bindings

PROMPT='%2~ # '

export PATH="/opt/homebrew/opt/postgresql@10/bin:$PATH"

# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in green
PROMPT='%1~ %F{green}${vcs_info_msg_0_}%f %# '

setopt autocd # Make CD unnecessary

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

. /opt/homebrew/opt/asdf/asdf.sh
