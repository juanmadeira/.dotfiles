return {
    "folke/trouble.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("trouble").setup()
    end
}
