local wk = require("which-key")
require("which-key").setup{
    plugins = {
        marks = true,
        registers = true,
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        }
    },
    window = {
        border = "single",
        margin = { 1, 0, 1, 0},
        padding = { 2, 2, 2, 2},
        position = "bottom",
    }
}


local opts = {
    buffer = nil,
    mode = "n",
    noremap = true,
    nowait = true,
    prefix = "<leader>",
    silent = true,
}

local mappings = {
    ["."] = {"<cmd>Telescope file_browser<CR>", "Find File"},
    [","] = {"<cmd>Telescope buffers<CR>", "Browse buffers"},
    f = {
        name = "File",
        f = {"<cmd>Telescope find_files<CR>", "Find File"},
        i = {"<cmd>Telescope live_grep<CR>", "Find string"},
        p = {"<cmd>Telescope projects<CR>", "Projects"};
        r = {"<cmd>Telescope oldfiles<CR>", "Recent Files"},
        s = {"<cmd>w<CR>", "Save file"},
    },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<CR>", "Compile" },
        i = { "<cmd>PackerInstall<CR>", "Install" },
        S = { "<cmd>PackerStatus<CR>", "Status" },
        s = { "<cmd>PackerSync<CR>", "Sync" },
        u = { "<cmd>PackerUpdate<CR>", "Update" },
    },
    s = {
        name = "Search",
        b = {"<cmd>Telescope buffers<CR>", "Browse buffers"},
        f = { "<cmd>Telescope find_files<CR>", "Find File" },
        h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
        i = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "String in file"},
        I = {"<cmd>Telescope live_grep<CR>", "Find string"},
        M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
        p = { "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>", "Colorscheme with Preview", },
        r = { "<cmd>Telescope registers<CR>", "Registers"},
    },
    o = {
        name = "Open",
        f = { "<cmd>NvimTreeFocus<CR>", "Focus on NvimTree"},
        p = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree"},
        t = { "<cmd>ToggleTerm<CR>", "Toggle Terminal"},
    },
    r = {
        name = "Reload",
        f = { "<cmd>edit!<CR>", "Reload current file"},
    },
    c = {
        name = "Code",
        a = {" <cmd>Lspsaga code_action<CR>", "Code Action"},
        D = { "<cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics"},
        j = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostic Jump Next"},
        k = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Diagnostic Jump Previous"},
        R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
        r = { "<cmd>Trouble lsp_references<CR>", "References"},
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Buffer Symbols"},
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
        v = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Display diagnostic on point"},
        t = {
            name = "Toggle",
            C = { "<cmd>TSContextToggle<CR>", "Toggle Code Context"},
            r = { "<cmd>lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>", "Toggle Inlay Hints(Rust)"},
        },
        f = {
            name = "Telescope Actions",
            D = { "<cmd> Telescope lsp_references<CR>", "List all references"},
            d = { "<cmd>Telescope lsp_definitions<CR>", "Go to definition"},
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Buffer Symbols"},
            S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
        }
    }
}
wk.register(mappings, opts)

