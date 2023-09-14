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

local M = {}

M.fmt_on_save = function()
	autocmd("BufWritePost", {
		group = g_fmt,
		command = "FormatWrite",
		desc = "format automatically on save",
	})
end

M.compile_latex_on_save = function()
	autocmd("BufWritePost", {
		command = "!pdflatex --shell-escape % &> /dev/null",
		-- command = "!xelatex % &> /dev/null",
		desc = "compile latex automatically on save",
	})
end

return M
