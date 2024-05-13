-------------------------------------------------
-- rc/telescope.lua
-------------------------------------------------

-- Nmap("<leader>f", '<cmd>lua require("telescope.builtin").find_files()<CR>')
Nmap("<leader>f", ":Telescope file_browser<CR>")
Nmap("<leader>e", ":Telescope emoji<CR>")
Nmap("<leader>b", '<cmd>lua require("telescope.builtin").buffers()<CR>')
Nmap("<leader>g", "<cmd>Telescope live_grep find_command=rg<CR>")
Nmap("<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<CR>')

local status, telescope = pcall(require, "telescope")
if not status then
	print("Not Found: telescope")
	return
end

telescope.setup({
	defaults = {
		mapping = {
			n = {
				["q"] = require("telescope.actions").close,
			},
		},
		winblend = 15,
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			mappings = {},
		},
		emoji = {
			action = function(emoji)
				vim.fn.setreg("*", emoji.value)
				print([[print P or "*p to paste this emoji"]] .. emoji.value)
				vim.api.nvim_put({ emoji.value }, "c", false, true)
			end,
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("emoji")
