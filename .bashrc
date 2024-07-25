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
alias root="cd /"
alias dots="cd ~/.dotfiles"
alias cfg="cd ~/.config"
alias media="cd /media"
alias games="cd /games"

alias c="clear"
alias cls="clear"
alias vi="nvim"
alias lg="lazygit"

alias update="sudo pacman -Syu"
alias orfaos="sudo pacman -Qqtd"
alias deleteOrfaos="sudo pacman -Qqtd | sudo pacman -Rns -"
alias cleanup="kitty --app-id dotfiles-floating ~/.dotfiles/scripts/limpeza.sh"

alias bsu="source ~/.bashrc"
alias music='tmux new-session -s $$ "tmux source-file ~/.ncmpcpp/tsession"'
_trap_exit() { tmux kill-session -t $$; }
