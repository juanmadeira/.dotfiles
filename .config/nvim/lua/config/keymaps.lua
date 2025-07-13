local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    local defaultOpts = { noremap = true, silent = true }
    local finalOpts = vim.tbl_extend("force", defaultOpts, opts)
    vim.keymap.set(mode, lhs, rhs, finalOpts)
end

local M = {}

map("n", "<C-s>", '<cmd>w<CR>', { desc = "Save" })
map("n", "<C-A-s>", '<cmd>wqa!<CR>', { desc = "Save, close all buffers and force quit" })
map("n", "<A-z>", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })
map("x", "<", "<gv", { desc = "Left indent" })
map("x", ">", ">gv", { desc = "Right indent" })
map("i", "<leader>j", "<Esc>", { desc = "Escape" })
map("v", "c", '"_c', { desc = "Change without copying" })
map("n", "d", '"_d', { desc = "Delete without copying" })
map("n", "dd", '"_dd', { desc = "Delete line without copying" })

map("i", "<A-h>", "<Left>", { desc = "Move left in insert mode" })
map("i", "<A-j>", "<Down>", { desc = "Move down in insert mode" })
map("i", "<A-k>", "<Up>", { desc = "Move up in insert mode" })
map("i", "<A-l>", "<Right>", { desc = "Move right in insert mode" })

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move text to lower line" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move text to upper line" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text to lower line" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text to upper line" })

map("n", "<leader>nn", function()
    if vim.wo.relativenumber then vim.wo.relativenumber = false vim.wo.number = true
	else vim.wo.relativenumber = true end
end)

--- neotree
map("n", "<C-b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })

--- aerial
map("n", "<C-a>", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })
function M.on_attach(bufnr)
    map("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Previous Aerial" })
    map("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Next Aerial" })
end

--- barbar
map("n", "<Tab>", '<cmd>BufferNext<CR>', { desc = "Next Buffer" })
map("n", "<S-Tab>", '<cmd>BufferPrevious<CR>', { desc = "Previous Buffer" })
map("n", "<leader><Tab>", "<cmd>BufferClose<CR>", { desc = "Close Buffer" })
map("n", "<leader><S-Tab>", "<cmd>BufferRestore<CR>", { desc = "Restore Buffer" })

--- window-picker
map("n", "<leader><Space>", "<cmd>lua require('nvim-window').pick()<CR>", { desc = "Jump to window" })

--- which-key
map("n", "<leader>?", function() require("which-key").show({ global = false}) end, { desc = "Buffer Local Keymaps" })

--- telescope
local telescope = require('telescope.builtin')
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffer" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

--- flash
map({ "n", "x", "o" }, "s", "<cmd>lua require('flash').jump()<CR>", { desc = "Flash" })
map({ "n", "x", "o" }, "S", "<cmd>lua require('flash').treesitter()<CR>", { desc = "Flash Treesitter" })
map({ "x", "o" }, "R", "<cmd>lua require('flash').treesitter_search()<CR>", { desc = "Treesitter Search" })
map("o", "r", "<cmd>lua require('flash').remote()<CR>", { desc = "Remote Flash" })
map("c", "<A-s>", "<cmd>lua require('flash').toggle()<CR>", { desc = "Toggle Flash Search" })

--- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Trouble Buffer Diagnostics" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Trouble Symbols" })

--- exportar as funções
return M
