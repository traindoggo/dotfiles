-------------------------------------------------
-- rc/nvim-comment
-------------------------------------------------

local s1, nvim_comment = pcall(require, "nvim_comment")

if not s1 then
	print("nvim_comment is not loaded D:")
	return
end

nvim_comment.setup({
	line_mapping = "<leader>c",
	operator_mapping = "<C-i>",
	comment_chunk_text_object = "ic",
})
