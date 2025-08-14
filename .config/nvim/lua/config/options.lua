local options = {
    -- numeração
	number = true,
	numberwidth = 2,
    relativenumber = true,

    -- identação
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
    wrap = false,
	linebreak = true,
	breakindent = true,
	expandtab = true,
    smarttab = true,
    cindent = true,

    -- visual
    title = true,
    splitright = true,
    splitkeep = "screen",
    foldmethod = "expr",
	foldlevel = 99,
    foldexpr = "nvim_treesitter#foldexpr()",

    -- pesquisa
    clipboard = "unnamedplus",
	hlsearch = false,
    ignorecase = true,
    smartcase = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
