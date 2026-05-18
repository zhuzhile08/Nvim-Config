return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		opts = {
			extensions = {
				file_browser = { },
			},
		},
		config = function(_, opts)
			local fileBrowserActions = require("telescope").extensions.file_browser
			opts.extensions.file_browser = {
				["i"] = {
					["o"] = fileBrowserActions.change_cwd
				},
				["n"] = {
					["o"] = fileBrowserActions.change_cwd,
				}
			}

			require("telescope").setup(opts)

			if vim.loop.os_uname().sysname == "Darwin" then
				vim.keymap.set("n", "<D-f>", ":Telescope live_grep<CR>", { desc = "Telescope live grep" })
			else
				vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", { desc = "Telescope live grep" })
			end

			vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>", { desc = "Telescope find marked string" })
			vim.keymap.set("n", "<leader>fF", ":Telescope file_browser<CR>", { desc = "Telescope find folder" })

			require("telescope").load_extension("find_template")
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	}
}

