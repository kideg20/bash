alias ll="ls -lahs --color=auto"
alias l='ls -lahF --color=auto'
alias tmuxa="tmux attach-session -t del"
alias tmuxc="tmux new-session -s del"
alias tmuxn="tmux new-session -s del"
alias tmuxl="tmux list-sessions"
alias clone="git clone"
alias push="git push"
alias pull="git pull"
#eval `ssh-agent`
## SSL
/usr/bin/keychain --nogui $HOME/.ssh/lahsd.key
source $HOME/.keychain/$HOSTNAME-sh
#alias sa="ssh-add ~/.ssh/lahsd.key"
alias tl="tmux list-sessions"
alias tn="tmux new-session -s del"
alias ta="tmux attach-session -t del"
alias gc="git add . && gca"
alias status="git status"
function gca () {
  git commit -m "$*"
}

source <(kubectl completion bash)
alias k="kubectl"
complete -F __start_kubectl k

export PATH=$PATH:$HOME/bin