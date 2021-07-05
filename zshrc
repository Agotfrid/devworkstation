# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="bullet-train"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fasd
    git-flow
    kubectl
    zsh-autosuggestions
    kube-ps1
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
# User configuration


export KUBECONFIG=~/.kube/config:~/.kube/test_cluster_kubeconfig:~/.kube/cashier-ci-cluster-kubeconfig:~/.kube/staging_cluster_kubeconfig

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

export CHECKOUT_HOSTNAME=alexander-dev.bold.ninja
export CHECKOUT_REPO_PATH="/Users/alexander.gotfrid/repo/cashier"
export CHECKOUT_HTTP_INTERNAL_PORT=8081
export CHECKOUT_HTTPS_INTERNAL_PORT=8082
export CHECKOUT_URI=https://alexander-dev.bold.ninja

export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/opt/go@1.14/bin:$PATH"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexander.gotfrid/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alexander.gotfrid/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexander.gotfrid/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alexander.gotfrid/google-cloud-sdk/completion.zsh.inc'; fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias psalm='composer psalm'
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
alias phpini="/usr/local/etc/php/7.4/php.in"
alias buildcashier="cd admin && yarn install && yarn build-dev && \
cd ../checkout-default-theme && yarn install && yarn build && \
cd ../e2etests && yarn install && \
cd ../bold-checkout-flows && yarn install && yarn build  && \
cd ../back-end && composer install --ignore-platform-reqs && \
cd ../storefront-assets-shopify && yarn install && yarn run build && \
cd ../checkout-core && yarn install && yarn build && \
cd ../checkout-core-v2 && yarn install && yarn build && \
cd ../payment-method-management && yarn install && yarn build && \
cd ../payment-method-frame && yarn install && yarn build && cd ../"
alias cpu="top -F -R -o cpu"
alias kunset="kubectl config unset"
alias krc="kubectl config rename-context"
alias chrome="open -a 'Google Chrome'"

eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"
source $ZSH/oh-my-zsh.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
