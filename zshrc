
export ZSH=$HOME/.oh-my-zsh
alias helm214upgrade='helm214 upgrade --namespace cashier-ci-main -f values.yaml gitlab-runner gitlab/gitlab-runner'
alias phpunit='XDEBUG_MODE=off ./vendor/bin/phpunit -v'
alias csfix='php -n vendor/friendsofphp/php-cs-fixer/php-cs-fixer fix -v'
alias nv="nvim"
alias vimrc="nvim ~/.vimrc"
alias nvrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias srczsh="source ~/.zshrc"
alias srcvim="source ~/.vimrc"
alias kctx="kubectx"
alias kns="kubens"
alias chns="kubectl config set-context --current --namespace"
alias cpu="top -F -R -o cpu"
alias kunset="kubectl config unset"
alias krc="kubectl config rename-context"
alias chrome="open -a 'Google Chrome'"

ZSH_THEME="robbyrussell"

plugins=(
    git
    fasd
    git-flow
    kubectl
    zsh-autosuggestions
    kube-ps1
)
eval "$(fasd --init auto)"
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'


export FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"

source ~/.oh-my-zsh/plugins/kube-ps1
PROMPT='$(kube_ps1)'$PROMPT

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Automatically set node version based on .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  # elif [ "$node_version" != "$(nvm version default)" ]; then
  #   echo "Reverting to nvm default version"
  #   nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE="git-lab.boldapps.net"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexander.gotfrid/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alexander.gotfrid/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexander.gotfrid/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alexander.gotfrid/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
