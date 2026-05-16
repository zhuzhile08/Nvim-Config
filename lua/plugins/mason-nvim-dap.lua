return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		automatic_installation = true,
		ensure_installed = {
			"codelldb",
		},
	},
}

