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
    end
}
