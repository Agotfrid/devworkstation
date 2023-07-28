# Export
export ZSH=$HOME/.oh-my-zsh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE="git-lab.boldapps.net"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

export CLOUDSDK_PYTHON=/usr/local/bin/python3.11
export GOPRIVATE="git-lab.boldapps.net"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Aliases
alias nv="nvim"
alias vimrc="nvim ~/.vimrc"
alias nvrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias srczsh="source ~/.zshrc"
alias srcvim="source ~/.vimrc"
alias kctx="kubectx"
alias kns="kubens"
alias cpu="top -F -R -o cpu"
alias chrome="open -a 'Google Chrome'"
alias gce-hosts="source ~/gce-regen-hosts.sh"

# Theme and plugins
ZSH_THEME="robbyrussell"

plugins=(
  git
  git-flow
  kubectl
  zsh-autosuggestions
  kube-ps1
)

# Source files and init
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/plugins/kube-ps1
PROMPT='$(kube_ps1)'$PROMPT
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
eval "$(direnv hook zsh)"
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

. /usr/local/etc/profile.d/z.sh

eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
