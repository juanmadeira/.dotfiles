-- configurações

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = " "

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
local plugins = {
    {"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}},
    {"nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = {"nvim-lua/plenary.nvim"}},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"numToStr/Comment.nvim", lazy= false, opts = {}}
}

local opts = {}
require("lazy").setup(plugins, opts)

-- plugin: Comment
require("Comment").setup()

-- plugin: treesitter
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "javascript"},
    highlight = {enable = true},
    indent = {enable = true}
})

-- plugin: telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- plugin/theme: tokyonight
require("tokyonight").setup {
    transparent = true,
    styles = {
       sidebars = "transparent",
       floats = "transparent",
    }
}
vim.cmd.colorscheme "tokyonight"
