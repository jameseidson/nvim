return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_background = "hard"
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "kvrohit/rasmus.nvim" },
  { "p00f/alabaster.nvim" },
  { "sainttttt/flesh-and-blood" },
}
