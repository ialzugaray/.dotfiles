#!/bin/bash
EMAIL="alzugaray.ign@gmail.com"

# Public SSH key 
echo | ssh-keygen -t ed25519 -C $EMAIL

# git
sudo apt install -y gh git-all 
git config --global user.email $EMAIL

# Register ssh key within github
gh auth login -s write:public_key --web # (interactive) Login via web using github cli
gh ssh-key add ~/.ssh/id_ed25519.pub -t $(uname -n) # Add sshkey to github account via cli

