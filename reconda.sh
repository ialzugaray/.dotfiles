#!/bin/bash
# Usage: source reconda.sh
eval "$(conda shell.bash hook)"

if [[ $# -eq 2 ]] && [[ $1 == "--install" ]]; then

        alias_str="alias reconda=\"source $PWD/reconda.sh\""
	if [[ $2 == "bash" ]] || [[ 2 == "sh" ]]; then 
		echo "Installing for bash"
		echo $alias_str >> ~/.bashrc
	elif [[ $2 == "zsh" ]]; then 
		echo "Installing for zsh"
		echo $alias_str >> ~/.zshrc
	else
		echo "Unknown terminal type"
		exit 1
	fi
	echo "Installation done"
	exit 0
fi

if test -f "environment.yaml"; then
	env_filename="environment.yaml"
elif test -f "environment.yml"; then
	env_filename="environment.yml"
else 
	echo "Environment file not found"
	exit 1
fi


line=$(head -n 1 $env_filename)
echo $line
env_name="$(grep -Po 'name: \K(.*)' $env_filename)"
conda activate # Deactivate current environment into base
conda env remove -y --name $env_name
conda env create -y --file $env_filename 
 
echo conda activate $env_name
conda activate $env_name
