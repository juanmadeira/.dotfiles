return {
    "folke/flash.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("flash").setup()
    end
}
