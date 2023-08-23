
#!/bin/bash

# Path to the directory containing this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Initialize conda for shell interaction
eval "$($(which conda || echo /software/neurodev/anaconda3/bin/conda) shell.bash hook)"

# Check if mamba is installed
if ! command -v mamba &> /dev/null
then
    $(which conda || echo /software/neurodev/anaconda3/bin/conda) install mamba -c conda-forge -y
fi

# Set up the conda environment using the environment.yml file located in the current directory
mamba env create -f $DIR/environment.yml

# Source the conda profile script to ensure conda commands are available
source /software/neurodev/anaconda3/etc/profile.d/conda.sh

# Extract the environment name from the environment.yml file
ENV_NAME=$(sed -n 's/^name: //p' $DIR/environment.yml)

# Activate the newly created conda environment
conda activate $ENV_NAME
