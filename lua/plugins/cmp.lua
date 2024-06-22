return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    -- I have no idea why, but if this line isn't here, pressing <Tab> does not select the next completion item until
    -- the second time insert mode is entered in a buffer.
    local _ = require("luasnip")

    opts.mapping = {
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.config.disable,
        c = cmp.config.disable,
      }),

      ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i" }),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i" }),
    }

    opts.preselect = cmp.PreselectMode.None

    opts.completion.completeopt = "noselect"

    opts.sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 500 },
      { name = "buffer", priority = 100 },
    })

    cmp.config.compare.locality.lines_count = 300
    opts.sorting = {
      comparators = {
        cmp.config.compare.locality,
        cmp.config.compare.recently_used,
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
      },
    }
  end,
}
