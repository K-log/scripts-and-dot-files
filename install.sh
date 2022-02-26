#!/bin/bash

echo "Starting automated setup"

initial_setup() {
  echo "Starting initial package setup"
  echo "=============================="
  echo "Installing curl, maven, nodejs"
  apt install curl maven nodejs -yq --print-uris

  echo "Install yarn"
  npm install -g yarn

  echo "Initial package setup complete!"
  echo "------------------------------"
}

setup_git() {
  echo "Starting git setup..."
  echo "=============================="
  echo "Installing git"
  apt install git -yq --print-uris


  echo "Installing lazygit"
  add-apt-repository ppa:lazygit-team/release
  apt-get update
  apt-get install lazygit -yq --print-uris

  cp -v ./global-git "$HOME/global-git"
  echo "global-git/ copied"

  echo "Setting global git hooks path"
  git config --global core.hooksPath ~/global-git/hooks

  echo "Git setup complete!"
  echo "------------------------------"
}


setup_zsh() {
    echo "Starting zsh setup..."
    echo "=============================="
    echo "Installing zsh and setting as default shell"
    apt install zsh -yq --print-uris
    chsh -s $(which zsh)

    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    cp -v ./.zshrc "$HOME/.zshrc"
    echo ".zshrc copied"

    echo "Install p10k zsh"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


    #echo "Installing nerd fonts"
    #curl -fLo "JetBrainsMono Nerd Font Complete.otf" \
    #    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/complete/JetBrainsMono%20Nerd%20Font%20Complete.otf
    #cp "JetBrainsMono Nerd Font Complete.otf" /usr/local/share/fonts

    echo "Zsh setup complete!"
    echo "------------------------------"
}

setup_neovim() {
    echo "Starting neovim setup..."
    echo "=============================="
    echo "Installing neovim"
    apt install neovim python3-neovim -yq --print-uris

    mkdir "$HOME/.config/nvim/"
    cp ./init.vim "$HOME/.config/nvim/init.vim"
    echo "init.vim copied"

    echo "Setting up vim plugins"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


    echo "Zsh setup complete!"
    echo "------------------------------"
}


initial_setup()
setup_git()
setup_zsh()
setup_neovim()
