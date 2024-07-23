-- configurações
local set = vim.opt
local cmd = vim.cmd
local o = vim.o
local map = vim.api.nvim_set_keymap

set.number = true
set.numberwidth = 2
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

-- mappings
vim.g.mapleader = " "

map("n", "<A-z>", ":set wrap!<CR>", {}) -- alterna quebra de linha
map("n", "<C-b>", ":Neotree toggle<CR>", {}) -- alterna neotree

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- temas
cmd[[colorscheme tokyonight]]
