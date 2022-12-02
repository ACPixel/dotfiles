local pixel_plugins = {
    ["wbthomason/packer.nvim"] = {},

    -- Dracula theme
    ["dracula/vim"] = {
        config = function()
            vim.cmd [[colorscheme dracula]]
        end
    },

    -- Optimiser
    ["lewis6991/impatient.nvim"] = {},

    -- Github Copilot
    ["zbirenbaum/copilot.lua"] = {
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup({
                    suggestion = {
                        auto_trigger = true,
                        keymap = {
                            accept = "<C-j>",
                            dismiss = "<C-]>"
                        }
                    }
                })
            end, 100)
        end
    },

    -- Lua functions
    ["nvim-lua/plenary.nvim"] = {
        module = "plenary"
    },

    -- Indent detection
    ["Darazaki/indent-o-matic"] = {
        event = "BufEnter"
    },

    -- Notification Enhancer
    ["rcarriga/nvim-notify"] = {
        config = function()
            local notify = require('notify')
            notify.setup({
                stages = "slide",
                timeout = 5000
            })
            vim.notify = notify
        end
    },

    -- NeoTree
    ["nvim-neo-tree/neo-tree.nvim"] = {
        branch = "v2.x",
        requires = {"kyazdani42/nvim-web-devicons", "kyazdani42/nvim-tree.lua", "MunifTanjim/nui.nvim"},
        config = function()
            require("configs.neo-tree")
        end
    },

    -- LuaLine
    ["hoob3rt/lualine.nvim"] = {
        requires = {"kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim"},
        config = function()
            require("configs.lualine")
        end
    },

    -- bufferline
    ["akinsho/bufferline.nvim"] = {
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("configs.bufferline")
        end
    },

    -- Telescope ( with fzf )
    ["nvim-telescope/telescope.nvim"] = {
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = 'make'
        }},
        config = function()
            require("configs.telescope")
        end
    },

    -- Treesitter
    ["nvim-treesitter/nvim-treesitter"] = {
        run = ":TSUpdate",
        config = function()
            require("configs.treesitter")
        end
    },

    -- lspkind
    ["onsails/lspkind-nvim"] = {},

    ["VonHeikemen/lsp-zero.nvim"] = {
        'VonHeikemen/lsp-zero.nvim',
        config = function()
            require("configs.lsp-zero")
        end,
        requires = { -- LSP Support
        {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            config = function()
                require("configs.cmp")
            end
        }, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'}, -- Snippets
        {
            'jackieaskins/cmp-emmet',
            run = 'npm run release'
        }, {'L3MON4D3/LuaSnip'}}
    },

    -- Ale
    ["dense-analysis/ale"] = {
        config = function()
            require("configs.ale")
        end
    },

    -- Git integration
    ["lewis6991/gitsigns.nvim"] = {
        event = "BufEnter",
        config = function()
            require "configs.gitsigns"
        end
    },

    -- Start screen
    ["goolord/alpha-nvim"] = {
        config = function()
            require "configs.alpha"
        end
    },

    -- Session manager
    ["Shatur/neovim-session-manager"] = {
        module = "session_manager",
        cmd = "SessionManager",
        event = "BufWritePost",
        config = function()
            require "configs.session_manager"
        end
    },

    -- Octo

    ['pwntester/octo.nvim'] = {
        requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'kyazdani42/nvim-web-devicons'},
        config = function()
            require"octo".setup()
        end
    },

    -- Trouble
    ["folke/trouble.nvim"] = {
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("configs.trouble")
        end
    },

    -- Wilder
    ["gelguy/wilder.nvim"] = {
        config = function()
            require("configs.wilder")
        end
    },

    -- Comment context
    ["JoosepAlviste/nvim-ts-context-commentstring"] = {},

    -- Comment
    ["numToStr/Comment.nvim"] = {
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
            })
        end
    },

    -- Window Picker
    ["s1n7ax/nvim-window-picker"] = {
        config = function()
            require("configs.window-picker")
        end
    },

    -- Parenthesis highlighting
    ["p00f/nvim-ts-rainbow"] = {
        after = "nvim-treesitter"
    },

    -- Autopairs
    ["windwp/nvim-autopairs"] = {
        after = "nvim-cmp"
    },

    -- Smarter splits
    ["mrjones2014/smart-splits.nvim"] = {
        config = function()
            require "configs.smart-splits"
        end
    },

    -- Color highlighting
    ["NvChad/nvim-colorizer.lua"] = {
        event = "BufEnter",
        config = function()
            require "configs.colorizer"
        end
    },

    -- Indentation
    ["lukas-reineke/indent-blankline.nvim"] = {
        event = "BufEnter",
        config = function()
            require "configs.indent-line"
        end
    },

    -- MarkDown preview
    ["iamcco/markdown-preview.nvim"] = {
        run = "cd app && yarn install",
        ft = "markdown"
    }

}

local status_ok, packer = pcall(require, "packer")
if status_ok then
    packer.startup {
        function(use)
            for key, plugin in pairs(pixel_plugins) do
                if type(key) == "string" and not plugin[1] then
                    plugin[1] = key
                end
                use(plugin)
            end
        end,
        config = {
            compile_path = pixelvim.default_compile_path,
            display = {
                open_fn = function()
                    return require("packer.util").float {
                        border = "rounded"
                    }
                end
            },
            profile = {
                enable = true,
                threshold = 0.0001
            },
            git = {
                clone_timeout = 300,
                subcommands = {
                    update = "pull --rebase"
                }
            },
            auto_clean = true,
            compile_on_sync = true
        }
    }
end
