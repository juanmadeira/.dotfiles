return {
    "yorickpeterse/nvim-window",
    enabled = true,
    config = function()
        require("nvim-window").setup({
            chars = {
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
            }
        })
    end
}
