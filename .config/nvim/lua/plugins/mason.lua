return { 
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            }) 
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "cssls",
                    "emmet_language_server",
                    "lua_ls",
                    "marksman",
                    "pylsp",
                    "rust_analyzer",
                    "ts_ls"
                }
            })
        end
    }
} 
