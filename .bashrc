# ~/.bashrc

[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# path
export PATH="$HOME/.local/bin:$PATH"

# starship
eval "$(starship init bash)"

# aliases
alias ~="cd ~"
alias ..="cd .."
alias dots="cd ~/.dotfiles"

alias update="sudo pacman -Syu"
alias vi="nvim"
