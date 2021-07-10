#!/usr/bin/env bash

#---New rice 2021 Q4---
#Arch Linux
# https://youtu.be/pouX5VvX0_Q
# https://youtu.be/PQgyW10xD8s
# https://youtu.be/lA-LBWfJbNQ
# http://docs.qtile.org/en/latest/
# https://github.com/NoiSek/Aether
# # Alacritty with picom
# zsh
# zsh-autocomplete
# tmux
# https://youtu.be/OXKhv2rXLBo
# https://wiki.archlinux.org/title/Picom
# https://youtu.be/YZV7Xk3ZEis
# https://youtu.be/-Ky9YgvUa40
# https://archlinux.org/pacman/pacman.conf.5.html
# https://wiki.archlinux.org/title/Picom
# https://wiki.archlinux.org/title/AMDGPU
# https://wiki.archlinux.org/title/Dunst
# https://wiki.archlinux.org/title/WeeChat
# https://wiki.archlinux.org/title/MAC_address_spoofing

# Installing the regular repos packages
sudo pacman -S --noconfirm git vim nano neovim nvidia nvidia-dkms picom nitrogen xorg xterm qtile rofi alacritty sxiv ranger texlive-most texlive-lang pcmanfm polkit lxsession volumeicon network-manager-applet dunst lightdm lxappearance xclip dmenu cmatrix nerd-fonts neofetch bpytop redshift xcalib gimp krita digikam darktable discord lmms ardour xorg-xrandr xorg-xcalc xorg-xeyes xorg-xclock graphviz xorg-server-xephyr net-tools okular gwenview libreoffice zathura newsboat mpd ncmpcpp mpc bash fish zsh tmux bluez bluez-utils pulseaudio-bluetooth pavucontrol asciiquarium flac ffmpeg timeshift kdenlive telegram-desktop pidgin weechat mpv vlc mixxx audacity feh imagemagick xorg xdg-utils bash sed blueman xorg-xbacklight alsa-utils pulseaudio python-pywal redshift pulsemixer calcurse

# Installing the AUR repo packages
yay -S --noconfirm cbonsai optimus-manager optimus-manager-qt minecraft-launcher lightdm-webkit2-greeter lightdm-webkit-theme-aether cava

# Installing the Starship shell prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Installing the paru AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
