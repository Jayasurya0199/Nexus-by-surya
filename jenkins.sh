echo "Installing OpenJDK..."
sudo apt install -y openjdk-17-jdk

# Verify Java installation
java -version

# Add Jenkins repository key
echo "Adding Jenkins repository key..."
wget -O- https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install -y jenkins

# Start and enable Jenkins
echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check Jenkins status
echo "Jenkins service status:"
sudo systemctl status jenkins --no-pager

# Display initial admin password
echo "Fetching Jenkins initial admin password..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Jenkins installation completed!"
echo "Access Jenkins at: http://your-server-ip:8080"
