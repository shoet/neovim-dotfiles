local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",

		mappings = {
			n = {
				["q"] = actions.close,
			},
		},

		-- live_grep = {
		--
		-- },

		-- vimgrep_arguments = {
		--
		-- },

		file_ignore_patterns = { ".idea" },
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

vim.keymap.set("n", "<C-f><C-s>", function()
	builtin.find_files({
		hidden = true,
	})
end)
-- Grep
vim.keymap.set("n", "<C-f><C-g>", function()
	builtin.live_grep()
end)
-- Resume
-- vim.keymap.set("n", "<C-f><C-r>", function()
-- 	builtin.resume()
-- end)
-- Buffer
vim.keymap.set("n", "<C-f><C-b>", function()
	builtin.buffers()
end)
-- Oldfiled
vim.keymap.set("n", "<C-f><C-r>", function()
	builtin.oldfiles()
end)
-- File Browser
vim.keymap.set("n", "<C-f><C-f>", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
	-- vim.keymap.set("n", "<C-f><C-t>", function()
	-- 	builtin.help_tags()
	-- end)
	-- vim.keymap.set("n", "<C-f><C-e>", function()
	-- 	builtin.diagnostics()
	-- end)
	-- vim.keymap.set("n", "df", function()
end)
