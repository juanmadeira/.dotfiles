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

# ncmpcpp
alias music='tmux new-session -s $$ "tmux source-file ~/.config/ncmpcpp/tsession"'
_trap_exit() { tmux kill-session -t $$; }

# aliases
    # terminal
alias c="clear"
alias cls="clear"
alias qt="exit"

    # cd
alias ~="cd ~"
alias ..="cd .."
alias root="cd /"
alias dots="cd ~/.dotfiles"
alias cfg="cd ~/.config"
alias doc="cd /eva02/Documents/documentos"

    # cli
alias vi="nvim"
alias lg="lazygit"
alias y="yazi"
alias of="onefetch"
alias ff="fastfetch"
alias ffd="fastfetch -c ~/.config/fastfetch/default.jsonc"
alias f="fastfetch -c ~/.config/fastfetch/config_tldr.jsonc"
alias ls="eza -a --icons"
alias ll="eza -al --icons"
alias lt="eza -a --tree --level=2 --icons"
alias clock="tty-clock -C 6 -D -B -c -s"
alias xhost="xhost si:localuser:root"
alias figlet="printf '\e[1;96m'; figlet" # figlet sempre ciano
alias neo="neo -c cyan --colormode 16" # neomatrix sempre ciano
alias pycowsay="v; pycowsay"

    # conf
alias .rc="nvim ~/.bashrc"
alias hyprcfg="nvim ~/.config/hypr/hyprland.conf"

    # scripts
alias bsu="source ~/.bashrc"
alias v="source ~/.venv/bin/activate" # ativar ambiente virtual python3
alias limpeza="kitty ~/.scripts/limpeza.sh"
alias atualizar="kitty ~/.scripts/atualizar.sh"
alias ppd="~/.scripts/pacotes_por_data.sh"
alias retroarch="~/.scripts/retroarch.sh"
