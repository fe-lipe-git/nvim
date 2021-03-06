local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

whichkey.setup({
	window = { border = "single" },
})

local opts = { noremap = true, silent = true, mode = "n" } --, {noremap = true, silent = true , mode = "v"}}

local mappings = {
	["<leader>"] = {
		f = {
			name = "Files", -- Manage Files
			f = { "<cmd>Telescope find_files path_display={'truncate'}<CR>", "Find File" },
			o = { "<cmd>Telescope oldfiles path_display={'truncate'}<CR>", "Recent Files" },
			g = { "<cmd>Telescope live_grep path_display={'truncate'}<CR>", "Live Grep" },
		},
		b = {
			name = "Buffers", -- Manage Buffers
			l = { "<cmd>Telescope buffers path_display={'truncate'}<CR>", "Buffer List" },
			k = { "<cmd>bw<CR>", "Kill Buffer" },
		},
		j = {
			name = "Jupyter", -- Jupyter Notebook
			i = { ":MagmaInit<CR>", "Start Kernel" },
			l = { "<cmd>MagmaEvaluateLine<CR>", "Run Line" },
			d = { "<cmd>MagmaDelete<CR>", "Delete Cell" },
			r = { "<cmd>MagmaReevaluateCell<CR>", "ReRun Cell" },
			x = { "<cmd>MagmaInterrupt<CR>", "Interrupt Kernel" },
			z = { "<cmd>MagmaRestart<CR>", "Restart Kernel" },
			s = { "<cmd>MagmaSave<CR>", "Save" },
			q = { "<cmd>MagmaLoad<CR>", "Load" },
			o = { "<cmd>MagmaShowOutput<CR>", "Show Output" },
		},
		--m = { name = "Key Bindings",																										-- Key Bindings
		--r = { "<cmd>WhichKey \"<CR>", "\" Registers" },
		--v = { "<cmd>v<CR>", "Visual Mode" },
		--z = { "<cmd>z<CR>", "z" },
		--g = { "<cmd>g<CR>", "g" },
		--},
		h = {
			name = "Hop To", -- Hop Bindings
			w = { "<cmd>HopWord<CR>", "Word" },
			l = { "<cmd>HopLine<CR>", "Line" },
			c = { "<cmd>HopChar1<CR>", "Character" },
			k = { "<cmd>HopChar2<CR>", "Character w/ a bigram" },
		},
		w = { "<cmd>HopWord<CR>", "Hop to Word" }, -- Hop Bindings
		p = { "<cmd>HopChar1<CR>", "Hop to Character" }, -- Hop Bindings
		c = { "<cmd>HopChar2<CR>", "Hop to 2Character" }, -- Hop Bindings
		d = {
			name = "Definition", -- Definition Bindings
			d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
			i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
			c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close Windows" },
			r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Reference" },
		},
		t = {
			name = "Diagnostics", -- Diagnostics Bindings
			d = { ":Trouble document_diagnostics<cr>", "Document Diagnostics" },
			w = { ":Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
			c = { ":TroubleClose<cr>", "Close Diagnostics" },
		},
		g = {
			name = "GitSigns", -- Gitsigns Bindings
			h = { ":Gitsigns prev_hunk<cr>", "Prev Hunk" },
			p = { ":Gitsigns preview_hunk<cr>", "Preview Hunk" },
			b = { ":Gitsigns blame_line<cr>", "Blame Line" },
		},
		r = { "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", "Format" },
	},
}

whichkey.register(mappings, opts)

local opts = { noremap = true, silent = true, mode = "v" } --, {noremap = true, silent = true , mode = "v"}}

local mappings = {
	["<leader>"] = {
		j = {
			name = "Jupyter", -- Jupyter Notebook
			r = { ":<C-u>MagmaEvaluateVisual<CR>", "Run Selection" },
		},
	},
}

whichkey.register(mappings, opts)
