local cmd = vim.cmd
cmd [[packadd packer.nvim]]
return require("packer").startup({ function(use)

    ---------------------
    -- Package Manager --
    ---------------------

    use "wbthomason/packer.nvim"

    -----------------------
    -- Essential Plugins -- ---------------------

    use "nvim-lua/plenary.nvim"

    ---------------------------------
    -- Assorted graphical niceties --
    ---------------------------------

    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require('nvim-web-devicons').setup()
        end,
    }

    use "rebelot/kanagawa.nvim"

    use "folke/which-key.nvim"

    use {
        "winston0410/range-highlight.nvim",
        requires = "winston0410/cmd-parser.nvim",
        config = function()
            require("range-highlight").setup()
        end,
    }

    --------------------------------------
    -- File Navigation and Fuzzy Search --
    --------------------------------------

    use {
        "kyazdani42/nvim-tree.lua",
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use "nvim-telescope/telescope-file-browser.nvim"

    use {
        "ggandor/leap.nvim",
        config = function()
            require("leap").set_default_keymaps()
        end,
    }

    -----------------------------------
    -- LSP, Completions and Snippets --
    -----------------------------------

    use "williamboman/mason-lspconfig.nvim"
    use "williamboman/mason.nvim"
    use "neovim/nvim-lspconfig"

    use "glepnir/lspsaga.nvim"
    use "onsails/lspkind-nvim"
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                auto_close = true,
            }
        end
    }
    use {
        "kosayoda/nvim-lightbulb",
        config = function()
            require 'nvim-lightbulb'.update_lightbulb()

        end
    }

    use {
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = 'nvim-cmp' },
        { "hrsh7th/cmp-buffer", after = 'nvim-cmp' },
        { "hrsh7th/cmp-path", after = 'nvim-cmp' },
        { "hrsh7th/cmp-nvim-lua", after = 'nvim-cmp' },
        { "hrsh7th/cmp-cmdline", after = 'nvim-cmp' },
        { "L3MON4D3/LuaSnip", after = 'nvim-cmp' },
        { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
    }

    use {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }

    use "mfussenegger/nvim-dap"
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use "hkupty/iron.nvim"
    --------------------------
    -- Treesitter & Plugins --
    --------------------------

    use {
        { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
        { "windwp/nvim-ts-autotag", after = 'nvim-treesitter' },
        { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
        { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
        { "lewis6991/nvim-treesitter-context", after = 'nvim-treesitter' },
        { "nvim-treesitter/nvim-treesitter-textobjects", after = 'nvim-treesitter' },
    }

    -- use {
    --     "lewis6991/spellsitter.nvim",
    --     config = function()
    --         require('spellsitter').setup {
    --             enable = true,
    --         }
    --     end
    -- }

    use "andymass/vim-matchup"

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end,
    }

    ---------------------
    -- Editing Goodies --
    ---------------------

    use {
        "numTostr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    use {
        "kylechui/nvim-surround",
        config = function ()
            require("nvim-surround").setup();
        end

    }
    use "tpope/vim-repeat"
    use "matze/vim-move"

    -------------------
    -- QOL Enhancing --
    -------------------

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
    }

    use {
        "jghauser/mkdir.nvim",
        config = function()
            require("mkdir")
        end
    }

    use {
        "ahmedkhalf/project.nvim",
        config = function ()
            require("project_nvim").setup {
                manual_mode = false,
                show_hidden = true,
                silent_chdir = true,
            }
        end
    }

    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    }

    use {
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup {}
        end,
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
            }
        end,
    }

    use "fladson/vim-kitty"

    ----------
    -- Misc --
    ----------
    use {
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup {
                navigation = {
                    enable_default_keybindings = true,
                },
                copy_sync = {
                    enable = false,
                },
                resize = {
                    enable_default_keybindings = false,
                },
            }
        end
    }
    use "lewis6991/impatient.nvim"

    use "lervag/vimtex"
end,
config = {
    max_jobs = 10,
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    },
    profile = {
        enable = false,
    }
} }
)
