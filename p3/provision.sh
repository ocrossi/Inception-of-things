#!/bin/bash

server_ip="192.168.56.110"

echo I am provisioning server...
sudo -i
apk add curl
apk add --update docker docker-compose openrc
service docker start

#k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#echo "alias k=\"sudo kubectl\"" >>/home/vagrant/.profile
#echo "alias kubectl=\"sudo kubectl\"" >>/home/vagrant/.profile
#echo "alias k3d=\"sudo k3d\"" >>/home/vagrant/.profile

#export INSTALL_K3S_EXEC="--bind-address=${server_ip} --node-external-ip=${server_ip} --flannel-iface=eth1"
#curl -sfL https://get.k3s.io | sh -
# Helm install. For some reason cant install nginx ingress threw helm
#curl -lSO https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz
#tar -xzvf helm-v3.14.4-linux-amd64.tar.gz
#cd linux-amd64/
#sudo mv helm /usr/local/bin/
# some style plz, shadow for chsh
# kubectl utils
