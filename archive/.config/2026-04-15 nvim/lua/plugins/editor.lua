return {
    {
        "numToStr/Comment.nvim",
        enabled = true,
        config = function()
            require("Comment").setup()
        end
    },
    {
        "echasnovski/mini.surround",
        enabled = true,
        config = function()
            require("mini.surround").setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        enabled = true,
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        "windwp/nvim-ts-autotag",
        enabled = true,
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true, -- auto close tags
                    enable_rename = true, -- auto rename pairs of tags
                    enable_close_on_slash = false -- auto close on trailing </
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true
                    }
                }
            })
        end
    }
}
