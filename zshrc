# Export
export ZSH=$HOME/.oh-my-zsh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE="git-lab.boldapps.net"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Aliases
alias nv="nvim"
alias kctx="kubectx"
alias kns="kubens"
alias cpu="top -F -R -o cpu"
alias chrome="open -a 'Google Chrome'"

# Theme and plugins
ZSH_THEME="robbyrussell"

plugins=(
  git
  fasd
  git-flow
  kubectl
  zsh-autosuggestions
  kube-ps1
)

# Source files and init
source $ZSH/oh-my-zsh.sh
eval "$(fasd --init auto)"
source ~/.oh-my-zsh/plugins/kube-ps1
PROMPT='$(kube_ps1)'$PROMPT
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
eval "$(direnv hook zsh)"
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
