return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = true,
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true
                    }
                },
                window = {
                    position = "left",
                    width = 25
                }
            })
        end
    },
    {
        "yorickpeterse/nvim-window",
        enabled = true,
        config = function()
            require("nvim-window").setup({
                chars = {
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
                }
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        enabled = true,
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require("telescope").setup()
        end
    },
    {
        "stevearc/aerial.nvim",
        enabled = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                layout = {
                    min_width = 25,
                },
                on_attach = function(bufnr)
                    require("config.keymaps").on_attach(bufnr)
                end
            })
        end
    },
    {
        "folke/flash.nvim",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("flash").setup()
        end
    },
    {
        "saghen/blink.cmp",
        enabled = true,
        lazy = false,
        dependencies = { "rafamadriz/friendly-snippets" },
        version = '1.*',
        opts = {
            keymap = {
                preset = "default"
            },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = {
                documentation = {
                    auto_show = false
                }
            },
            sources = {
                default = {
                    "lsp", "path",
                    "snippets", "buffer"
                },
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning"
            }
        },
        opts_extend = {
            "sources.default"
        },
        config = function()
            require("blink.cmp").setup()
        end
    }
}
