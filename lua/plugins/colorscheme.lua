return {
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_background = "hard"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
