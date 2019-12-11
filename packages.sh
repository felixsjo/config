echo "Installing packages..."

pacman -S --needed blueman libreoffice-still htop flameshot eog evolution deluge alacritty arc-gtk-theme arc-icon-theme base chromium evince feh gcc gimp git gpick i3-gaps i3blocks i3lock i3status lightdm lightdm-gtk-greeter lxappearance make man-db man-pages neofetch neovim network-manager-applet networkmanager noto-fonts noto-fonts-extra pandoc picom pulseaudio python-pip ranger rofi scrot sudo texinfo texlive-core thunar ttf-font-awesome vlc which xdg-user-dirs xdotool xorg xorg-xinit

echo "Installing yay..."
if [ -e $(command -v yay) ]
then
  echo "yay already installed, do nothing"
else
  echo "installing yay..."
  git clone https://aur.archlinux.org/yay.git ~/
  cd ~/yay
  makepkg -si
  cd ~/
fi

echo "Installing yay packages..."
if [ -e $(command -v indicator-sound-switcher) ]
then
  echo "indicator-sound-switcher already installed, do nothing"
else
  yay indicator-sound-switcher
fi
