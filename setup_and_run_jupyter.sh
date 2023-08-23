
#!/bin/bash

# Check if jupyter directory exists
if [ ! -d "jupyter" ]; then
    # Clone the repository from GitHub
    git clone https://github.com/txrunn/jupyter-purcell.git jupyter
fi

# Navigate to the jupyter directory
cd jupyter

# Make necessary scripts executable
chmod +x setup_environment.sh start.sh open_jupyter.py

# Set up the Conda environment
./setup_environment.sh

# Run the open_jupyter.py script for interactive server selection
python open_jupyter.py
