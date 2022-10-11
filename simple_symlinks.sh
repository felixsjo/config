#dependecies: vim tmux
echo "Creating symlinks:
~/.vimrc -> ~/config/.vimrc
~/.tmux.conf -> ~/config/.tmux.conf"
ln -s -f ~/config/.vimrc ~/.vimrc
ln -s -f ~/config/.tmux.conf ~/.tmux.conf
