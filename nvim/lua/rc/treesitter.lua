-------------------------------------------------
-- rc/treesitter.lua
-------------------------------------------------

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",

	highlight = { enable = true },
	autopairs = { enable = true },
	autotag = { enable = true },
})
