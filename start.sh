
#!/bin/bash

# Check if the server name is provided as a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: ./start.sh <server_name>"
    exit 1
fi

# Extract server details from the config.yaml using sed and awk
SERVER_NAME=$1
SSH_COMMAND=$(awk -v server_name="$SERVER_NAME" '/name:/{if ($2 == server_name) flag=1; next} flag && /ssh_command:/{print $2; exit}' config.yaml)
DIRECT_IP=$(awk -v server_name="$SERVER_NAME" '/name:/{if ($2 == server_name) flag=1; next} flag && /direct_ip:/{print $2; exit}' config.yaml)
PORT_RANGE=$(awk -v server_name="$SERVER_NAME" '/name:/{if ($2 == server_name) flag=1; next} flag && /port_range:/{print $2; exit}' config.yaml)

# Use the extracted details to form the SSH command
SSH_COMMAND_FULL="${SSH_COMMAND} 'bash -l -c "cd ~/jupyter-purcell && source activate $(head -1 environment.yml | cut -f2 -d ' ') && jupyter notebook --no-browser --port=${PORT_RANGE}"'"

# Print the SSH command and execute it
echo $SSH_COMMAND_FULL
eval $SSH_COMMAND_FULL
