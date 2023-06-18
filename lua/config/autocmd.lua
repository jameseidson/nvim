local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local g_fmt = augroup("FormatAutogroup", {})

autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "disable auto-commenting on newline",
})

return {
	fmt_on_save = function()
		autocmd("BufWritePost", {
			group = g_fmt,
			pattern = "*",
			command = "FormatWrite",
			desc = "automatically format on save",
		})
	end,
}
