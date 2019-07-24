# shellcheck shell=bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_THEME=Single_line
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f "$HOME/.bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="$HOME/.bash-git-prompt/share"
  GIT_PROMPT_THEME=Single_line
  source "$HOME/.bash-git-prompt/share/gitprompt.sh"
fi

alias ls="ls -G"
alias ll="ls -Gl"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
