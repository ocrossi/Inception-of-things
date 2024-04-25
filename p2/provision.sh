#!/bin/bash

server_ip="192.168.56.110"

echo I am provisioning server...
sudo -i
apk add curl
apk add --update docker docker-compose openrc
service docker start
export INSTALL_K3S_EXEC="--bind-address=${server_ip} --node-external-ip=${server_ip} --flannel-iface=eth1"
curl -sfL https://get.k3s.io | sh -
# Helm install. For some reason cant install nginx ingress threw helm
#curl -lSO https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz
#tar -xzvf helm-v3.14.4-linux-amd64.tar.gz
#cd linux-amd64/
#sudo mv helm /usr/local/bin/
# some style plz, shadow for chsh
# kubectl utils
#echo "alias k=\"sudo kubectl\"" >>/home/vagrant/.bashrc
#echo "alias kubectl=\"sudo kubectl\"" >>/home/vagrant/.bashrc

echo "Starting to deploy k3s resources"
sleep 60
echo "been sleeping 60 sec"
cd /vagrant_shared/overlay

# create my namespace

ns="iot"

kubectl create ns $ns
kubectl config set-context --current --namespace=$ns

kubectl apply -k app1
kubectl apply -k app2
kubectl apply -k app3

# install nginx controller
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml
