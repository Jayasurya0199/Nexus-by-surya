#!/bin/bash

# Exit on error
set -e

echo "Updating package index..."
sudo apt update -y

echo "Installing Git..."
sudo apt install -y git

echo "Installing Java (OpenJDK 17)..."
sudo apt install -y openjdk-17-jdk

echo "Verifying Java version..."
java -version

echo "Installing Maven..."
sudo apt install -y maven

echo "Verifying Maven version..."
mvn -version

echo "Adding Jenkins GPG key and repository..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package index again..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Checking Jenkins status..."
sudo systemctl status jenkins

echo "Installation complete!"
echo "Visit Jenkins at: http://<your-server-ip>:8080"
echo "To get the initial admin password, run: sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
