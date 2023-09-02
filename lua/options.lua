local globals = {
	mapleader = " ",
}

for k, v in pairs(globals) do
	vim.g[k] = v
end

local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = true,
	autoindent = true,
	smartindent = true,
	showcmd = true,
	cmdheight = 1,
	breakindent = true,
	hlsearch = true,
	clipboard = "unnamedplus",
	mouse = "a",
	shell = "zsh",
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	ignorecase = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
