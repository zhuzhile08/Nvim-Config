return {
	"rmagatti/auto-session",
	lazy = false,
	lazy_support = true,
	dependencies = {
		"nvim-neo-tree/neo-tree.nvim",
	},
	keys = {
		{ "<leader>pf", "<cmd>SessionSearch<cr>", desc = "Session search" },
		{ "<leader>ps", "<cmd>SessionSave<cr>", desc = "Save session" },
		{ "<leader>pa", "<cmd>SessionToggleAutoSave<cr>", desc = "Toggle session autosave" },
	},
	opts = {
		suppressed_dirs = { "~/", "~/Programming", "~/Programming/C++", "~/Downloads", "/" },
		auto_restore_session = true,
		auto_restore_last_session = true,
		session_lens = {
			load_on_setup = true,
			previewer = false,
			mappings = {
				delete_session = { { "n", "i" }, "<C-D>" },
				alternate_session = { { "n", "i" }, "<C-S>" },
				copy_session = { { "n", "i" }, "<C-Y>" },
			},
		},
		post_restore_cmds = {
			function()
				require("neo-tree.command").execute({
					source = "filesystem",
					toggle = true,
					reveal = true,
				})
			end,
		}
	},
	config = function(_, opts)
		require("auto-session").setup(opts)

		vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}

