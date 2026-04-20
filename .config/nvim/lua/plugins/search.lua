vim.pack.add({
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/MunifTanjim/nui.nvim" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/stevearc/aerial.nvim" },
        { src = "https//github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/folke/flash.nvim" },
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
require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["d"] = require("telescope.actions").delete_buffer,
                ["q"] = require("telescope.actions").close
            }
        }
    }
})
require("aerial").setup({
    layout = {
        min_width = 25,
    },
    on_attach = function(bufnr)
        require("config.keymaps").on_attach(bufnr)
    end
})
require("flash").setup({
    modes = {
        char = {
            keys = { "t", "T", ";", "," },
        }
    }
})
require("which-key").setup({})
require("nvim-window").setup({})
