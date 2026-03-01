sudo apt-get --purge remove "*cublas*" "*cufft*" "*curand*" \
 "*cusolver*" "*cusparse*" "*npp*" "*nvjpeg*" "cuda*" "nsight*"
sudo apt-get --purge remove "*nvidia*"
sudo apt-get autoremove
sudo apt-get autoclean

