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
    }
}
