return {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
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
