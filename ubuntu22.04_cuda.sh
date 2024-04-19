#!/bin/bash
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_network

#DISTRO=ubuntu$(cat /etc/*release | head -n2 | tail -n1 | grep -o "[0-9][0-9].[0-9][0-9]*" | tr -d .)
#MARCH=$(uname -m)
#KEYRING_FILENAME=cuda-keyring_1.0-1_all.deb
#wget https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO/$MARCH/$KEYRING_FILENAME
#sudo dpkg -i cuda-keyring_1.0-1_all.deb
#sudo apt-get update
#sudo apt-get -y install cuda
#rm $KEYRING_FILENAME
#echo ' # >>> CUDA Paths >>> ' >> ~/.bashrc
#echo 'export PATH="/usr/local/cuda-11.7/bin${PATH:+:${PATH}}"' >> ~/.bashrc
#echo 'export LD_LIBRARY_PATH="/usr/local/cuda-11.7/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"' >> ~/.bashrc
#echo -e ' # <<< CUDA Paths <<< \n ' >> ~/.bashrc

# Latest
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
#sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-#keyring_1.0-1_all.deb
#sudo dpkg -i cuda-keyring_1.0-1_all.deb
#sudo apt-get update
#sudo apt-get -y install cuda

# https://developer.nvidia.com/cuda-12-1-1-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.1-530.30.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.1-530.30.02-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

echo ' # >>> CUDA Paths >>> ' >> ~/.bashrc
echo 'export PATH="/usr/local/cuda/bin${PATH:+:${PATH}}"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"' >> ~/.bashrc
echo -e ' # <<< CUDA Paths <<< \n ' >> ~/.bashrc





