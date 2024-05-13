-------------------------------------------------
-- clangd.lua
-------------------------------------------------

local M = {}

M = {
	cmd = {
		"clangd",
		"--background-index",
		"--pch-storage=memory",
		"--clang-tidy",
		"--completion-style=detailed",
		"--offset-encoding=utf-16",
	},

	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}

return M
