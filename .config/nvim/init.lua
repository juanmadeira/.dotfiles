vim.g.mapleader = " "

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

vim.cmd("colorscheme tokyonight")
vim.cmd("hi BufferTabpageFill guibg=transparent")
vim.cmd("hi BufferCurrent guibg=transparent guifg=white")
vim.cmd("hi BufferInactive guibg=transparent guifg=gray")
vim.cmd("hi BufferVisible guibg=transparent guifg=gray")

require("config.options")
require("config.keymaps")
