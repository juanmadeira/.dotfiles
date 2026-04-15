vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
})

require("mason").setup({})
require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = {
        "bashls",
        "cssls",
        "emmet_language_server",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "ts_ls"
    }
})
require("trouble").setup({})
