local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local g_fmt = augroup("Format", {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "disable auto-commenting on newline",
})

-- vim.api.nvim_create_autocmd("CursorHold, CursorHoldI", {
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false })
-- 	end,
-- })

return {
	fmt_on_save = function()
		autocmd("BufWritePost", {
			group = g_fmt,
			command = "FormatWrite",
			desc = "format automatically on save",
		})
	end,
}
