-------------------------------------------------
-- https://github.com/nvimtools/none-ls.nvim
-------------------------------------------------
local s, none_ls = pcall(require, "null-ls")
if not s then
	print("can't load none_ls")
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

--
-- https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save
--
none_ls.setup({
	-- formatting on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = false,
						filter = function(c)
							return c.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,

	-- settings
	sources = {
		none_ls.builtins.code_actions.gitsigns,
		none_ls.builtins.formatting.clang_format,
		none_ls.builtins.formatting.gofmt,
		none_ls.builtins.formatting.gofumpt,
		none_ls.builtins.formatting.goimports,
		none_ls.builtins.formatting.prettier,
		none_ls.builtins.formatting.stylua,
		none_ls.builtins.formatting.shfmt,
		none_ls.builtins.diagnostics.zsh,
	},
})
