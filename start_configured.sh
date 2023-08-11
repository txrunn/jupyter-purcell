
#!/bin/bash

# Read environment name from config.yaml
ENV_NAME=$(yq e '.conda_env_name' /path_to_config/config.yaml)

# Initialize conda
eval "$(/software/neurodev/anaconda3/bin/conda shell.bash hook)"

# Activate the conda environment specified in config.yaml
source /software/neurodev/anaconda3/etc/profile.d/conda.sh
conda activate $ENV_NAME

# Ensure Jupyter and IPyKernel are installed
python3 -c "
try:
    import jupyter, ipykernel
except ImportError:
    print('Jupyter and/or IPyKernel not found. Installing...')
    import os
    os.system('pip3 install --user jupyter ipykernel')
"

# Start IPython kernel
ipython kernel -f ~/kernel.json

# Start Jupyter Notebook on port 8889 (this can be made dynamic based on user)
jupyter notebook --no-browser --port=8889
