# shellcheck shell=bash disable=SC1090,SC2155
[ -r /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -r /usr/local/etc/profile.d/bash_completion.sh ] && source /usr/local/etc/profile.d/bash_completion.sh
[ -r ~/.bash_aliases ] && source ~/.bash_aliases

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  : "${GIT_PROMPT_THEME:=Single_line}"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="$HOME/.bash-git-prompt"
  : "${GIT_PROMPT_THEME:=Single_line}"
  source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

[ -r ~/.fzf.bash ] && source ~/.fzf.bash
[ -r ~/.bashrc.local ] && source ~/.bashrc.local
