[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# exports
eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(batman --export-env)"
source "$HOME/.cache/wallust/colors"
export PATH="$HOME/.scripts:$PATH"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# navegação
alias c="clear"
alias qt="exit"
alias ~="cd ~"
alias ..="cd .."
alias cfg="cd ~/.config"
alias dots="cd ~/.dotfiles"
alias doc="cd ~/Documents"
alias notas="cd $NOTES_DIR; nvim index.md; cd -"

# cli
alias y="yazi"
alias v="nvim"
alias lg="lazygit"
alias of="onefetch"
alias ff="fastfetch"
alias ffd="fastfetch -c ~/.config/fastfetch/default.jsonc"
alias f="fastfetch -c ~/.config/fastfetch/config_tldr.jsonc"

alias ls="eza -a --icons"
alias ll="eza -al --icons"
alias lt="eza -a --tree --level=2 --icons"
alias lsblk="lsblk | bat -l conf"
alias pid="ps ax | grep "

# config
alias .rc="nvim ~/.bashrc"
alias bsu="source ~/.bashrc"
alias hyprcfg="cd ~/.config/hypr/; nvim hyprland.conf; cd -"
alias nvimcfg="cd ~/.config/nvim/; nvim init.lua; cd -"

# xhost
alias xhost="xhost si:localuser:root"
alias grub-customizer="xhost; sudo grub-customizer"
alias gparted="xhost; sudo gparted"
alias gnome-disks="xhost; sudo gnome-disks"

# python
alias venv="source ~/.venv/venv/bin/activate"
alias lyrics="venv; lyrics"
alias bandcamp-dl="venv; bandcamp-dl"
alias spotdl="source ~/.venv/spotdl/bin/activate; spotdl"
