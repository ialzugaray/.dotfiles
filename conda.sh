MINICONDA_FILENAME="Miniconda3-py39_4.12.0-Linux-x86_64.sh"
wget --backups 0 https://repo.anaconda.com/miniconda/$MINICONDA_FILENAME
bash $MINICONDA_FILENAME -b
source /home/$USER/miniconda3/bin/activate 
conda init
rm $MINICONDA_FILENAME
exec bash
