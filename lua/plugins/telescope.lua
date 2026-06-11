local function systemDependantShortcut(darwin, other)
	if vim.loop.os_uname().sysname == "Darwin" then
		return darwin
	end

	return other
end


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
				file_browser = {
					mappings = { }
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			vim.keymap.set("n", systemDependantShortcut("<D-f>", "<C-f>"), ":Telescope live_grep<CR>", { desc = "Telescope live grep" })

			vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>", { desc = "Telescope find marked string" })
			vim.keymap.set("n", "<leader>fF", ":Telescope file_browser<CR>", { desc = "Telescope find folder" })

			vim.keymap.set("n", "<leader>fg", function () telescope.extensions.lazygit.lazygit() end, { desc = "Telescope find git submodules" })

			require("telescope").load_extension("find_template")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("lazygit")
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

