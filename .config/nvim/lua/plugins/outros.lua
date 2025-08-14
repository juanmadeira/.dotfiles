return {
    {
        "folke/which-key.nvim",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end
    },
    {
        "akinsho/toggleterm.nvim",
        enabled = true,
        config = function()
            require("toggleterm").setup()
        end

    },
    {
        "andweeb/presence.nvim",
        enabled = true,
        config = function()
            require("presence").setup({
                enable_line_number = true
            })
        end
    }
}
