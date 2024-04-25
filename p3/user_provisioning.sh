echo "I am the user provisionning script"

sudo apt install -y git zsh

echo "alias k=\"sudo kubectl\"" >>/home/vagrant/.zshrc
echo "alias kubectl=\"sudo kubectl\"" >>/home/vagrant/.zshrc
echo "alias k3d=\"sudo k3d\"" >>/home/vagrant/.zshrc


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo chsh -s $(which zsh)

echo "who am i really? $(whoami)"

# sudo -

# k3d cluster create argocd
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

