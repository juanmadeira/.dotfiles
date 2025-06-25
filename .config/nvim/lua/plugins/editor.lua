return {
    {
        "numToStr/Comment.nvim",
        enabled = true,
        config = function()
            require("Comment").setup()
        end
    },
    {
        "m4xshen/autoclose.nvim",
        enabled = true,
        config = function()
            require("autoclose").setup({
                options = {
                    disabled_filetypes = {
                        "text",
                        "markdown"
                    }
                }
            })
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
