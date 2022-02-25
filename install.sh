#!/bin/bash

echo "Starting automated setup"

echo "Installing git, curl, nodejs, yarn-classic, gh"
sudo apt install git curl nodejs gh -y
sudo npm install -g yarn

echo "Installing lazygit"
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

echo "Intalling neovim"
sudo apt install neovim python3-neovim -y

echo "Installing nerd fonts"
curl -fLo "JetBrainsMono Nerd Font Complete.otf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/complete/JetBrainsMono%20Nerd%20Font%20Complete.otf
sudo cp "JetBrainsMono Nerd Font Complete.otf" /usr/local/share/fonts



echo "Setting up oh-my-zsh"
sudo apt install zsh -y
chsh -s $(which zsh)

echo "Setting up vim plugins"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Setting up config files..."

ln -vs ./init.vim ~/.config/nvim/init.vim
echo "init.vim symlinked"

ln -vs ./.zshrc ~/.zshrc
echo ".zshrc symlinked"

ln -vs ./global-git ~/global-git
echo "global-git/ symlinked"


echo "Setting global git hooks path"
git config --global core.hooksPath ~/global-git/hooks
