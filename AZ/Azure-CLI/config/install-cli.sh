#!/bin/bash

# Set the URL for the Azure CLI installation script
INSTALL_SCRIPT_URL="https://aka.ms/InstallAzureCLIDeb"

# Set the package dependencies required for Azure CLI
DEPENDENCIES=("apt-transport-https" "ca-certificates" "curl" "gnupg" "lsb-release")

# Set the path for the Microsoft GPG key
MICROSOFT_GPG_KEY_URL="https://packages.microsoft.com/keys/microsoft.asc"
MICROSOFT_GPG_KEY_PATH="/etc/apt/keyrings/microsoft.gpg"

# Set the Azure CLI repository configuration
AZURE_CLI_REPO_URL="https://packages.microsoft.com/repos/azure-cli/"
AZURE_CLI_REPO_SUITE="$(lsb_release -cs)"
AZURE_CLI_REPO_COMPONENTS="main"
AZURE_CLI_REPO_ARCHITECTURES="$(dpkg --print-architecture)"

# Install the dependencies
echo "Installing dependencies..."
sudo apt-get update
for dependency in "${DEPENDENCIES[@]}"; do
  sudo apt-get install -y "$dependency"
done

# Create the directory for the Microsoft GPG key
echo "Creating directory for Microsoft GPG key..."
sudo mkdir -p "$(dirname "$MICROSOFT_GPG_KEY_PATH")"

# Download and install the Microsoft GPG key
echo "Downloading and installing Microsoft GPG key..."
curl -sLS "$MICROSOFT_GPG_KEY_URL" | gpg --dearmor | sudo tee "$MICROSOFT_GPG_KEY_PATH" > /dev/null
sudo chmod go+r "$MICROSOFT_GPG_KEY_PATH"

# Configure the Azure CLI repository
echo "Configuring Azure CLI repository..."
echo "Types: deb
URIs: $AZURE_CLI_REPO_URL
Suites: $AZURE_CLI_REPO_SUITE
Components: $AZURE_CLI_REPO_COMPONENTS
Architectures: $AZURE_CLI_REPO_ARCHITECTURES
Signed-by: $MICROSOFT_GPG_KEY_PATH" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

# Update the package list and install Azure CLI
echo "Updating package list and installing Azure CLI..."
sudo apt-get update
sudo apt-get install -y azure-cli

echo "Azure CLI installation complete!"