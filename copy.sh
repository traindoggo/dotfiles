cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.bashrc .
cp ~/.zshrc .
cp ~/.config/alacritty/alacritty.toml .

mkdir nvim
cp ~/.config/nvim/init.lua ./nvim/
cp ~/.config/nvim/lua ./nvim/lua/ -r
cp ~/.config/nvim/snippets ./nvim/ -r
rm ./nvim/lua/.luarc.json
