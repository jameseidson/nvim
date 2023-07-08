vim.g.mapleader = " "

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "join lines" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "put without overwiting buffer" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "delete without overwiting buffer" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "yank selection into system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "yank line into system clipboard" })
vim.keymap.set(
	"n",
	"<leader>r",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "replace word under cursor" }
)

local M = {}

M.tree = {
	set_global = function(tree)
		vim.keymap.set("n", "<leader>e", function()
			tree.toggle({ find_file = true })
		end, { desc = "open file explorer" })
	end,

	get_local = nil,
}

M.telescope = {
	set_global = function(telescope)
		vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "find file by name" })
		vim.keymap.set("n", "<leader>fc", telescope.live_grep, { desc = "find file by contents" })
		vim.keymap.set("n", "<leader>fv", telescope.grep_string, { desc = "find visual selection" })
		vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "find help by tag" })
		vim.keymap.set("n", "<leader>fj", telescope.jumplist, { desc = "find in jumplist" })
		vim.keymap.set("n", "<leader>fm", telescope.marks, { desc = "find mark" })

		vim.keymap.set("n", "<leader>b", telescope.buffers, { desc = "find buffer by name" })

		vim.keymap.set("n", "<leader>gb", telescope.git_branches, { desc = "show git branches" })
		vim.keymap.set("n", "<leader>gc", telescope.git_bcommits, { desc = "show git commits to buffer" })

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "find definitions" })
				vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "find references" })
				vim.keymap.set("n", "<leader>fd", function()
					telescope.diagnostics({ bufnr = 0 })
				end, { desc = "find diagnostic in file" })
				vim.keymap.set("n", "<leader>fD", telescope.diagnostics, { desc = "find diagnostic in workspace" })
				vim.keymap.set(
					"n",
					"<leader>fs",
					"<cmd>Telescope lsp_document_symbols<cr>",
					{ remap = false, desc = "find symbol in file" }
				)
				vim.keymap.set(
					"n",
					"<leader>fS",
					"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
					{ remap = false, desc = "find symbol in workspace" }
				)
			end,
		})
	end,

	get_local = nil,
}

M.cmp = {
	set_global = nil,

	get_local = function(cmp)
		return {
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

			["<Tab>"] = cmp.mapping.select_next_item(),
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
		}
	end,
}

M.lsp = {
	set_global = function(buf)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "hover docs" })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = buf, desc = "signature help" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
			vim.diagnostic.open_float(nil, { focus = false })
		end, { desc = "goto next diagnostic" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
			vim.diagnostic.open_float(nil, { focus = false })
		end, { desc = "goto previous diagnostic" })

		vim.keymap.set(
			"n",
			"<leader>wa",
			vim.lsp.buf.add_workspace_folder,
			{ buffer = buf, desc = "add folder to workspace" }
		)
		vim.keymap.set(
			"n",
			"<leader>wr",
			vim.lsp.buf.remove_workspace_folder,
			{ buffer = buf, desc = "remove folder from workspace" }
		)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = buf, desc = "list folders in workspace" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "rename" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "code action" })
	end,
}

M.harpoon = {}

M.gitsigns = {
	set_global = function(gitsigns, _)
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gitsigns.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "jump to next git hunk" })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gitsigns.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "jump to previous git hunk" })

		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git stage hunk" })
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git reset hunk" })
		vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git stage file" })
		vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "git unstage hunk" })
		vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git reset buffer" })
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git preview hunk" })
		vim.keymap.set("n", "<leader>hb", gitsigns.toggle_current_line_blame, { desc = "git toggle blame lines" })
		vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "git show hunk diff" })
		vim.keymap.set("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, { desc = "git show buffer diff" })
		vim.keymap.set("n", "<leader>hx", gitsigns.toggle_deleted, { desc = "git toggle deleted lines" })
	end,

	get_local = nil,
}

M.aerial = {
	set_global = function()
		vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle! right<cr>", { desc = "toggle symbol outline" })
	end,
	set_local = function(buf)
		vim.keymap.set("n", "<Tab>", "<cmd>AerialNext<cr>", { buffer = buf, desc = "toggle symbol outline" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>AerialPrev<cr>", { buffer = buf, desc = "toggle symbol outline" })
	end,
}

M.undotree = {
	set_global = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "show undo tree" })
	end,
}

return M
