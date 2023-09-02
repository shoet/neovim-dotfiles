local status_tree, nvim_tree = pcall(require, "nvim-tree")
if not status_tree then
	return
end

local status_api, api = pcall(require, "nvim-tree.api")
if not status_api then
	return
end

local function my_on_attach(bufnr)
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)
end

nvim_tree.setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		-- mappings = {
		-- 	list = {
		-- 		{ key = "u", action = "dir_up" },
		-- 	},
		-- },
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = my_on_attach,
})

vim.keymap.set("n", "<leader>e", api.tree.toggle)
vim.keymap.set("n", "?", api.tree.toggle_help)
