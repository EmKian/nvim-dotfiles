require("toggleterm").setup {
    open_mapping = [[<F12>]],
    hide_number = true,
    direction = 'horizontal',
    float_opts = {
        border = 'curved'
    }
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
