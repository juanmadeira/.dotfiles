return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {"lua", "javascript", "html"},
            highlight = {enable = true},
            indent = {enable = true},
        })
    end
}
