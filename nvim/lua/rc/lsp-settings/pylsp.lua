-------------------------------------------------
-- rc/lsp-settings/pylsp
-------------------------------------------------

local M = {}

M = {
	pylsp = {
		plugins = {
			configurationSources = { "mypy" },
			pylint = {
				enabled = false,
				args = {
					"-dC0114", -- missing module string
					"-dC0115", -- missing class string
					"-dC0116", -- missing method/function string
					"-dE1131", -- unsupporeted binary operation
				},
				debounce = 200,
			},

			pycodestyle = {
				ignore = { "E501" },
				maxLineLength = 100,
			},

			flake8 = { enabled = false },
			mypy = { enables = true },
			pyflakes = { enabled = false }, -- this includes also flake8
			pylsp_mypy = { enabled = true },
			pylsp_black = { enabled = true },
			pylsp_isort = { enabled = true },
		},
	},
}

return M
