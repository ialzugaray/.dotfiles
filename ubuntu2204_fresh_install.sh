#!/bin/bash
# Global VARS
EMAIL="alzugaray.ign@gmail.com"

echo_section_header(){
	echo -e "\n========================================\n"
	echo -e "Executing: $1 \n"
}

# Basics for ubuntu
echo_section_header "Ubuntu Basics"
sudo apt install linux-headers-$(uname -r) # Kernel headers
sudo apt install -y build-essential # GCC

# Public SSH key 
echo_section_header "Public SSH key"
echo | ssh-keygen -t ed25519 -C $EMAIL

# git
echo_section_header "GIT"
sudo apt install -y gh git-all 
git config --global user.email 

# Register ssh key within github
echo_section_header "GIT SSH Key add"
gh auth login -s write:public_key --web # (interactive) Login via web using github cli
gh ssh-key add ~/.ssh/id_ed25519.pub -t $(uname -n) # Add sshkey to github account via cli

# Conda
echo_section_header "Conda"
MINICONDA_FILENAME="Miniconda3-py39_4.12.0-Linux-x86_64.sh"
wget --backups 0 https://repo.anaconda.com/miniconda/$MINICONDA_FILENAME
bash $MINICONDA_FILENAME -b
source /home/$USER/miniconda3/bin/activate 
conda init
rm $MINICONDA_FILENAME
exec bash

