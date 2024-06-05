echo "I am the user provisionning script"

sudo apt install -y git zsh fuse htop

sudo chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "alias k=\"sudo kubectl\"" >>/home/vagrant/.zshrc
echo "alias kubectl=\"sudo kubectl\"" >>/home/vagrant/.zshrc
echo "alias k3d=\"sudo k3d\"" >>/home/vagrant/.zshrc
echo "alias ds=\"sudo devspace\"" >>/home/vagrant/.zshrc
echo "alias devspace=\"sudo devspace\"" >>/home/vagrant/.zshrc
echo "alias ac=\"sudo argocd\"" >>/home/vagrant/.zshrc
echo "alias argocd=\"sudo argocd\"" >>/home/vagrant/.zshrc
echo "alias dc=\"sudo docker\"" >>/home/vagrant/.zshrc
echo "alias docker=\"sudo docker\"" >>/home/vagrant/.zshrc

# argocd cli
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

# argocd dl
# sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# done in shared folder
# apply argocd resources into our k3d cluster in namespace argocd
# then override argocd-server config with insecure flag to disable tls
# finally apply ingress to redirect our inbound trafik from port 80 to service argocd-server
cd /vagrant_shared
sudo kubectl config set-context --current --namespace=argocd
sudo kubectl apply -f install.yml
sudo kubectl apply -f config_insecure.yml
sudo kubectl apply -f traefik_argo_ingress.yml

# lets go last part, using argocd
# sudo kubectl config set-context --current --namespace=dev

# argocd cluster add docker-desktop
