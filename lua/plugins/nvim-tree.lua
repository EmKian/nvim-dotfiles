local g = vim.g 
local list = {
    { key = "C", action = "cd" },
    { key = "e", action = "edit"},
    { key = "l", action = "edit"},
}

require('nvim-tree').setup {
    open_on_setup = false,
    update_cwd = true,
    hijack_cursor = true,
    respect_buf_cwd = true,
    view = {
        width = 25,
        mappings = {
            custom_only = false,
            list = list
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        highlight_opened_files = "all",
        indent_markers = {
            enable = true,
        },
    },
}
