return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    options = {
      theme = "gruvbox",
      disabled_filetypes = { "NvimTree", "undotree", "diff", "lspsagaoutline"}
    },
  },
  config = true,
}
