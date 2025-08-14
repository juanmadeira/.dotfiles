return {
    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("tokyonight").setup({
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
        end
    },
    {
        "romgrk/barbar.nvim",
        enabled = true,
        lazy = false,
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        config = function()
            require("barbar").setup()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = true;
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight"
                }
            })
        end
    },
    {
        "OXY2DEV/markview.nvim",
        enabled = true,
        lazy = false,
        priority = 49,
        dependencies = { "saghen/blink.cmp", "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("markview").setup()
        end
    },
    {
        "brenoprata10/nvim-highlight-colors",
        enabled = true,
        config = function()
            require("nvim-highlight-colors").setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        config = function()
            require("ibl").setup()
        end
    },
    {
        "3rd/image.nvim",
        enabled = true,
        build = false,
        config = function()
            require("image").setup({
                integrations = {
                    markdown = {
                        only_render_image_at_cursor = true,
                    },
                    html = {
                        enabled = true,
                    },
                    css = {
                        enabled = true,
                    }
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 200
            })
        end
    }
}
