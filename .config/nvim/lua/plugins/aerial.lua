return {
    'stevearc/aerial.nvim',
    enabled = true,
    dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
    },
    config = function()
        vim.keymap.set("n", "<C-a>", "<cmd>AerialToggle!<CR>")
        require("aerial").setup({
            on_attach = function(bufnr)
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
            layout = {
                min_width = 25,
            }
        })
    end 
}
