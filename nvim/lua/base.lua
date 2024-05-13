-------------------------------------------------
-- lua/base.lua
-------------------------------------------------

-- definitions
local win = vim.wo -- local to window
local buf = vim.bo -- local to buffer
local glo = vim.go -- global
local opt = vim.opt -- global-local ???
local keymap = vim.keymap

-- display
glo.encoding = "utf-8"
buf.fenc = "utf-8"
win.relativenumber = true
win.number = true
glo.scrolloff = 5
win.wrap = false
win.list = true
opt.listchars = "tab:»  "

-- move
glo.whichwrap = "b,s,h,l,<,>,[,],~"

-- search
glo.ignorecase = true
glo.smartcase = true
glo.hlsearch = true
glo.incsearch = true

-- editor
opt.virtualedit = "onemore"
glo.wildmode = "list:longest"
glo.completeopt = "longest,menuone"
glo.laststatus = 2
glo.autowrite = true
glo.autowriteall = true

-- win.breakindent = true
opt.autoindent = true
opt.smartindent = true
buf.shiftwidth = 2
buf.softtabstop = 2
buf.tabstop = 4
buf.expandtab = true

opt.clipboard:append({ "unnamedplus" })
glo.shortmess = "at" -- disable buffer message
opt.inccommand = "split"
keymap.set("n", "x", '"_x')

-- files
opt.autoread = true
glo.hidden = true
glo.backup = false
buf.swapfile = false
glo.writebackup = false

glo.undodir = vim.fn.expand("~/.config/nvim/undodir")
buf.undofile = true

glo.verbosefile = "/tmp/vim.log"
-- glo.verbose = 16

-- checkhealth
-- vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python3_host_prog = "~/.pyenv/shims/python3"

--[[
cursor
  normal: block
  insert: Beam
  hor: underscore
  when exit: underline
--]]
vim.cmd([[
  set guicursor=n:block,i:hor20
]])
