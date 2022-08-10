#!/bin/bash
echo_section_header(){
	echo -e "\n========================================\n"
	echo -e "Executing: $1 \n"
}

# Basics for ubuntu
echo_section_header "Ubuntu Basics"
sudo apt install linux-headers-$(uname -r) # Kernel headers
sudo apt install -y build-essential # GCC

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
