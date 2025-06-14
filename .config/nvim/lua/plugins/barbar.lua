return {
    "romgrk/barbar.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require("barbar").setup()
    end
}
