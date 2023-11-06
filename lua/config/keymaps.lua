-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set(
  "n",
  "]<Space>",
  ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>',
  { desc = "Insert space after current line", silent = true }
)

vim.keymap.set(
  "n",
  "[<Space>",
  ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>',
  { desc = "Insert space before current line", silent = true }
)
