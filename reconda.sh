#!/bin/bash
# Usage: source reconda.sh
eval "$(conda shell.bash hook)"

filename="environment.yaml"
line=$(head -n 1 $filename)
echo $line
env_filename="environment.yaml"
env_name="$(grep -Po 'name: \K(.*)' $env_filename)"
conda activate # Deactivate current environment into base
conda env remove -y --name $env_name
conda env create -y --file $env_filename 
 
echo conda activate $env_name
conda activate $env_name
