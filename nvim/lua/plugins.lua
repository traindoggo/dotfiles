------------------------------------------------
-- lua/plugins.lua
------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- require for lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- install packages
require("lazy").setup(
	{
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"lithammer/nvim-diagnosticls",
				"mason-org/mason-registry",
				"folke/neodev.nvim",
			},
		},

		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-buffer",
				"dcampos/cmp-snippy",
				"dcampos/nvim-snippy",
			},
			event = { "InsertEnter" },
		},

		"kyazdani42/nvim-web-devicons",
		{
			"windwp/nvim-ts-autotag",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("nvim-treesitter.configs").setup({
					autotag = { enable = true },
				})
			end,
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({
					disable_filetype = { "TelescopePrompt", "vim" },
				})
			end,
			event = "InsertEnter",
		},

		-- formatter
		"nvimtools/none-ls.nvim",

		-- status line
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		},

		-- finder
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-lua/plenary.nvim",
				"xiyaowong/telescope-emoji.nvim",
			},
			cmd = { " b", " e", " f", " g", " h" },
		},

		-- utils
		"terrortylor/nvim-comment",
		"pedro757/emmet",
		"lewis6991/gitsigns.nvim",
		{
			"ggandor/leap.nvim",
			dependencies = { "tpope/vim-repeat" },
			keys = { "s", "S" },
			config = function()
				local leap = require("leap")
				leap.set_default_keymaps()
			end,
		},
		{
			"preservim/vim-markdown",
			ft = { "markdown" },
		},

		-- treesitter
		"nvim-treesitter/nvim-treesitter",

		-- log
		"fei6409/log-highlight.nvim",

		-- colorscheme
		"kepano/flexoki",
		"stevedylandev/flexoki-nvim",
		"danilo-augusto/vim-afterglow",
		"Shatur/neovim-ayu",
		"sainnhe/edge",
		"rebelot/kanagawa.nvim",
		"cpea2506/one_monokai.nvim",
		"olimorris/onedarkpro.nvim",
		{
			"glepnir/zephyr-nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", opt = true },
		},
		"sainnhe/sonokai",
		"sainnhe/gruvbox-material",
		"lmburns/kimbox",
		"savq/melange",
	},

	-- lazy.opts
	{
		defaults = { lazy = true },
		preformance = {
			cache = { enabled = true },
		},
	}
)

-- LSP Sever management
require("rc.cmp")
require("rc.lspconfig")
require("rc.none_ls")
require("rc.diagnostic")
require("rc.treesitter")

require("rc.telescope")
require("rc.lualine")
require("rc.neodev")

require("rc.gitsigns")
require("rc.emmet_ls")
require("rc.log-highlight")
require("rc.nvim-comment")
require("rc.vim-markdown")
