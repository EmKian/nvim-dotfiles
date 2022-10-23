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
opt.laststatus = 2
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

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.tex"},
    callback = function ()
        vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", {})
        vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", {})
        vim.api.nvim_buf_set_keymap(0, "n", "$", "g$", {})
        vim.api.nvim_buf_set_keymap(0, "n", "_", "g_", {})
        vim.api.nvim_buf_set_keymap(0, "n", "0", "g0", {})
    end
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


