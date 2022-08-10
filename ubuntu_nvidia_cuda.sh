#!/bin/bash
# From: https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ubuntu-installation
sudo apt-key del 7fa2af80 # Remove Outdated Signing Key

export DISTRO=ubuntu$(cat /etc/*release | head -n2 | tail -n1 | grep -o "[0-9][0-9].[0-9][0-9]*" | tr -d .)
export MARCH=$(uname -m)

wget https://developer.download.nvidia.com/compute/cuda/repos/$(DISTRO)/$(MARCH)/cuda-$(DISTRO).pin
sudo mv cuda-$(DISTRO).pin /etc/apt/preferences.d/cuda-repository-pin-600

sudo apt update
sudo apt install -y cuda nvidia-gds

sudo reboot

