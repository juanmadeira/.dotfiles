[[ $- != *i* ]] && return
PS1="\n\A \w\n\$ "

export PATH="$HOME/.local/bin:$PATH"

alias ..="cd .."
alias qt="exit"
alias ll="ls -al --color=auto"
