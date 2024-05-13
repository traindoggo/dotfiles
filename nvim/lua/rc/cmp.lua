-------------------------------------------------
-- rc/cmp.lua
-------------------------------------------------
local s1, cmp = pcall(require, "cmp")
if not s1 then
	print("cmp is not loaded D:")
	return
end

-- nvim-snippy, cmp-snippy
local s2, snippy = pcall(require, "snippy")
if not s2 then
	print("snippy is not loaded D:")
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			snippy.expand_snippet(args.body)
		end,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "snippy" },
		{ name = "buffer" },
		{ name = "path" },
	}),

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),

	experimental = {
		ghost_text = true,
	},
})

snippy.setup({
	mappings = {
		is = {
			["<Tab>"] = "expand_or_advance",
			["<S-Tab>"] = "previous",
		},
		nx = {
			["<leader>x"] = "cut_text",
		},
	},
})
