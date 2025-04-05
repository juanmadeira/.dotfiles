# ~/.bashrc

[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# exports
eval "$(fzf --bash)"
eval "$(starship init bash)"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.scripts/src:$PATH"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
source "$HOME/.cache/wallust/colors"

# navegacao
alias c="clear"
alias cls="clear"
alias qt="exit"
alias ~="cd ~"
alias ..="cd .."
alias cfg="cd ~/.config"
alias dots="cd ~/.dotfiles"
alias doc="cd ~/Documents/"

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
alias pid="ps ax | grep "

# xhost
alias xhost="xhost si:localuser:root"
alias gparted="xhost; sudo gparted"
alias grub-customizer="xhost; sudo grub-customizer"
alias gnome-disks="xhost; sudo gnome-disks"

# python
alias v="source ~/.venv/venv/bin/activate" # ativar ambiente virtual python
alias lyrics="v; lyrics"
alias bandcamp-dl="v; bandcamp-dl"
alias spotdl="source ~/.venv/spotdl/bin/activate; spotdl"

# conf
alias .rc="nvim ~/.bashrc"
alias bsu="source ~/.bashrc"
alias hyprcfg="nvim ~/.config/hypr/hyprland.conf"
