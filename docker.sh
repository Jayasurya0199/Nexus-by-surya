#!/bin/bash

# Exit on error
set -e

# Update package list
echo "Updating package list..."
sudo apt-get update

# Install required dependencies
echo "Installing required packages..."
sudo apt-get install -y ca-certificates curl gnupg

# Create keyrings directory if not exists
echo "Creating keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's official GPG key
echo "Downloading Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null

# Set proper permissions
echo "Setting permissions for the GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again to include Docker repo
echo "Updating package list after adding Docker repository..."
sudo apt-get update

echo "Docker repository successfully added!"
