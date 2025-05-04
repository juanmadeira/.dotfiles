return {
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
            }
        })
    end 
}
