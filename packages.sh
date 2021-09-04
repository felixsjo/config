echo "Installing packages..."

sudo pacman -S --needed blueman libreoffice-still htop flameshot eog evolution deluge alacritty arc-gtk-theme arc-icon-theme base chromium evince feh gcc gimp git gpick i3-gaps i3blocks i3lock i3status lightdm lightdm-gtk-greeter lxappearance make man-db man-pages neofetch neovim network-manager-applet networkmanager noto-fonts noto-fonts-extra pandoc picom pulseaudio python-pip ranger rofi scrot sudo texinfo texlive-core thunar ttf-font-awesome vlc which xdg-user-dirs xdotool xorg xorg-xinit

mkdir -p ~/.local/builds
if [ -d ~/.local/builds/yay-git ]
then
  echo "yay already installed, do nothing"
else
  echo "installing yay..."
  cd ~/.local/builds
  git clone https://aur.archlinux.org/yay-git.git
  sudo chown -R $USER:$USER ./yay-git
  cd yay-git
  makepkg -si
  cd ~/
fi

echo "Installing yay packages..."
if pacman -Qs indicator-sound-switcher > /dev/null
then
  echo "indicator-sound-switcher already installed, do nothing"
else
  yay indicator-sound-switcher
fi
