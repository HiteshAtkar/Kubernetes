#!/bin/bash

set -e 

echo "Updating packages..."
sudo apt update -y

echo "Installing dependencies..."
sudo apt install -y curl wget apt-transport-https ca-certificates conntrack

echo "Installing Docker..."
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker $USER && newgrp docker

echo "Downloading Minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

echo "Downloading kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo "Installation complete!"
echo "You may need to log out and log back in for Docker group changes to take effect."
