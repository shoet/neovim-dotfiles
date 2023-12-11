local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" }) -- Common utilities

	-- UI
	use({
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- style = "vulgaris",
				-- term_colors = true,
				-- optional configuration here
			})
			require("bamboo").load()
		end,
	})
	use({ "folke/tokyonight.nvim" })
	use({ "norcalli/nvim-colorizer.lua" }) -- Zen mode
	use({ "folke/zen-mode.nvim" }) -- Zen mode
	use({ "akinsho/toggleterm.nvim" }) -- Toogle item

	use({ "nvim-lualine/lualine.nvim" }) -- Statusline
	use({ "williamboman/nvim-lsp-installer" }) -- Statusline
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "kyazdani42/nvim-web-devicons" }) -- File icons
	use({ "akinsho/bufferline.nvim" })
	use({ "nvim-tree/nvim-tree.lua" })

	-- scrollbar
	use({ "petertriho/nvim-scrollbar" }) -- requirements: nvim-highlite, gitsigns
	use({ "kevinhwang91/nvim-hlslens" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "onsails/lspkind-nvim" }) --  vscode-like pictograms

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine

	-- LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" }) -- enable LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "glepnir/lspsaga.nvim" }) -- LSP UIs

	-- Formatter
	use({ "MunifTanjim/prettier.nvim" })
	use({ "tomtom/tcomment_vim" }) -- comment out

	-- Tag Format
	use({ "tpope/vim-surround" }) -- edit tag
	use({ "cohama/lexima.vim" }) -- auto close tag

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- Treesitter
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({ "windwp/nvim-ts-autotag" })

	-- git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "dinhhuy258/git.nvim" })

	-- other lauguage
	use({ "prisma/vim-prisma" })

	-- denops
	use({ "vim-denops/denops.vim" })

	-- diagnostics translate
	use({ "skanehira/denops-translate.vim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
