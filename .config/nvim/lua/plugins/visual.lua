vim.pack.add({
    { src = "https://github.com/RedsXDD/neopywal.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/romgrk/barbar.nvim" },
        { src = "https://github.com/lewis6991/gitsigns.nvim" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/brenoprata10/nvim-highlight-colors" }
})

local colors = vim.fn.expand("~/.cache/wal/colors-wal.vim")
require("neopywal").setup({
    transparent_background = true,
    colorscheme_file = vim.fn.filereadable(colors) == 1 and colors or nil,
    use_palette = vim.fn.filereadable(colors) == 0 and "tokyonight" or nil,
})

require("lualine").setup({})
require("barbar").setup({})
require("render-markdown").setup({})
require("ibl").setup({})
require("nvim-highlight-colors").setup({})
