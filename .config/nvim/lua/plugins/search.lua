vim.pack.add({
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/MunifTanjim/nui.nvim" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/yorickpeterse/nvim-window" },
})

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true
        }
    },
    window = {
        position = "left",
        width = 25
    }
})
require("blink.cmp").setup({
    fuzzy = {
        implementation = "lua"
    }
})
require("which-key").setup({})
require("nvim-window").setup({})
