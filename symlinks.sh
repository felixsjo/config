#dependecies: i3, i3blocks, gtk2, gtk3, neovim
mkdir -p ~/.config/i3blocks
mkdir -p ~/.config/nvim
#ln -s -f ~/config/gtk-2.0 ~/.config/gtk-2.0
#ln -s -f ~/config/gtk-3.0 ~/.config/gtk-3.0
ln -s -f ~/config/i3/config ~/.config/i3/config
ln -s -f ~/config/i3blocks/config ~/.config/i3blocks/config
#ln -s -f ~/config/i3blocks-contrib ~/i3blocks-contrib
ln -s -f ~/config/nvim/init.vim ~/.config/nvim/init.vim
ln -s -f ~/config/.tmux.conf ~/.tmux.conf
