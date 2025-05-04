return {
    "windwp/nvim-ts-autotag",
    enabled = true,
    config = function()
        require('nvim-ts-autotag').setup({
            opts = {
                enable_close = true, -- auto close tags
                enable_rename = true, -- auto rename pairs of tags
                enable_close_on_slash = false -- auto close on trailing </
            },
            -- also override individual filetype configs, these take priority.
            -- empty by default, useful if one of the "opts" global settings
            -- doesn't work well in a specific filetype
            per_filetype = {
                ["html"] = {
                    enable_close = true
                }
            }
        })
    end
}
