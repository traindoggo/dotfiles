-------------------------------------------------
-- lua/keybinding.lua
-------------------------------------------------

-- base
vim.g.maplearder = " "
vim.g.maplocalleader = " "

Imap("jk", "<ESC>")
Nmap("<Leader>w", ":w<CR>")
Nmap("<Leader>q", ":q<CR>")
Nmap("<ESC><ESC>", ":nohl<CR>")
Nmap("H", "^")
Nmap("L", "$")
