return {
	'Civitasv/cmake-tools.nvim',
	lazy = true,
	keys = {
		{ "<F7>", "<cmd>CMakeBuild<CR>", desc = "Build CMake project" },
		{ "<F8>", "<cmd>CMakeGenerate<CR>", desc = "Generate CMake project" },
		{ "<F9>", "<cmd>CMakeClean<CR>", desc = "Clean CMake cache and build directory"},
	},
	opts = require("config.cmake-tools-options"),
}

