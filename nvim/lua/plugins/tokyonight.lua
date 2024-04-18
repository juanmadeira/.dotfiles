return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 998,
    opts = {},
    config = function()
        require("tokyonight").setup ({
            transparent = true,
            styles = {
               sidebars = "transparent",
               floats = "transparent",
            },
        })
    end        
}
