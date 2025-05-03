return {
    "nvim-lualine/lualine.nvim",
    enabled = true;
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight"
            }
        })
    end
}
