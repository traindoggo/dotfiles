-------------------------------------------------
-- rc/lsp-settings/sumneko_lua.lua
-------------------------------------------------

local M = {}

local runtime_path = vim.split(package.path, ";")

-- supress `vim` global warning
M = {
	Lua = {
		runtime = {
			version = "LuaJIT",
			path = runtime_path,
		},
		diagnostics = {
			globals = { "vim" },
		},
	},
}

return M
