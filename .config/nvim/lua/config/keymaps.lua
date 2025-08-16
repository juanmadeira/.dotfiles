local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    local defaultOpts = { noremap = true, silent = true }
    local finalOpts = vim.tbl_extend("force", defaultOpts, opts)
    vim.keymap.set(mode, lhs, rhs, finalOpts)
end

local M = {}

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<C-A-s>", "<cmd>wqa!<CR>", { desc = "Save, close all buffers and force quit" })

map("x", "<", "<gv", { desc = "Left indent" })
map("x", ">", ">gv", { desc = "Right indent" })
map("v", "c", '"_c', { desc = "Change without copying" })
map("n", "d", '"_d', { desc = "Delete without copying" })
map("n", "dd", "_dd", { desc = "Delete line without copying" })
map("n", "<A-z>", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })

map("i", "<C-h>", "<Left>", { desc = "Move left in insert mode" })
map("i", "<C-j>", "<Down>", { desc = "Move down in insert mode" })
map("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })
map("i", "<C-l>", "<Right>", { desc = "Move right in insert mode" })

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move text to lower line" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move text to upper line" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text to lower line" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text to upper line" })

map("n", "<S-h>", "<cmd>wincmd h<CR>", { desc = "Focus on left buffer" })
map("n", "<S-j>", "<cmd>wincmd j<CR>", { desc = "Focus on bottom buffer" })
map("n", "<S-k>", "<cmd>wincmd k<CR>", { desc = "Focus on top buffer" })
map("n", "<S-l>", "<cmd>wincmd l<CR>", { desc = "Focus on right buffer" })

map("n", "<leader>nn", function()
    if vim.wo.relativenumber then vim.wo.relativenumber = false vim.wo.number = true
    else vim.wo.relativenumber = true end
end, { desc = "Toggle between relative line numbers" })

-- delete file
map("n", "<leader>df", function()
    local filename = vim.fn.expand("%:p")
    if vim.fn.confirm("Delete:\n" .. filename .. "?", "&Yes\n&No", 2) == 1 then
        os.remove(filename)
        vim.cmd("bd!")
    end
end, { desc = "Delete current file" })

-- open file
map("n", "<leader>fo", function()
    local col = vim.fn.col(".") - 1
    local line = vim.fn.getline(".")
    local file

    local start = 0
    while true do
        local match = vim.fn.matchstrpos(line, "\\[[^]]*\\](\\([^)]*\\))", start)
        if match[2] == -1 then break end
        local s, e = match[2], match[3]
        if col >= s and col < e then file = match[1]:match("%((.-)%)") break end
        start = e
    end

    if not file then
        local start2 = 0
        while true do
            local match = vim.fn.matchstrpos(line, "\\[\\[[^]]*\\]\\]", start2)
            if match[2] == -1 then break end
            local s, e = match[2], match[3]
            if col >= s and col < e then file = match[1]:match("%[%[(.-)%]%]") break end
            start2 = e
        end
    end

    if not file or file == "" then file = vim.fn.expand("<cfile>") end
    file = file:gsub("^%s+", ""):gsub("%s+$", "")
    file = file:gsub("%%20", " ")

    -- local base_dir = vim.fn.getcwd() -- caminho relativo ao cwd
    local base_dir = vim.fn.expand("%:p:h") -- caminho relativo ao buffer
    local full_path = vim.fn.resolve(base_dir .. "/" .. file)

    if file:match("%.md$") then
        vim.cmd("edit " .. vim.fn.fnameescape(full_path))
    else
        vim.fn.jobstart({ "xdg-open", full_path }, { detach = true })
    end
end, { desc = "Open file (Markdown, PDF, image etc.) under cursor" })

--- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help tags" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Telescope help keymaps" })
map("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>", { desc = "Telescope buffer" })

--- flash
map({ "n", "x", "o" }, "f", "<cmd>lua require('flash').jump()<CR>", { desc = "Flash" })
map({ "n", "x", "o" }, "F", "<cmd>lua require('flash').treesitter()<CR>", { desc = "Flash Treesitter" })
map({ "x", "o" }, "R", "<cmd>lua require('flash').treesitter_search()<CR>", { desc = "Treesitter Search" })
map("o", "r", "<cmd>lua require('flash').remote()<CR>", { desc = "Remote Flash" })
map("c", "<A-s>", "<cmd>lua require('flash').toggle()<CR>", { desc = "Toggle Flash Search" })

--- marksman
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition (markdown)" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation (markdown)" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP: Find References (markdown)" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol (markdown)" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action (markdown)" })

--- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Trouble Buffer Diagnostics" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Trouble Symbols" })

--- barbar
map("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Previous Buffer" })
map("n", "<leader><Tab>", "<cmd>BufferClose<CR>", { desc = "Close Buffer" })
map("n", "<leader><S-Tab>", "<cmd>BufferRestore<CR>", { desc = "Restore Buffer" })

--- aerial
map("n", "<C-a>", "<cmd>AerialToggle!<CR><cmd>wincmd l<CR>", { desc = "Toggle Aerial" })
function M.on_attach(bufnr)
    map("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Previous Aerial" })
    map("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Next Aerial" })
end

--- neotree
map("n", "<C-b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })

--- window-picker
map("n", "<leader><Space>", "<cmd>lua require('nvim-window').pick()<CR>", { desc = "Jump to window" })

--- which-key
map("n", "<leader>?", function() require("which-key").show({ global = false }) end, { desc = "Buffer Local Keymaps" })

--- toggleterm
map("n", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

--- exportar as funções
return M
