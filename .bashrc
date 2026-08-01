[[ $- != *i* ]] && return
PS1="\n\A \w\n\$ "

export PATH="$HOME/.local/bin:$PATH"

alias ..="cd .."
alias qt="exit"
alias ll="ls -al --color=auto"

alias dots="cd ~/.dotfiles"
alias notas="cd $NOTES_DIR; nvim index.md; cd -"
alias mangocfg="cd ~/.config/mango/; nvim config.conf; cd -"
alias nvimcfg="cd ~/.config/nvim/; nvim init.lua; cd -"
