# PATH
#export PATH="$PATH:/usr/local/bin"
export PATH=$PATH:$HOME/bin
export GIT_HOME=$HOME/git
export HISTFILESIZE=99999
export HISTSIZE=99999
export PROMPT_COMMAND='history -a'
export HISTCONTROL='ignoreboth:erasedups'
export HISTIGNORE='l:ll:ls:ps:history'
export CLICOLOR=1
export LSCOLOR=ExFxBxDxCxxegedabagacad
shopt -s histappend
shopt -s cmdhist


# PS edit
export PS1="\e[0;36mDEL \e[0;32m\w \e[0;36m\$ \e[m"

# SSH SSL/TLS keychain
/usr/local/bin/keychain --nogui $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh

# Custom aliases
## MAC
alias f='open -a Finder ./'
## vi
alias vi='vim'
## LS
alias l='ls -lahs'
alias ll='ls -lahs'
## CD
alias ..='cd ..'
alias ...='cd ../..'
alias tmp="cd $HOME/tmp"
## IPCONFIG
alias ip='ifconfig | grep inet'
## GIT
alias clone="git clone"
alias push="git push"
alias pull="git pull"
alias gco="git checkout"
alias gc="git pull && git add . && cimes"
function cimes () {
  echo "Enter commit message: "
  read commit_message
  git commit -m "${commit_message}"
}
## Kubernetes
source <(kubectl completion bash)
alias k="kubectl"
complete -F __start_kubectl k
## Terraform
alias tf='terraform'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfaa='teraform apply --auto-approve'
alias tfin='terraform init'
