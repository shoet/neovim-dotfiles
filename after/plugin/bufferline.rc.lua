local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		separator_style = "thin",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		-- show_close_icon = true,
		color_icons = true,
	},
	highlights = {
		separator = {
			fg = "#073642",
			bg = "#073642",
		},
		separator_selected = {
			fg = "#fdf6e3",
			bg = "#fdf6e3",
		},
		background = {
			fg = "#fdf6e3",
			bg = "#073642",
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bg = "#657b83",
			bold = true,
			italic = true,
		},
		fill = {
			guibg = "#073642",
		},
	},
})

-- vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
-- vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>BufferLineCycleNext<CR>", {})
