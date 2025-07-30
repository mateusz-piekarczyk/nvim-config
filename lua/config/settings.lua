vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
