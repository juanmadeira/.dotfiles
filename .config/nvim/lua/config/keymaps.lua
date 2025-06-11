local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--- básicos
map("n", "<C-s>", '<cmd>write<cr>', { desc = "Save" })
map("n", "<A-z>", ":set wrap!<CR>", { desc = "Toggle wrap" })
map("n", "<C-j>", ":m .+1<CR>==")
map("n", "<C-k>", ":m .-2<CR>==")
map("v", "<C-j>", ":m '>+1<CR>gv=gv")
map("v", "<C-k>", ":m '<-2<CR>gv=gv")

map("n", "<leader>nn", function()
    if vim.wo.relativenumber then vim.wo.relativenumber = false vim.wo.number = true
	else vim.wo.relativenumber = true end
end)

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

--- emmet
map({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)

--- telescope
local telescope = require('telescope.builtin')
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffer" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

--- flash
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map({ "x", "o" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
map("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
