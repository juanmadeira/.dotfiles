# ~/.bashrc

[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# path
export PATH="$HOME/.local/bin:$PATH"

# starship
eval "$(starship init bash)"

# fzf
eval "$(fzf --bash)"

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
alias qt="exit"
alias vi="nvim"
alias lg="lazygit"
alias ls="eza -la --icons"
alias figlet="printf '\e[1;96m'; figlet" # figlet sempre ciano

alias .rc="nvim ~/.bashrc"
alias hyprcfg="nvim ~/.config/hypr/hyprland.conf"

alias bsu="source ~/.bashrc"
alias limpeza="kitty --app-id dotfiles-floating ~/.scripts/limpeza.sh"
alias update="kitty --app-id dotfiles-floating ~/.scripts/update.sh"
