-- vim.api.nvim_create_augroup -- Create/get autocommand group
-- Create autocommand
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "markdown", command = "setlocal tabstop=2 shiftwidth=2" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.json.golden", command = "set filetype=json" })
