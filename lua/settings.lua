-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local opt = vim.opt


-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.showmatch = true
opt.linebreak = true
opt.number = true
opt.relativenumber = true
opt.pumheight = 12
-----------------------------------------------------------
-- Neovim Tab and related behaviour
-----------------------------------------------------------
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.timeoutlen = 300

g.mapleader = " "
opt.mouse = 'a'
-----------------------------------------------------------
-- Neovim QOL
-----------------------------------------------------------
vim.api.nvim_create_autocmd({"VimResized"}, {command = "wincmd ="})
opt.undofile = true
opt.clipboard = unnamedplus

local termInit = vim.api.nvim_create_augroup( "Term-Init", { clear = true })
vim.api.nvim_create_autocmd({"TermOpen"}, {
    group = termInit,
    command = "startinsert",
})
vim.api.nvim_create_autocmd({"TermOpen"}, {
    group = termInit,
    command = "setlocal nonumber",
})
vim.api.nvim_create_autocmd({"TermOpen"}, {
    group = termInit,
    command = "setlocal norelativenumber",
})
-----------------------------------------------------------
-- Neovim Misc
-----------------------------------------------------------
o.updatetime = 250
o.incsearch = true
o.splitbelow = true
o.splitright = true
o.signcolumn = "number"
-----------------------------------------------------------
-- Neovim colorscheme
-----------------------------------------------------------
o.termguicolors = true
g.gruvbox_flat_style = "dark"
g.gruvbox_material_show_eob = 0

cmd[[colorscheme kanagawa]]


