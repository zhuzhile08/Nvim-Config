local M = { }


local function hasCMakeFile(dir)
	return vim.fn.filereadable(dir .. "/CMakeLists.txt") == 1
end


local function getCMakeBuildDirectory(cwd)
	if jit.os == "Windows" then
		return cwd .. "\\out\\build\\${variant:buildType}"
	else
		return cwd .. "/out/build/${variant:buildType}"
	end
end

local function ensureCMakeToolsLoaded()
	local plugin = require("lazy.core.config").plugins["cmake-tools.nvim"]
	if not plugin then return end

	local cwd = vim.fn.getcwd()

	if hasCMakeFile(cwd) then
		if not plugin._.loaded then
			require("lazy").load({ plugins = { "cmake-tools.nvim" } })
		end

		vim.defer_fn(
			function()
				vim.api.nvim_cmd({
					cmd = "CMakeSelectCwd",
					args = { cwd },
				}, {})
			end, 3000
		)

		vim.defer_fn(
			function()
				vim.api.nvim_cmd({
					cmd = "CMakeSelectBuildDir",
					args = { getCMakeBuildDirectory(cwd) },
				}, {})
			end, 6000
		)
	else
		if plugin._.loaded then
			require("lazy").unload("cmake-tools.nvim")
		end
	end
end


-- vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", }, {
-- 	callback = ensureCMakeToolsLoaded,
-- })

M.ensureCMakeToolsLoaded = ensureCMakeToolsLoaded

return M

