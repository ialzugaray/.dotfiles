#!/bin/bash
echo_section_header(){
	echo -e "\n========================================\n"
	echo -e "Executing: $1 \n"
}

# Basics for ubuntu
echo_section_header "Ubuntu Basics"
sudo apt install linux-headers-$(uname -r) # Kernel headers
sudo apt install -y build-essential # GCC

echo_section_header "GIT & Public SSH key"
bash git_with_ssh.sh

# Conda
echo_section_header "Conda"
bash conda.sh
