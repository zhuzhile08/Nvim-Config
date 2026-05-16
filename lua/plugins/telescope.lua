return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fF", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>ff", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Telescope find marked string" })

		require("telescope").load_extension("find_template")
	end,
}

