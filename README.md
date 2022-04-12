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
To start agent
```
/usr/bin/keychain --nogui $HOME/.ssh/sshfile.key
source $HOME/.keychain/$HOSTNAME-sh

```
# git config
copy tontent of gitconfig file to ~/.gitconfig
```bash
cat gitconfig >> ~/.gitconfig

```
# Default programms
copy packages.txt from github
run as root
```
xargs apt install -y < packages.txt

```
# SUDO 
run as root
```
apt update && apt install sudo
u=<USER>
usermod -aG sudo del
echo "$(u)  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$(u)

```
# Disable ipv6 in ubuntu 20 LTS
```
# Disable ipv6 in ubuntu 20 LTS
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
cat /etc/default/grub | grep -v "^GRUB_CMDLINE_LINUX_DEFAULT" | sudo tee /etc/default/grub && echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"' | sudo tee -a /etc/default/grub
sudo update-grub && sudo reboot


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
