return {
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = false,
		deps = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			auto_clean_after_session_restore = true,
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				}
			},
			window = {
				position = "right",
				mappings = {
					["P"] = {
						"toggle_preview",
						config = {
							use_float = false,
						},
					},
				},
			},
		},
		keys = {
			{ "<leader>M", "<cmd>Neotree focus<CR>", desc = "Focus on Neo-Tree file browser" },
			{ "<leader>m", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-Tree file browser" },
		},
	},
}

