return {
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
                automatic_enable = true,
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
    },
    {
        "neovim/nvim-lspconfig",
        enabled = true,
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "require" },
                        },
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            flake8 = {
                                args = { "--ignore=E501" }
                            }
                        }
                    }
                }
            })
        end
    },
    {
        "folke/trouble.nvim",
        enabled = true,
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("trouble").setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = true },
                modules = {},

                auto_install = true,
                sync_install = false,
                ignore_install = {},
                ensure_installed = {
                    "comment",
                    "css",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    -- "latex",
                    "typst",
                    "php",
                    "phpdoc",
                    "python",
                    "regex",
                    "scss",
                    -- "vim",
                    "vue",
                    "yaml"
                },
            })
        end
    }
}
