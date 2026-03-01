#!/bin/bash

# --- Configuration ---
# The name of the Conda environment you want to use.

# --- Sourcing Conda initialization ---
# Source the Conda hook script to make `conda` commands available.
# This path might vary, so adjust if necessary.
CONDA_BASE=$(conda info --base)
source "$CONDA_BASE/etc/profile.d/conda.sh"

# --- Define a cleanup function using 'trap' ---
# The trap command ensures that the `conda deactivate` command is run
# automatically when the script exits, whether it succeeds or fails.
cleanup() {
  echo "Deactivating Conda environment..."
  conda deactivate
}
trap cleanup EXIT

# --- Main Script Logic ---
CONDA_ENV_NAME="youtube-dl" 
echo "Activating Conda environment: $CONDA_ENV_NAME"
conda create -y -n "$CONDA_ENV_NAME" python=3.9 pip
conda activate "$CONDA_ENV_NAME"
pip install --upgrade --force-reinstall "git+https://github.com/ytdl-org/youtube-dl.git"
#  Check if the activation was successful.
if [ $? -ne 0 ]; then
  echo "Error: Failed to activate Conda environment '$CONDA_ENV_NAME'."
  exit 1
fi

echo "Conda environment activated. Running your commands..."

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 "
    exit 1
fi

# Replace the following lines with your actual commands.
# Example: run a Python script
youtube-dl "$1"

# Example: check the active environment
# conda info --envs

# ... add more commands here ...

echo "Script finished."
