return {
	"romus204/tree-sitter-manager.nvim",
	config = function()
		require("tree-sitter-manager").setup({
			ensure_installed = {
				"c",
				"cpp",
				"cmake",
				"asm",
				"glsl",
				"python",
				"json",
				"json5",
				"gdscript",
				"gdshader",
			}
		})
	end,
}

