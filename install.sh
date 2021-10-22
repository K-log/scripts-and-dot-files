#!/bin/bash

echo "Setting up config files..."

ln -vs ./init.vim ~/.config/nvim/init.vim
echo "init.vim symlinked"

ln -vs ./.zshrc ~/.zshrc
echo ".zshrc symlinked"

ln -vs ./global-git ~/global-git
echo "global-git/ symlinked"
