# install tools
## SUDO
change `my_user` to your username and `run as root` # su -
```
# Change my_user to your user
USER=my_user

apt update && apt install sudo
usermod -aG sudo $USER
echo "$(USER)  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$(USER)
```
## apt
```bash
sudo apt update && sudo apt install -y \
  wget \
  curl \
  net-tools \
  git \
  jq \
  unzip \
  silversearcher-ag \
  bash-completion \
  vim \
  telnet \
  binutils \
  ssh \
  openssh-server \
  openssh-client \
  netcat \
  nmap
```
## GIT
```bash
git config --global user.name "" # Your name
git config --global user.email "" # Your email
```
## terraform
```bash
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
export PATH=$PATH:$HOME/.tfenv/bin
echo 'export PATH=$PATH:$HOME/.tfenv/bin' >> .bashrc
tfenv install 1.7.4
tfenv use 1.7.4
terraform --version
```
## Bitwarden
```bash
cd ~
test -d bin || mkdir bin
cd bin
sudo apt update && sudo apt install wget curl -y
wget https://github.com/bitwarden/cli/releases/download/v1.22.1/bw-linux-1.22.1.zip
sudo apt update && sudo apt install unzip -y
unzip bw-linux-1.22.1.zip
rm bw-linux-1.22.1.zip
chmod +x bw
### make sure .bashrc contains export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> .bashrc
bw --help
```
### Example to get secret
You will need:
- `BW_CLIENTID` - client_id
- `BW_CLIENTSECRET` - client_secret  
You can find them in `bitwarden WEB` -> click on your `account icon` -> `account settings` -> `Security` -> `Keys`
```bash
export BW_CLIENTID="" # some_client_id
export BW_CLIENTSECRET="" # some_client_secret

bw login --apikey

bw unlock # Read the output and copy export commnd

# paste command from output
```
### Example:
```bash
# secret name = "terraform.tfvars [adguard]"
# .notes -> object data to get. can be username or password or you can check what is available with commnd
# to list all object data
bw list items | jq --raw-output '.[] | select(.name | contains("terraform.tfvars [adguard]"))'
# to get exac data .notes and write them in file.
printf "$(bw list items | jq --raw-output '.[] | select(.name | contains("terraform.tfvars [adguard]"))'.notes)" > terraform.tfvars
```

## Change hostname
```bash
HOSTNAME=my_hostnme
SEARCH_DOMAIN=example.local
sudo hostnamectl set-hostname $HOSTNAME
echo "127.0.0.1 $HOSTNAME ${HOSTNAME}.${SEARCH_DOMAIN}" | sudo tee -a /etc/hosts
```
## Netplan example
```yaml
network:
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: false
      addresses:
        - 192.168.0.2/24
      routes:
        - to: 0.0.0.0/0
          via: 192.168.0.1
      nameservers:
        addresses:
        - 8.8.8.8
        - 1.1.1.1
        search:
        - julik.local
```
## Disable ipv6
!!! WARNING 
!!! This may crush your bootloader

```bash
# CHECK if already disabled. no output shuld be displayed
cat /etc/default/grub | grep "ipv6.disable=1"

# Create backup of your GRUB
cp /etc/default/grub /etc/default/grub.BAK

# Generate new GRUB_CMDLINE_LINUX_DEFAULT
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 $(cat /etc/default/grub | grep -P ^GRUB_CMDLINE_LINUX_DEFAULT | cut -b 29-)"
# Check new GRUB_CMDLINE_LINUX_DEFAULT
echo $GRUB_CMDLINE_LINUX_DEFAULT

# Delete old GRUB_CMDLINE_LINUX_DEFAULT and write new to /etc/default/grub
cat /etc/default/grub | grep -v "^GRUB_CMDLINE_LINUX_DEFAULT" | sudo tee /etc/default/grub && echo "GRUB_CMDLINE_LINUX_DEFAULT=\"${GRUB_CMDLINE_LINUX_DEFAULT}" | sudo tee -a /etc/default/grub

# Update GRUB
sudo update-grub 

# REBOOT 
sudo systemctl reboot
```
## kubectl
`Latest version` OR `Specific version`
### Latest version
```bash
# Download the latest release with the command:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Download the kubectl checksum file:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
# Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# install as root
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# OR install only for current user
chmod +x kubectl
mkdir -p ~/bin
mv ./kubectl ~/bin/kubectl
# and then append (or prepend) ~/.local/bin to $PATH
export PATH=$HOME/bin:$PATH
echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc

```
### Specific version 
```bash
KUBECTL_VERSION="1.29.2"
# To download a specific version
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
# Download the specific kubectl checksum file:
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256"
# Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# install as root
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# OR install only for current user
chmod +x kubectl
mkdir -p ~/bin
mv ./kubectl ~/bin/kubectl
# and then append (or prepend) ~/.local/bin to $PATH
export PATH=$HOME/bin:$PATH
echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc
```

## ssh agent
```bash
sudo apt install keychain -y

```
To start agent
```bash
/usr/bin/keychain --nogui $HOME/.ssh/sshfile.key
source $HOME/.keychain/$HOSTNAME-sh

```
add this to your .bashrc

## ssh config
Disables host check and changes default user to ubuntu
```bash
mkdir ~/.ssh
echo 'Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  User ubuntu' | tee  ~/.ssh/config
```
if you want to exclud host:
```bash
Host !192.168.0.1 !192.168.0.2 *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  User ubuntu
```

# OLD 

## bash
copy bashrc content to your ~/.bashrc file
## tmux
copy tmux.conf to ~/.tmux.conf file (create if missing)
## vim
copy vimrc content to your ~/.vimrc file (create if missing)

## git config
copy content of gitconfig file to ~/.gitconfig
```bash
cat gitconfig >> ~/.gitconfig

```
## Default programms
copy packages.txt from github
run as root
```
xargs apt install -y < packages.txt

```