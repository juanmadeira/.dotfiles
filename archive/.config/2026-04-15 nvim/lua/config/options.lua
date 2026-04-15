-- numeração
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true

-- identação
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true

-- visual
vim.opt.title = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- pesquisa
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
