# ~/.bashrc

[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# path
#export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

# eval
eval "$(starship init bash)"
eval "$(fzf --bash)"

# navegacao
alias c="clear"
alias cls="clear"
alias qt="exit"
alias ~="cd ~"
alias ..="cd .."
alias cfg="cd ~/.config"
alias dots="cd ~/.dotfiles"
alias doc="cd ~/Documents/documentos"

# cli
alias y="yazi"
alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias of="onefetch"
alias ff="fastfetch"
alias ffd="fastfetch -c ~/.config/fastfetch/default.jsonc"
alias f="fastfetch -c ~/.config/fastfetch/config_tldr.jsonc"
alias ls="eza -a --icons"
alias ll="eza -al --icons"
alias lt="eza -a --tree --level=2 --icons"
alias clock="tty-clock -C 6 -D -B -c -s" # tty-clock sempre ciano
alias figlet="printf '\e[1;96m'; figlet" # figlet sempre ciano
alias neo="neo -c cyan --colormode 16" # neomatrix sempre ciano

# xhost
alias xhost="xhost si:localuser:root"
alias gparted="xhost; sudo gparted"
alias grub-customizer="xhost; sudo grub-customizer"

# python
alias v="source ~/.venv/bin/activate" # ativar ambiente virtual python
alias lyrics="v; lyrics"
alias spotdl="v; spotdl"

# conf
alias .rc="nvim ~/.bashrc"
alias bsu="source ~/.bashrc" # atualizar .bashrc
alias hyprcfg="nvim ~/.config/hypr/hyprland.conf"
