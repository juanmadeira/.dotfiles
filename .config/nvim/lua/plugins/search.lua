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
        dependencies = { "rafamadriz/friendly-snippets" },
        version = '1.*',
        config = function()
            require("blink.cmp").setup({
                keymap = {
                    preset = "default"
                },
                appearance = {
                    nerd_font_variant = "mono"
                },
                completion = {
                    menu = {
                        draw = {
                            components = {
                                kind_icon = {
                                    text = function(ctx)
                                        -- default kind icon
                                        local icon = ctx.kind_icon
                                        -- if LSP source, check for color derived from documentation
                                        if ctx.item.source_name == "LSP" then
                                            local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                                            if color_item and color_item.abbr ~= "" then
                                                icon = color_item.abbr
                                            end
                                        end
                                        return icon .. ctx.icon_gap
                                    end,
                                    highlight = function(ctx)
                                        -- default highlight group
                                        local highlight = "BlinkCmpKind" .. ctx.kind
                                        -- if LSP source, check for color derived from documentation
                                        if ctx.item.source_name == "LSP" then
                                            local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                                            if color_item and color_item.abbr_hl_group then
                                                highlight = color_item.abbr_hl_group
                                            end
                                        end
                                        return highlight
                                    end,
                                },
                            },
                        },
                    },
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
            })
        end
    }
}
