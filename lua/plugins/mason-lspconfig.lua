return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williambomab/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		automatic_installation = true,
		ensure_installed = {
			"clangd",
			"cmake",
			"pylsp",
			"lua_ls",
		},
	},
}

