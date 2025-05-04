return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "comment",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "php",
                "phpdoc",
                "python",
                "regex",
                "scss",
                "vim",
                "vue",
                "yaml"
            },
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}
