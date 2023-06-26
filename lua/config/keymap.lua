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
		vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "find buffer by name" })
		vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "find help by tag" })
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

	get_local = function()
		local mapping = {
			["<Tab>"] = "move_selection_next",
			["<S-Tab>"] = "move_selection_previous",
			["<C-s>"] = "select_horizontal",
		}

		return {
			i = mapping,
			n = mapping,
		}
	end,
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

M.lspsaga = {
	set_global = function()
		vim.keymap.set("n", "<C-LeftMouse>", "<cmd>Lspsaga goto_definition<CR>", { desc = "goto definition" })
		vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "goto definition" })
		vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { desc = "view references" })
		vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "goto type definition" })
		vim.keymap.set("n", "<leader>vd", "<cmd>Lspsaga peek_definition<CR>", { desc = "view definition" })
		vim.keymap.set("n", "<leader>vD", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "view type definition" })

		vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "code action" })
		vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { desc = "rename symbol in file" })
		vim.keymap.set("n", "<leader>cR", "<cmd>Lspsaga rename ++project<CR>", { desc = "rename symbol in workspace" })

		vim.keymap.set("n", "[d", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, { desc = "jump to prev error" })
		vim.keymap.set("n", "]d", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, { desc = "jump to next error" })

		vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "toggle symbol outline" })
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "hover documentation" })
		-- vim.keymap.set("n", "<Leader>vi", "<cmd>Lspsaga incoming_calls<CR>", { desc = "view incoming calls" })
		-- vim.keymap.set("n", "<Leader>vo", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "view outgoing calls" })
		vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { desc = "toggle floating terminal" })
	end,

	get_local = function()
		return {
			finder = {
				jump_to = nil,
				tabe = nil,
				expand_or_jump = "<CR>",
				vsplit = "<C-v>",
				split = "<C-s>",
				tabnew = "<C-t>",
				quit = { "<ESC>", "<C-c>" },
				close_in_preview = { "<ESC>", "<C-c>" },
			},
			definition = {
				quit = { "q", "<ESC>" },
			},
			code_action = {
				quit = { "q", "<ESC>" },
			},
		}
	end,
}

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

M.undotree = {
	set_global = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "show undo tree" })
	end,
}

return M
