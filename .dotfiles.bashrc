# mega clear
alias cls=' echo -ne "\033c"'

# unlimited history
export HISTSIZE=-1
export HISTFILESIZE=-1

# python virtualenvwrapper
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# the fuck
alias fuckyeah="fuck -y"

# last bordel
alias lastbordel="ls -alt ~/bordel | head -n 15"

# ctrl + arrow to navigate text
bind '"\e[1;5D" backward-word' 
bind '"\e[1;5C" forward-word'

alias tmux="TERM=xterm-256color tmux"

alias clipboard='xsel -ib'
