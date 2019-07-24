# shellcheck shell=sh

PATH="$HOME/.local/bin:/usr/local/sbin:$GOPATH/bin:$PATH"
PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
PATH="$HOME/.poetry/bin:$PATH"
PATH="/usr/local/opt/libarchive/bin:$PATH"
PATH="/usr/local/opt/python/libexec/bin:$PATH"
PATH="/usr/local/opt/curl/bin:$PATH"
PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool/"
export PATH

export GOPATH="$HOME/go"

# shellcheck source=.bashrc
[ "${BASH-no}" != "no" ] && [ -r ~/.bashrc ] && . ~/.bashrc

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init -)"
#export NVM_DIR="$HOME/.nvm"
#. "$(brew --prefix nvm)/nvm.sh"
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
