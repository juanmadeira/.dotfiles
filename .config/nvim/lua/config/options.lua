local options = {
    -- numeração
	number = true,
	numberwidth = 2,
    relativenumber = false,

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
    splitkeep = "screen",
    foldmethod = "expr",
	foldlevel = 99,
    foldexpr = "nvim_treesitter#foldexpr()",

    -- pesquisa
	hlsearch = false,
    ignorecase = true,
    smartcase = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
