return {
	"oskarrrrrrr/symbols.nvim",
	opts = {
		sidebar = {
			hide_cursor = false,
			open_direction = "right"
		}
	},
    config = function(_, opts)
		local r = require("symbols.recipes")
		require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, opts)

		vim.api.nvim_set_keymap("n", "<leader>ns", ":SymbolsToggle<CR>", { desc = "Open file symbol viewer", })
	end,
}
