-- configurações
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.expandtab = true
vim.opttabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- mappings
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
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

-- cores
vim.cmd("colorscheme tokyonight")
vim.cmd("hi BufferTabpageFill guibg=transparent")
vim.cmd("hi BufferCurrent guibg=transparent guifg=white")
vim.cmd("hi BufferInactive guibg=transparent guifg=gray")
vim.cmd("hi BufferVisible guibg=transparent guifg=gray")
