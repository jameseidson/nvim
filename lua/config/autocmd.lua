local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local g_fmt = augroup("LspFormatting", {})

autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "disable auto-commenting on newline",
})

return {
  fmt_on_save = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = g_fmt, buffer = bufnr })
      autocmd("BufWritePre", {
        group = g_fmt,
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ async = false }) end,
        desc = "automatically format on save",
      })
    end
  end,
}
