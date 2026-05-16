return {
	"romgrk/barbar.nvim",
	event = "VeryLazy",
	version = "^1.9.1",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = { },
	keys = {
		{ "<leader>h", "<Cmd>BufferPrevious<CR>", noremap = true, silent = true, desc = "Left Buffer" },
		{ "<leader>l", "<Cmd>BufferNext<CR>", noremap = true, silent = true, desc = "Right Buffer" },

		{ "<leader>wh", "<Cmd>BufferMovePrevious<CR>", noremap = true, silent = true, desc = "Move Buffer Left" },
		{ "<leader>wl", "<Cmd>BufferMoveNext<CR>", noremap = true, silent = true, desc = "Move Buffer Right" },

		{
			"<leader>!q", function()
				vim.cmd("BufferClose!")
			end, noremap = true, silent = true, desc = "Close Buffer without Saving"
		},
		{
			"<leader>q", function()
				vim.cmd("write")
				vim.cmd("BufferClose")
			end, noremap = true, silent = true, desc = "Close and Save Buffer"
		},

		{ "<leader>P", "<Cmd>BufferPin<CR>", noremap = true, silent = true, desc = "Pin Buffer" },

	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
}

