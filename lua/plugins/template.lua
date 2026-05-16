return {
	"glepnir/template.nvim",
	cmd = { "Template", "TemProject" },
	opts = {
		temp_dir = "~/.config/nvim/templates",
		author = "Zhile Zhu",
		email = "zhuzhile08@gmail.com"
	},
	config = function(_, opts)
		require("template").setup(opts)
	end,
}
