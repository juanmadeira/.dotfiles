return {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require("telescope").setup()
    end
}

