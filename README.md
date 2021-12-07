# bash
copy bashrc content to your ~/.bashrc file
# tmux
copy tmux.conf to ~/.tmux.conf file (create if missing)
# vim
copy vimrc content to your ~/.vimrc file (create if missing)
# ssh agent
```bash
apt install keychain
```
# git config
copy tontent of gitconfig file to ~/.gitconfig
```bash
cat gitconfig >> ~/.gitconfig
```
# Default programms
```
su - 
apt update && apt upgrade
apt install sudo
exit
sudo apt install -y wget curl net-tools git vim
```
# Install kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
verify `kubectl version --client`
