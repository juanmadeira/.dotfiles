# .dotfiles do juan =)
>ヾ(•ω•`)o
<p align="center">
	<img src="https://github.com/juanmadeira/.dotfiles/blob/main/screenshots/hyprland-fastfetch.png" align="right" width="400px" alt="hyprland screenshot"
</p>
<br>
bem-vindo(a/e) ao meu repositório de .dotfiles! aqui manterei arquivos de configuração para os meus sistemas arch linux (hyprland) e <a href="https://github.com/juanmadeira/.dotfiles/blob/main/_windows">windows 10</a>.

#### dependências
|                 |                      |
| --------------- | -------------------- |
| wm              | hyprland             |
| terminal        | kitty                |
| shell           | bash                 |
| prompt          | starship             |
| menu            | rofi                 |
| barra de status | waybar               |
| editor de texto | neovim, vscode       |
| música          | rhythmbox, spotify   |
| vídeo           | mpv, vlc             |

---
## Instalação
> [!CAUTION]
> Isso irá sobrescrever suas atuais configurações!
```shell
git clone https://github.com/juanmadeira/.dotfiles
cd .dotfiles
cp -r .config/* ~/.config
cp -r .scripts ~/
cd ~
```

### yay
> [!IMPORTANT]
> É necessário o [yay](https://aur.archlinux.org/yay.git) para a instalação dos futuros pacotes.
```shell
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay; makepkg -si; cd ~
```

### linguagens
```shell
yay -S nodejs npm php apache mariadb go python python-pip python-pipx;
pipx ensurepath;
```

### sddm
```shell
yay -S sddm qt6-5compat qt6-declarative qt6-svg;
sudo cp ~/.dotfiles/.etc/sddm /usr/share/sddm/themes/;
sudo cp ~/.dotfiles/.etc/sddm/sddm.conf /etc/;
```

### gtk
```shell
sudo cp -r ~/.dotfiles/.config/gtk-3.0/themes/* /usr/share/themes
sudo cp -r ~/.dotfiles/.config/gtk-3.0/icons/* /usr/share/icons
gsettings set org.gnome.desktop.interface gtk-theme Adapta-Nokto-Eta
gsettings set org.gnome.desktop.interface icon-theme Nordic-darker
```

### fontes
```shell
yay -S noto-fonts-cjk noto-fonts-emoji noto-fonts; # caracteres japoneses
sudo cp ~/.dotfiles/fonts/* /usr/share/fonts/;
    # geral -> FiraCode-..., HackNerdFontMono-... 
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete
    # sddm  -> OpenSans
``` 

### hyprland
```shell
yay -S waybar rofi-wayland dunst; # barra de notificacoes
yay -S wlogout hyprlock hypridle; # bloqueio de tela
yay -S wl-clipboard clipse; # area de transferencia
yay -S swww waypaper; # papel de parede
yay -S hyprshot; # captura de tela
yay -S gparted grub-customizer; # particionamento
```

### outros
> [!IMPORTANT]
> A partir daqui são programas de escolha mais pessoal e não tão relacionadas ao ricing. 
```shell
yay -S btop eza man tar gum fzf starship github-cli lazygit; # terminal
yay -S neofetch onefetch; # fetches
yay -S neovim nano visual-studio-code-bin # editores de texto
yay -S mpv mpd ffmpeg swappy rhythmbox spotify stremio; # reproducao de midia
yay -S firefox thunar p7zip-gui;
pipx install pycowsay;
```

### :)
```shell
yay -S cava cbonsai cmatrix-neo-git pipes.sh;
```
