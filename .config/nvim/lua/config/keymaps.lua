local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    local defaultOpts = { noremap = true, silent = true }
    local finalOpts = vim.tbl_extend("force", defaultOpts, opts)
    vim.keymap.set(mode, lhs, rhs, finalOpts)
end

local M = {}

map("n", "<C-s>", '<cmd>write<cr>', { desc = "Save" })
map("n", "<A-z>", ":set wrap!<CR>", { desc = "Toggle wrap" })
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("x", ">", ">gv")
map("x", "<", "<gv")

map("n", "<leader>nn", function()
    if vim.wo.relativenumber then vim.wo.relativenumber = false vim.wo.number = true
	else vim.wo.relativenumber = true end
end)

--- neotree
map("n", "<C-b>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })

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

--- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble Buffer Diagnostics" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble Symbols" })

--- exportar as funções
return M
