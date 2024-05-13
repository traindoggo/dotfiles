--
-- https://github.com/jose-elias-alvarez/null-ls.nvim
--
local status, none_ls = pcall(require, "null-ls")

if not status then
	print("can't load none_ls")
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

none_ls.setup({
	-- fromatting on save
	-- Sync Formatting(most reliable way): https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(cl)
							return cl.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,

	-- formatting
	sources = {
		-- util
		none_ls.builtins.code_actions.gitsigns,

		-- cpp
		none_ls.builtins.formatting.clang_format,

		-- golang
		none_ls.builtins.formatting.gofmt,
		none_ls.builtins.formatting.gofumpt,
		none_ls.builtins.formatting.goimports,

		-- json
		none_ls.builtins.formatting.prettier,

		-- lua
		none_ls.builtins.formatting.stylua,

		-- python
		none_ls.builtins.formatting.black,
		none_ls.builtins.formatting.isort,

		-- shell
		none_ls.builtins.formatting.shfmt,

		-- zsh
		none_ls.builtins.diagnostics.zsh,
	},
})
