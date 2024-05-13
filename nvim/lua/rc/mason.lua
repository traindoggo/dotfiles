-------------------------------------------------
-- rc/mason.lua
-------------------------------------------------
local s1, mason = pcall(require, "mason")
if not s1 then
	print("mason is not loaded D:")
	return
end

local s2, mason_lsp = pcall(require, "mason-lspconfig")
if not s2 then
	print("mason_lsp is not loaded D:")
	return
end

local s3, lspconfig = pcall(require, "lspconfig")
if not s3 then
	print("lspconfig is not loaded D:")
	return
end

-- completion
local s4, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not s4 then
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

-------------------------------------------------
-- mason setup
-------------------------------------------------
mason.setup()
mason_lsp.setup()

-- iterate all installed servers
-- https://github.com/williamboman/mason.nvim/discussions/74#discussioncomment-3151049
mason_lsp.setup_handlers({
	function(server_name)
		local lsp = server_name
		local opts = {}

		opts.on_attach = on_attach
		opts.capabilities = capabilities

		if lsp == "clangd" then
			local settings = require("rc.lsp-settings.clangd")
			opts = vim.tbl_deep_extend("force", opts, settings)
		elseif lsp == "pylsp" then
			local settings = require("rc.lsp-settings.pylsp")
			opts.settings = settings
		elseif lsp == "lua_ls" then
			opts.settings = require("rc.lsp-settings.lua_ls")
		elseif lsp == "tsserver" then
			table.insert(opts, { "single_file_support = true" })
		end

		lspconfig[lsp].setup(opts)
	end,
})
