-------------------------------------------------
-- rc/lspconfig.lua
-------------------------------------------------
local s1, lspconfig = pcall(require, "lspconfig")
if not s1 then
	print("lspconfig is not loaded D:")
	return
end

local s2, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not s2 then
	print("cmp_nvim_lsp is not loaded D:")
	return
end

local on_attach = function(client, bufnr)
	local bufopts = { silent = true, buffer = bufnr }

	Nmap_with_buf("K", vim.lsp.buf.hover, bufopts)
	Nmap_with_buf("gf", vim.lsp.buf.format, bufopts)
	--nmap("gD", vim.lsp.buf.declaration, bufopts)
	Nmap_with_buf("gr", vim.lsp.buf.references, bufopts)
	Nmap_with_buf("gd", vim.lsp.buf.definition, bufopts)
	Nmap_with_buf("gi", vim.lsp.buf.implementation, bufopts)
	Nmap_with_buf("gt", vim.lsp.buf.type_definition, bufopts)
	Nmap_with_buf("gn", vim.lsp.buf.rename, bufopts)
	Nmap_with_buf("ga", vim.lsp.buf.code_action, bufopts)
	Nmap_with_buf("ge", vim.diagnostic.open_float, bufopts)
	Nmap_with_buf("g]", vim.diagnostic.goto_next, bufopts)
	Nmap_with_buf("g[", vim.diagnostic.goto_prev, bufopts)

	client.server_capabilities.document_formatting = false
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	single_file_support = true,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = require("rc.lsp-settings.lua_ls"),
})

lspconfig.pylsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = require("rc.lsp-settings.pylsp"),
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = require("rc.lsp-settings.clangd"),
})

lspconfig.ruff_lsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = { group = "module" },
				prefix = "self",
			},
			cargo = {
				buildScripts = { enable = true },
			},
			procMacro = { enable = true },
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),

	callback = function(ev)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.rs", "*.py" },
			callback = function()
				vim.lsp.buf.format({
					buffer = ev.buf,
					filter = function(f_client)
						return f_client.name ~= "null-ls"
					end,
					async = false,
				})
			end,
		})
	end,
})
