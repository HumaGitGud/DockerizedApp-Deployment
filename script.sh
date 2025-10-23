# Setup and Deploy script

#!/bin/bash
set -e

# --- Configuration ---
REPO_URL="https://github.com/HumaGitGud/DockerizedApp-Deployment.git"
# ---------------------

REPO_DIR=$(basename "$REPO_URL" .git)

echo "--- [Step 1: Updating system & installing tools] ---"
sudo apt update
sudo apt install -y git curl

echo "--- [Step 2: Installing Docker] ---"
if ! command -v docker &> /dev/null
then
    echo "Docker not found, installing..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
else
    echo "Docker is already installed."
fi

echo "--- [Step 3: Cloning or Updating App Repo] ---"
if [ -d "$REPO_DIR" ]; then
    echo "Repository directory exists, pulling latest changes..."
    cd "$REPO_DIR"
    git pull
else
    echo "Cloning repository..."
    git clone "$REPO_URL"
    cd "$REPO_DIR"
fi

echo "--- [Step 4: Building and Running App with Docker Compose] ---"
sudo docker compose up -d --build

echo "--- [Step 5: Configuring Firewall] ---"
# This section automates the UFW part
echo "Configuring firewall..."
sudo ufw allow ssh    # MUST allow SSH first
sudo ufw allow 8080   # allow your app's port
sudo ufw --force enable # force-enable the firewall

echo "--- [All Done!] ---"
echo "Deployment is complete."
echo "You can now access your app at http://<your_vm_ip>:8080"