#!/bin/bash
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
bash git_with_ssh.sh

# Conda
echo_section_header "Conda"
bash conda.sh

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


