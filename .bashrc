[[ $- != *i* ]] && return
# PS1='[\u@\h \W]\$ '
PS1="\n[\A \w]\n\$ "

export PATH="$HOME/.local/bin:$PATH"
