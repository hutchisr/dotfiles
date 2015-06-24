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

antigen bundle chriskempson/base16-shell --loc=base16-tomorrow.dark.sh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme babun/babun babun-core/plugins/oh-my-zsh/src/babun.zsh-theme

antigen bundle sharat87/zsh-vim-mode zsh-vim-mode.plugin.zsh

# Tell antigen that you're done.
antigen apply

bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word 
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" backward-kill-line

DISABLE_AUTO_TITLE=true
unsetopt AUTO_CD

# loop over extra files
if test -d ~/.zshrc.d/
then
  for file in `find ~/.zshrc.d -type f -name '*.zsh'`
  do
    source $file
  done
fi

