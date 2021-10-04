# Aliases
## ls cd 
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lahs'
alias ..="cd .."
alias ...="cd ../.."
## TMUX
alias tmuxa="tmux attach-session -t del"
alias tmuxc="tmux new-session -s del"
alias tmuxn="tmux new-session -s del"
alias tmuxl="tmux list-sessions"
alias tl="tmux list-sessions"
alias tn="tmux new-session -s del"
alias ta="tmux attach-session -t del"
## SSH SSL/TLS keychain
/usr/bin/keychain --nogui $HOME/.ssh/{first.key,second.key}
source $HOME/.keychain/$HOSTNAME-sh
## GIT
alias got="git "
alias clone="git clone"
alias push="git push"
alias pull="git pull"
alias gb="git branch"
alias gs="git status"
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
export PATH=$PATH:$HOME/bin
