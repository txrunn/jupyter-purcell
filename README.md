
# Jupyter Starter

A set of scripts and configuration files to easily start Jupyter Notebooks on High-Performance Computing (HPC) servers. The repository can be found at [github.com/txrunn/jupyter-purcell](https://github.com/txrunn/jupyter-purcell).

## Quick Start

For a quick setup and to start the Jupyter Notebook on your chosen server, simply run:

```bash
curl -O https://github.com/txrunn/jupyter-purcell/raw/main/setup_and_run_jupyter.sh && bash setup_and_run_jupyter.sh
```

This will download the necessary files, set up the Conda environment, and launch an interactive script to let you select a server and start Jupyter Notebook.

## Detailed Setup

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/txrunn/jupyter-purcell.git
    ```

2. **Set Up the Conda Environment**:
    - Navigate to the cloned repository directory:
      ```bash
      cd jupyter-purcell
      ```
    - Execute the `setup_environment.sh` script to set up the conda environment specified in the `environment.yml` file:
      ```bash
      ./setup_environment.sh
      ```

3. **Configure Your Servers**:
    - Edit the `config.yaml` file to specify your server details and desired port range.
    - To add more servers, simply extend the `servers` section in the `config.yaml` file.

## Usage

1. **Start Jupyter Notebook on HPC**:
    - Run the `open_jupyter.py` script. If any dependencies are missing, you'll be prompted to install them:
      ```bash
      python open_jupyter.py
      ```

---



1. **Clone the Repository**:
    ```bash
    git clone https://github.com/txrunn/jupyter-purcell.git
    ```

2. **Set Up the Conda Environment**:
    - Navigate to the cloned repository directory:
      ```bash
      cd jupyter-purcell
      ```
    - Execute the `setup_environment.sh` script to set up the conda environment specified in the `environment.yml` file:
      ```bash
      ./setup_environment.sh
      ```

3. **Configure Your Servers**:
    - Edit the `config.yaml` file to specify your server details and desired port range.
    - To add more servers, simply extend the `servers` section in the `config.yaml` file.

## Usage

1. **Start Jupyter Notebook on HPC**:
    - Run the `open_jupyter.py` script. If any dependency is missing, the script will notify you with instructions on how to install it:
      ```bash
      python open_jupyter.py
      ```
    - Follow the prompts to select your server and enter your username.
    - A web browser will open with your Jupyter Notebook session running on the HPC.

2. **Terminate the Session**:
    - When done with your Jupyter Notebook session, press Enter in the terminal where you started the session to terminate it.

## Configuration

- The `config.yaml` file allows for customization of server details and port ranges.
- The `environment.yml` file specifies the Python environment and required packages for the Jupyter Notebook sessions.

