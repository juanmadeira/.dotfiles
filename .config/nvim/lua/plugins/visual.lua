return {
    {
        "RedsXDD/neopywal.nvim",
        enabled = true,
        lazy = false,
        config = function()
            local colors = vim.fn.expand("~/.cache/wal/colors-wal.vim")
            require("neopywal").setup({
                transparent_background = true,
                colorscheme_file = vim.fn.filereadable(colors) == 1 and colors or nil,
                use_palette = vim.fn.filereadable(colors) == 0 and "tokyonight" or nil,
            })
        end
    },
    {
        "romgrk/barbar.nvim",
        enabled = true,
        lazy = false,
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
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
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("render-markdown").setup()
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
        event = "VeryLazy",
        config = function()
            require("image").setup({
                integrations = {
                    markdown = {
                        clear_in_insert_mode = true,
                        only_render_image_at_cursor = true,
                        resolve_image_path = function(document_path, image_path, fallback)
                            local cwd = vim.fn.getcwd()
                            local new_path = cwd .. "/" .. image_path
                            if vim.fn.filereadable(new_path) == 1 then
                                return new_path
                            else
                                return fallback(document_path, image_path)
                            end
                        end,
                    },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 35
            })
        end
    }
}
