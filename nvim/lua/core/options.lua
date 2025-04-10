-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }

vim.cmd("set noswapfile")
vim.cmd("set nowritebackup")
vim.cmd("set nobackup")
vim.cmd("set shortmess+=c")

-- Font (GUI only)
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"

