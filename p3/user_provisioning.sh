echo "I am the user provisionning script"

echo "alias k=\"sudo kubectl\"" >>/home/vagrant/.bashrc
echo "alias kubectl=\"sudo kubectl\"" >>/home/vagrant/.bashrc
echo "alias k3d=\"sudo k3d\"" >>/home/vagrant/.bashrc

source /home/vagrant/.bashrc

echo "who am i really? $(whoami)"

sudo -i

k3d cluster create argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
