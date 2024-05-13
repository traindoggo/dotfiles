-------------------------------------------------
-- rc/diagnostic.lua
-------------------------------------------------

-- local signs = { Error = "👺", Warn = "🤔", Hint = "💡", Info = "🤗" }
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Users can configure the handler
vim.diagnostic.config({
	["my/notify"] = {
		log_level = vim.log.levels.INFO,
		underline = true,
		virtual_text = { source = "always" },
		sings = { priority = 20 },
		float = { source = "always", border = "single" },
		update_in_insert = false,
		severity_sort = true,
	},
})
