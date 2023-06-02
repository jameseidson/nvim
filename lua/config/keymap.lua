vim.g.mapleader = " "

vim.keymap.set("v",          "K",          ":m '<-2<CR>gv=gv",                                     { desc = "move selection up"                    })
vim.keymap.set("v",          "J",          ":m '>+1<CR>gv=gv",                                     { desc = "move selection down"                  })
vim.keymap.set("n",          "J",          "mzJ`z",                                                { desc = "join lines"                           })
vim.keymap.set("x",          "<leader>p",  "\"_dP",                                                { desc = "put without overwiting buffer"        })
vim.keymap.set({ "n", "v" }, "<leader>p",  "\"_d",                                                 { desc = "put without overwiting buffer"        })
vim.keymap.set({ "n", "v"},  "<leader>y",  "\"+y",                                                 { desc = "yank selection into system clipboard" })
vim.keymap.set({ "n", "v"},  "<leader>Y",  "\"+Y",                                                 { desc = "yank line into system clipboard"      })
vim.keymap.set("n",          "<leader>d", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",  { desc = "replace word under cursor"            })

return {
  tree = function(tree)
    vim.keymap.set("n",          "<leader>e",   function() tree.toggle({ find_file = true }) end,    { desc = "open file explorer" })
  end,
  telescope = function(telescope)
    vim.keymap.set("n",          "<leader>ff",    telescope.find_files,                                { desc = "find file by name"             })
    vim.keymap.set("n",          "<leader>fc",    telescope.live_grep,                                 { desc = "find file by contents"         })
    vim.keymap.set("n",          "<leader>fb",    telescope.buffers,                                   { desc = "find buffer by name"           })
    vim.keymap.set("n",          "<leader>fh",    telescope.help_tags,                                 { desc = "find help by tag"              })
    vim.keymap.set("n",          "<leader>fd",    function() telescope.diagnostics({ bufnr = 0 }) end, { desc = "find diagnostic in file"       })
    vim.keymap.set("n",          "<leader>fD",    telescope.diagnostics,                               { desc = "find diagnostic in workspace"  })
  end,
  undotree = function()
    vim.keymap.set("n",          "<leader>u",     vim.cmd.UndotreeToggle,                              { desc = "show undo tree" })
  end,
  lsp = function(_, buf)
    -- vim.keymap.set("n",          "gd",            vim.lsp.buf.definition,                              { buffer = buf, remap = false, desc = "go to definition"         })
    vim.keymap.set("n",          "<C-LeftMouse>", vim.lsp.buf.definition,                              { buffer = buf, remap = false, desc = "go to definition"         })
    -- vim.keymap.set("n",          "gD",            vim.lsp.buf.declaration,                             { buffer = buf, remap = false, desc = "go to declaration"        })
    -- vim.keymap.set("n",          "K",             vim.lsp.buf.hover,                                   { buffer = buf, remap = false, desc = "hover declaration"        })
    -- vim.keymap.set("n",          "<leader>lr",    vim.lsp.buf.rename,                                  { buffer = buf, remap = false, desc = "rename symbol"            })
    -- vim.keymap.set({ "n", "v" }, "<leader>la",    vim.lsp.buf.code_action,                             { buffer = buf, remap = false, desc = "code action"              })
    vim.keymap.set("n",          "gr",            "<cmd>Telescope lsp_references<cr>",                 { buffer = buf, remap = false, desc = "list references"          })
    vim.keymap.set("n",          "<leader>fo",    "<cmd>Telescope lsp_document_symbols<cr>",           { buffer = buf, remap = false, desc = "find symbol in file"      })
    vim.keymap.set("n",          "<leader>fO",    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",  { buffer = buf, remap = false, desc = "find symbol in workspace" })
  end,
  lspsaga = function()
    -- LSP finder - Find the symbol's definition
    -- If there is no definition, it will instead be hidden
    -- When you use an action in finder like "open vsplit",
    -- you can use <C-t> to jump back
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

    -- Code action
    vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

    -- Rename all occurrences of the hovered word for the entire file
    vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")

    -- Rename all occurrences of the hovered word for the selected files
    vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

    -- Peek definition
    -- You can edit the file containing the definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

    -- Go to definition
    vim.keymap.set("n","gd", "<cmd>Lspsaga goto_definition<CR>")

    -- Peek type definition
    -- You can edit the file containing the type definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    -- vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

    -- Go to type definition
    -- vim.keymap.set("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


    -- Show line diagnostics
    -- You can pass argument ++unfocus to
    -- unfocus the show_line_diagnostics floating window
    -- vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

    -- Show buffer diagnostics
    -- vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

    -- Show workspace diagnostics
    -- vim.keymap.set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

    -- Show cursor diagnostics
    vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

    -- Diagnostic jump
    -- You can use <C-o> to jump back to your previous location
    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

    -- Diagnostic jump with filters such as only jumping to an error
    vim.keymap.set("n", "[E", function()
      require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    vim.keymap.set("n", "]E", function()
      require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)

    -- Toggle outline
    vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>")

    -- Hover Doc
    -- If there is no hover doc,
    -- there will be a notification stating that
    -- there is no information available.
    -- To disable it just use ":Lspsaga hover_doc ++quiet"
    -- Pressing the key twice will enter the hover window
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

    -- If you want to keep the hover window in the top right hand corner,
    -- you can pass the ++keep argument
    -- Note that if you use hover with ++keep, pressing this key again will
    -- close the hover window. If you want to jump to the hover window
    -- you should use the wincmd command "<C-w>w"
    -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

    -- Call hierarchy
    vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

    -- Floating terminal
    vim.keymap.set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
  end,
}
