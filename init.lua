-- General NeoVim configs

local o = vim.o
local opt = vim.opt


-- Tab config

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4


-- Text wrapping config

opt.wrap = false


-- Line number config

opt.number = true
opt.relativenumber = true -- RelNum on startup

vim.api.nvim_create_autocmd({ "InsertEnter" }, { -- Turn on absolute line numbers when in insert mode
	callback = function()
		opt.relativenumber = false
	end
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, { -- Turn on relative line numbers when exiting insert mode
	callback = function()
		opt.relativenumber = true
	end
})


-- Editor appearence config

o.guifont = "FantasqueSansM Nerd Font:h16"
opt.cmdheight = 1



-- Indentation config

opt.cindent = true

vim.api.nvim_create_autocmd("FileType", { -- Custom indentation for C/C++
	pattern = { "c", "cpp", "inc", "h", "hpp" },
	callback = function()
		vim.opt_local.cinoptions = "N-s,E-s,g0,(0"
	end,
})


-- Keybinds

local kmap = vim.keymap

local function snoremap(d)
	return { noremap = true, silent = true, desc = d }
end


-- Set the leader key

kmap.set("n", " ", "<Nop>", { silent = true, remap = false }) -- Clear the spacebar mappings first
vim.g.mapleader = " "


kmap.set("i", "<Esc>", "<Esc>:update<CR>", snoremap("Exit insert mode")) -- Exit insert mode with just escape
kmap.set("t", "<Esc>", function ()
	if vim.g.lazygit_opened == 1 then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
	else
		vim.api.nvim_input("<C-\\><C-n>")
	end
end, snoremap("Exit terminal mode")) -- Exit terminal mode

kmap.set("n", "<leader>s", ":write<CR>", snoremap("Save current file")) -- Save current file
kmap.set("n", "<leader>S", ":wa<CR>", snoremap("Save all files")) -- Save all files

kmap.set("n", "<leader>K", "<C-w>k", snoremap("Move to upper window")) -- Window navigation
kmap.set("n", "<leader>J", "<C-w>j", snoremap("Move to lower window"))
kmap.set("n", "<leader>H", "<C-w>h", snoremap("Move to left window"))
kmap.set("n", "<leader>L", "<C-w>l", snoremap("Move to right window"))
kmap.set("n", "<leader>ws", "<C-w>s", snoremap("Create window below")) -- Window creation
kmap.set("n", "<leader>wv", "<C-w>v", snoremap("Create window above"))

kmap.set("n", "<leader>fn", ":enew<CR>", snoremap("Create new file")) -- New file

kmap.set("n", "<leader>t", ":botright split | terminal<CR>", snoremap("Create terminal")) -- Create terminal

kmap.set("n", "<leader>m", "za", snoremap("Toggle current fold")) -- Folding
kmap.set("n", "<leader>M", "za", snoremap("Toggle all folds under cursor"))

kmap.set("n", "<C-d>", "<C-d>zz")
kmap.set("n", "<C-u>", "<C-u>zz")

kmap.set("n", "n", "nzzzv", snoremap("Auto-search downwards")) -- Searching utility
kmap.set("n", "N", "Nzzzv", snoremap("Auto search upwards"))
kmap.set('n', '<leader>c', function()
	vim.fn.setreg("/", "")
end, snoremap("Clear search registers"))


-- System custom config

if vim.loop.os_uname().sysname == "Darwin" then
	kmap.set("n", "<C-q>", "", snoremap("Quit")) -- Exit by command-q on MacOs
end


-- Editor custom config

if vim.g.neovide == true then
	vim.g.neovide_scale_factor = 1.0

	local changeNeovideScale = function(delta)
		return function ()
			vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
		end
	end

	if vim.loop.os_uname().sysname == "Darwin" then
		vim.keymap.set("n", "<D-=>", changeNeovideScale(1.25))
		vim.keymap.set("n", "<D-->", changeNeovideScale(0.8))
	else
		vim.keymap.set("n", "<C-=>", changeNeovideScale(1.25))
		vim.keymap.set("n", "<C-->", changeNeovideScale(0.8))
	end
end


-- Folding config
opt.foldenable = true
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""


-- lazy.nvim setup and configs

require("config.lazy")


-- CMake Tools configs

require("config.cmake-tools-config")


-- Color config

local setHl = vim.api.nvim_set_hl

setHl(0, "VirtualTextError", { link = "DiagnosticError" })
setHl(0, "VirtualTextWarning", { link = "DiagnosticWarn" })
setHl(0, "VirtualTextInfo", { link = "DiagnosticInfo" })
setHl(0, "VirtualTextHint", { link = "DiagnosticHint" })

vim.diagnostic.config({ virtual_text = true })

