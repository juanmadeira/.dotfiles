-- configurações
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.wrap = false
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
local opts = { noremap = true, silent = true }

    --- básicos
map("n", "<C-s>", '<cmd>write<cr>', { desc = "Save" })
map("n", "<A-z>", ":set wrap!<CR>", { desc = "Toggle wrap" })
    
    --- Neotree
map("n", "<C-b>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })

    --- Aerial
map("n", "<C-a>", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })
on_attach = function(bufnr)
    map("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Previous Aerial" })
    map("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Next Aerial" })
end

    --- barbar
map("n", "<Tab>", '<cmd>BufferNext<CR>', opts, { desc = "Next Buffer" })
map("n", "<S-Tab>", '<cmd>BufferPrevious<CR>', opts, { desc = "Previous Buffer" })
map("n", "<leader><Tab>", "<cmd>BufferClose<CR>", opts, { desc = "Close Buffer" })
map("n", "<leader><S-Tab>", "<cmd>BufferRestore<CR>", opts, { desc = "Restore Buffer" })

    --- window-picker
map("n", "<leader><Space>", "<cmd>lua require('nvim-window').pick()<CR>", { desc = "Jump to window" })

    --- telescope
local telescope = require('telescope.builtin')
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffer" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

    --- flash
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
map("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

    --- move
map('n', '<A-j>', ':MoveLine(1)<CR>', opts)
map('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
map('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
map('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
map('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
map('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)
map('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
map('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
map('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
map('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
