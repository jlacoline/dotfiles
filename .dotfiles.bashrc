# mega clear
alias cls=' echo -ne "\033c"'

# unlimited history
export HISTSIZE=-1
export HISTFILESIZE=-1

# python virtualenvwrapper
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# the fuck
alias f="fuck"
alias fy="fuck -y"

# last bordel
alias lastbordel="ls -alt ~/bordel | head -n 15"

# ctrl + arrow to navigate text
bind '"\e[1;5D" backward-word' 
bind '"\e[1;5C" forward-word'

alias tmux="TERM=xterm-256color tmux"

alias clipboard='xsel -ib'

# ps1
export GIT_PS1_SHOWDIRTYSTATE="yep"
source ~/.git-prompt.sh
PS1='\[\e[;33m\]\w\[\e[;36m\]$(__git_ps1 " (%s)")\[\e[m\] \$ '

# kubectl aliases
alias kall="kubectl api-resources --namespaced=true -o name | xargs -i kubectl get {} -o name"
alias kapp="kubectl apply -f"
alias kdel="kubectl delete -f"
alias ksys="kubectl -n kube-system"

kshow() {
    kubectl get  "$1" "$2" -o yaml | vim -c "set ft=yaml" -c "g/^  managedFields:/;/^  name/-1d" -c "noh" -
}
