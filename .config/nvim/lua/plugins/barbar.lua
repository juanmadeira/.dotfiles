return {
    "romgrk/barbar.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        map('n', '<Tab>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<S-Tab>', '<Cmd>BufferNext<CR>', opts)
        
        require("barbar").setup()
    end
}
