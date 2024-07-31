# .dotfiles do juan =)
>ヾ(•ω•`)o
<p align="center">
	<img src="https://github.com/juanmadeira/.dotfiles/blob/main/screenshots/hyprland-1.png" align="right" width="400px" alt="hyprland screenshot"
    <br>
	<img src="https://github.com/juanmadeira/.dotfiles/blob/main/screenshots/windows-1.png" align="right" width="400px" alt="windows screenshot" />
</p>
bem-vindo(a/e) ao meu repositório de .dotfiles! aqui manterei arquivos de configuração para os meus sistemas arch linux (hyprland) e windows 10.

#### packages (pacman)
|                 |                |
| --------------- | -------------- |
| wm              | hyprland       |
| terminal        | kitty          |
| shell           | bash           |
| prompt          | starship       |
| menu            | rofi           |
| barra de status | waybar         |
| editor de texto | neovim, vscode |
| música          | mpd, spotify   |
| vídeo           | mpv, vlc       |

---
## instalação
> [!CAUTION]
> isso irá sobrescrever suas atuais configurações!
```shell
git clone https://github.com/juanmadeira/.dotfiles
cd .dotfiles
cp -r .config/* ~/.config
cp -r .scripts ~/
cd ~
```

### yay
> [!IMPORTANT]
> é necessário o [yay](https://aur.archlinux.org/yay.git) para a instalação dos futuros pacotes.
```shell
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay; makepkg -si; cd ~
```

### linguagens
```shell
yay -S nodejs npm php apache mariadb python python-pip python-pipx;
pipx ensurepath;
```

### sddm
```shell
yay -S sddm qt6-5compat qt6-declarative qt6-svg;
sudo cp ~/.dotfiles/.etc/sddm /usr/share/sddm/themes/;
sudo cp ~/.dotfiles/.etc/sddm/sddm.conf /etc/;
```

### fontes e ícones
```shell
yay -S hack-nf-mono-git hack-nf-git; # kitty
yay -S noto-fonts-cjk noto-fonts-emoji noto-fonts; # caracteres japoneses
sudo cp ~/.dotfiles/fonts/* /usr/share/fonts/;
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete
    # sddm  -> OpenSans
``` 

### outros
```shell
yay -S waybar rofi-wayland dunst swww waypaper grub-customizer;
yay -S btop eza man unzip tar fzf starship github-cli lazygit;
yay -S neofetch onefetch cava cbonsai cmatrix-neo-git pipes.sh;
yay -S neovim mpv mpd hyprshot clipse;
yay -S firefox thunar spotify;
pipx install pycowsay;
```