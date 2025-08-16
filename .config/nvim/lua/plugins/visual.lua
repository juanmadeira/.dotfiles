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
            require("lualine").setup({
                options = {
                    theme = "tokyonight"
                }
            })
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
                            local cwd = vim.fn.getcwd() -- Caminho relativo ao cwd do Neovim
                            local new_path = cwd .. "/" .. image_path
                            if vim.fn.filereadable(new_path) == 1 then
                                return new_path
                            else
                                return fallback(document_path, image_path)
                            end
                        end,
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
                max_height_window_percentage = 35
            })
        end
    }
}
