
#!/bin/bash

# Check if jupyter directory exists
if [ ! -d "jupyter-purcell" ]; then
    # Clone the repository from GitHub
    git clone https://github.com/txrunn/jupyter-purcell.git
fi

# Navigate to the jupyter-purcell directory
cd jupyter-purcell

# Set up the Conda environment
./setup_environment.sh

# Run the open_jupyter.py script for interactive server selection
python open_jupyter.py
