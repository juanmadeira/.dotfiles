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
                    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
                }
            })
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        enabled = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        n = {
                            ["d"] = require("telescope.actions").delete_buffer,
                            ["q"] = require("telescope.actions").close
                        }
                    }
                }
            })
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
            require("flash").setup({
                modes = {
                    char = {
                        keys = { "t", "T", ";", "," },
                    }
                }
            })
        end
    },
    {
        "saghen/blink.cmp",
        enabled = true,
        lazy = false,
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("blink.cmp").setup({
                keymaps = {
                    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                    ["<C-e>"] = { "hide", "fallback" },
                    ["<CR>"] = { "accept", "fallback" },

                    ["<Tab>"] = { "snippet_forward", "fallback" },
                    ["<S-Tab>"] = { "snippet_backward", "fallback" },

                    ["<Up>"] = { "select_prev", "fallback" },
                    ["<Down>"] = { "select_next", "fallback" },
                    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

                    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

                    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
                },
                appearance = {
                    nerd_font_variant = "mono"
                },
                fuzzy = {
                    implementation = "lua"
                }

            })
        end
    }
}
