-- configurações
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = false 

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

-- visual
vim.cmd("colorscheme tokyonight")
vim.cmd("hi BufferTabpageFill guibg=transparent")
vim.cmd("hi BufferCurrent guibg=transparent guifg=white")
vim.cmd("hi BufferInactive guibg=transparent guifg=gray")
vim.cmd("hi BufferVisible guibg=transparent guifg=gray")

-- keymaps
local map = vim.keymap.set

map("n", "<C-s>", '<cmd>write<cr>', { desc = "Save" })
map("n", "<A-z>", ":set wrap!<CR>", { desc = "Toggle wrap" })

map("n", "<C-b>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })

map("n", "<C-a>", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })
on_attach = function(bufnr)
    map("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Previous Aerial" })
    map("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Next Aerial" })
end

map("n", "<Tab>", '<cmd>BufferNext<CR>', { desc = "Next Buffer" })
map("n", "<S-Tab>", '<cmd>BufferPrevious<CR>', { desc = "Previous Buffer" })
map("n", "<leader><Tab>", "<cmd>BufferClose<CR>", { desc = "Close Buffer" })
map("n", "<leader><S-Tab>", "<cmd>BufferRestore<CR>", { desc = "Restore Buffer" })

map("n", "<leader><Space>", "<cmd>lua require('nvim-window').pick()<CR>", { desc = "Jump to window" })

local telescope = require('telescope.builtin')
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffer" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
map("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
