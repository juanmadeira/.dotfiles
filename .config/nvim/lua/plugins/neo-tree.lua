return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local map = vim.api.nvim_set_keymap
        map("n", "<C-b>", ":Neotree toggle<CR>", {}) -- alterna neotree
        require("neo-tree").setup({
            window = {
                position = "left",
                width = 25,
            },
        })
    end
}
