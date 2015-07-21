if [ -d /etc/profile.d ]
then
  source /etc/profile.d/*
fi

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle yum
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

antigen bundle zsh-users/zsh-history-substring-search

if [[ $TERM = *256color ]]
then
  antigen bundle chriskempson/base16-shell base16-tomorrow.dark.sh
fi

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh

# Load the theme.
#antigen theme babun/babun babun-core/plugins/oh-my-zsh/src/babun.zsh-theme

# Tell antigen that you're done.
antigen apply

VIMODE="$fg[red]"
function zle-line-init zle-keymap-select {
 VIMODE="${${KEYMAP/vicmd/$fg[cyan]}/(main|viins)/$fg[red]}"
 zle reset-prompt
}

function zle-line-finish {
  VIMODE="$fg[red]"
}

zle -N zle-line-finish
zle -N zle-keymap-select

PROMPT='%{$fg[blue]%}{ %~ } \
%{$fg[green]%}$( git rev-parse --abbrev-ref HEAD 2> /dev/null || echo "" )%{$reset_color%} \
%{$VIMODE%}%(!.#.»)%{$reset_color%} '

RPROMPT='%{$fg[blue]%}%{$fg[magenta]%}%n@%m%{$fg[blue]%} %(?.%{$fg[green]%}⃝⃝⃝○.%{$fg[red]%}×)%{$reset_color%}${return_code}'

#bindkey -v
#bindkey "^?" backward-delete-char
#bindkey "^W" backward-kill-word 
#bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
#bindkey "^U" backward-kill-line
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

KEYTIMEOUT=1
DISABLE_AUTO_TITLE=true
unsetopt AUTO_CD

export EDITOR=vim

# loop over extra files
if test -d ~/.zshrc.d/
then
  for file in `find ~/.zshrc.d -type f -name '*.zsh'`
  do
    source $file
  done
fi

