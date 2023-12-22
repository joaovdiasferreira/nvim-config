local cmd = vim.cmd
local opt = vim.opt


-- mapleader key
vim.g.mapleader = ' '


cmd [[set number]]


opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true


vim.cmd[[colorscheme tokyonight]]
