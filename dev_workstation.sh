#!/bin/bash

# Function to check OS type
detect_os() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "MacOS"
  else
    echo "Unsupported OS"
    exit 1
  fi
}

# Copy configuration files
copy_config_files() {
  cp zshrc ~/.zshrc
  cp tmux-linux.conf ~/.tmux.conf
  cp vimrc ~/.vimrc
  mkdir -p ~/.config/nvim
  cp init.vim ~/.config/nvim/init.vim
}

# Source configuration files
source_config_files() {
  tmux source ~/.tmux.conf
}

# Install packages based on OS type
install_packages() {
  local os_type=$1

  if [ "$os_type" == "Linux" ]; then
    sudo apt update
    sudo apt install -y tmux git golang zsh wget curl neovim vim jq openssl python3 ruby php telnet tree yarn xclip cmake silversearcher-ag
    sudo apt update
    sudo apt install -y fasd
    go install github.com/mfuentesg/ksd@latest
    sudo apt --fix-broken install
    sudo snap install kustomize --classic
    sudo snap install fzf --classic
    sudo snap install k9s --classic
    sudo snap install kubectx --classic
    sudo snap install kubectl --classic
    sudo snap install stern --classic
    sudo snap install tfenv --classic
    sudo snap install ytt --classic
    sudo snap install docker
    sudo snap install code --classic
  elif [ "$os_type" == "MacOS" ]; then
      if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      fi
    brew install tmux git go zsh wget curl neovim vim helm jq openssl python3.8 python ruby php telnet tree yarn the_silver_searcher cmake \
    kustomize fzf grep k9s mfuentesg/tap/ksd kubectx kubernetes-cli stern tfenv ytt
    brew install --cask docker
    brew install --cask visual-studio-code
    brew install --cask sequel-ace
  fi

  #set zsh as default shell
  sudo chsh -s $(which zsh)

  #tmux tpm install if needed
  if [ ! -f "$HOME/.tmux/plugins/tpm/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  #Configure vim
  # Install VimPlug
  if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  #Run Vim specific commands
  vim +'PlugInstall --sync' +qa
  vim +'GoInstallBinaries' +qa

}

install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/jonmosco/kube-ps1.git $ZSH_CUSTOM/plugins/kube-ps1
    source ~/.zshrc
  else
    echo "Oh My Zsh is already installed."
  fi
}

install_direnv() {
  local os_type=$1

  if [ "$os_type" == "Linux" ]; then
    sudo apt install -y direnv
  elif [ "$os_type" == "MacOS" ]; then
    brew install direnv
  fi

  echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
}

main() {
  local os_type=$(detect_os)
  install_oh_my_zsh
  install_packages "$os_type"
  install_direnv "$os_type"
  copy_config_files
  source_config_files
}

main
