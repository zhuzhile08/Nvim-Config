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
			gap = 1,
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
							use_float = true,
						},
					},
				},
			},
			source_selector = {
				winbar = true,
				sources = {
					{
						source = "filesystem",
						display_name = " 󰉓  Files ",
					},
					{
						source = "git_status",
						display_name = " 󰊢  Git ",
					},
				}
			}
		},
		keys = {
			{ "<leader>nn", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-Tree file browser" },
			{ "<leader>nN", "<cmd>Neotree focus<CR>", desc = "Focus on Neo-Tree file browser" },
			{ "<leader>nf", "<cmd>Neotree source=filesystem<CR>", desc = "Switch to Neo-Tree file browser" },
			{ "<leader>ng", "<cmd>Neotree source=git_status<CR>", desc = "Switch to Neo-Tree git status viewer" },
		},
	},
}

