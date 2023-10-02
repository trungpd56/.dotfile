#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt -y install fzf zoxide python3-pip rename vifm neovim cargo stow curl npm

# pip3 install updog youtube-dl
cargo install stylua

# install nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install stable --reinstall-packages-from=current

# source my env
if [ -f ~/.bashrc ]; then
    grep myenv ~/.bashrc || echo "source ~/.dotfile/myenv" >> ~/.bashrc
    grep zoxide ~/.bashrc || echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
elif [ -f ~/.zshrc ]; then
    grep myenv ~/.zshrc || echo "source ~/.dotfile/myenv" >> ~/.zshrc
    grep zoxide ~/.zshrc || echo 'eval "$(zoxide init bash)"' >> ~/.zshrc
fi

# Tmux log - Prefix + Alt-Shift-P
rm -rf ~/tmux-logging
git clone https://github.com/tmux-plugins/tmux-logging ~/tmux-logging

STOW_FOLDERS="tmux,nvim"
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done
