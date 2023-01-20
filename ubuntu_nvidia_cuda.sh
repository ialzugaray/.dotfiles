#!/bin/bash
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_network

DISTRO=ubuntu$(cat /etc/*release | head -n2 | tail -n1 | grep -o "[0-9][0-9].[0-9][0-9]*" | tr -d .)
MARCH=$(uname -m)
KEYRING_FILENAME=cuda-keyring_1.0-1_all.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO/$MARCH/$KEYRING_FILENAME
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
rm $KEYRING_FILENAME

echo ' # >>> CUDA Paths >>> ' >> ~/.bashrc
echo 'export PATH="/usr/local/cuda-11.7/bin${PATH:+:${PATH}}"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda-11.7/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"' >> ~/.bashrc
echo -e ' # <<< CUDA Paths <<< \n ' >> ~/.bashrc


