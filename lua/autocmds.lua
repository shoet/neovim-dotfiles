-- vim.api.nvim_create_augroup -- Create/get autocommand group
-- Create autocommand
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "markdown", command = "setlocal tabstop=2 shiftwidth=2" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.json.golden", command = "set filetype=json" })
vim.api.nvim_create_autocmd(
	{ "FileType" },
	{ pattern = "*.sql", command = "setlocal tabstop=4 nonexpandtab shiftwidth=4" }
)
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "php", command = "setlocal tabstop=4 shiftwidth=4" })
