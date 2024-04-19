#!/bin/bash
# bash < (curl -s  https://raw.githubusercontent.com/ialzugaray/.dotfiles/master/ubuntu2204_basics.sh)

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

# Other apps
sudo snap install --classic code  # VSCode
code --install-extension ms-python.python 
code --install-extension ms-toolsai.jupyter 
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cmake-tools

sudo apt install -y ffmpeg # FFMPEG
sudo apt install -y vlc # VLC
sudo snap install inkscape # Inkscape
sudo apt -y install neovim # Neovim
sudo apt -y install tmux # Tmux
sudo apt -y install terminator # Terminator
sudo snap install teams-for-linux # Teams for Linux
sudo snap install obsidian --classic # Obsidian

# Repos
git clone git@github.com:ialzugaray/vault.git
git clone git@github.com:ialzugaray/.dotfiles.git

