#!/bin/bash

server_ip="192.168.56.110"

echo I am provisioning server...
apt update && apt upgrade
apt install curl -y
apt install -y docker docker-compose openrc
service docker start

#k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
mv ./nvim.appimage /usr/bin/nvim
chmod +x /usr/bin/nvim

k3d cluster create dev-cluster -p "8080:80@loadbalancer" -p "8888:88@loadbalancer" &&
	kubectl create ns argocd &&
	kubectl create ns dev

curl -L -o devspace "https://github.com/loft-sh/devspace/releases/latest/download/devspace-linux-amd64"
sudo install -c -m 0755 devspace /usr/local/bin
