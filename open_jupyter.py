
import subprocess
import sys
import os
import yaml
import questionary

# Function to check if a module is installed
def is_module_installed(module_name):
    try:
        __import__(module_name)
        return True
    except ImportError:
        return False

# Check for the necessary modules
necessary_modules = ["yaml", "questionary"]
for module in necessary_modules:
    if not is_module_installed(module):
        print(f"Error: '{module}' module is missing.")
        print("To resolve this, run the following command in your terminal or command prompt:")
        print(f"pip install {module}")
        sys.exit(1)  # Exit the script if the dependency is missing

# Retrieve the server configuration details from the config.yaml file
with open('config.yaml', 'r') as file:
    config = yaml.load(file, Loader=yaml.FullLoader)

# Create a list of available servers from the configuration for the menu
server_names = [server['name'] for server in config['servers']]
selected_server_name = questionary.select("Select a server:", choices=server_names).ask()

# Retrieve the details of the selected server
selected_server = next((server for server in config['servers'] if server['name'] == selected_server_name), None)

# Prompt the user for their HPC username
username = input(f"Enter your username for {selected_server['name']}: ")

# Construct the SSH command using the selected server's details, the provided username, 
# the location parameter from the config, and specify the start.sh script to be run on the HPC after login
ssh_command = f"{selected_server['ssh_command'].replace('UMID', username)} 'bash -l -c '{selected_server['location']}/start.sh''"

# Execute the constructed SSH command to start the Jupyter Notebook on the HPC
# Wait for the SSH subprocess to complete before ending the Python script
subprocess.call(ssh_command, shell=True)
