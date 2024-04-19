#!/bin/bash
# bash < (curl -s  https://raw.githubusercontent.com/ialzugaray/.dotfiles/master/ubuntu2204_fresh_install.sh)

echo_section_header(){
	echo -e "\n========================================\n"
	echo -e "Executing: $1 \n"
}

# Basics for ubuntu
echo_section_header "Ubuntu Basics"
sudo apt install linux-headers-$(uname -r) # Kernel headers
sudo apt install -y build-essential # GCC
sudo apt install -y cmake
sudo apt install -y openssh-server # SSH Server
sudo apt install -y curl 

# Git
echo_section_header "GIT & Public SSH key"
echo Please add email:
read EMAIL
echo | ssh-keygen -t ed25519 -C $EMAIL # Public SSH key 
sudo apt install -y gh git-all  # git
git config --global user.email $EMAIL
# Register ssh key within github
gh auth login -s write:public_key --web # (interactive) Login via web using github cli
gh ssh-key add ~/.ssh/id_ed25519.pub -t $(uname -n) # Add sshkey to github account via cli

# Conda - Miniforge
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
rm -rf Miniforge3-$(uname)-$(uname -m).sh

# VSCode
sudo snap install --classic code 
code --install-extension ms-python.python 
code --install-extension ms-toolsai.jupyter 
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cmake-tools

# Teams
sudo snap install teams

# Zotero
sudo snap install zotero-snap

# FFMPEG
sudo apt install -y ffmpeg

# VLC
sudo apt install -y vlc

# Inkscape
sudo snap install inkscape

# Neovim
sudo apt -y install neovim

# Tmux
sudo apt -y install tmux

# Terminator
sudo apt -y install terminator

# Teams for Linux
sudo snap install teams-for-linux

