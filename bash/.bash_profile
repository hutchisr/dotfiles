# shellcheck shell=bash

export GOPATH="$HOME/go"

paths=(
  "$HOME/.local/bin"
  "$GOPATH/bin"
  "$HOME/.poetry/bin"
  "$HOME/.yarn/bin"
  "/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool/"
  "/usr/local/opt/openssl@1.1/bin"
  "/usr/local/opt/libarchive/bin"
  "/usr/local/opt/python/libexec/bin"
  "/usr/local/opt/curl/bin"
)

for path in "${paths[@]}"
do
  [[ -d "$path" ]] && PATH="$path:$PATH"
done

export PATH

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
