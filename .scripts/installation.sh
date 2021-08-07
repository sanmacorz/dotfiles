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
sudo pacman -S --noconfirm --needed - < regular-packages.txt

# Installing the AUR repo packages
yay -S --noconfirm --needed - < aur-packages.txt

# Installing the Starship shell prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Installing the paru AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
