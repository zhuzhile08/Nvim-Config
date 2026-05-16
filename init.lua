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
local snoremap = { noremap = true, silent = true}


-- Set the leader key

kmap.set("n", " ", "<Nop>", { silent = true, remap = false }) -- Clear the spacebar mappings first
vim.g.mapleader = " "


kmap.set("i", "<Esc>", "<Esc>:update<CR>", snoremap) -- Exit insert mode with just escapne

kmap.set("n", "<leader>s", ":write<CR>", snoremap) -- Save current file
kmap.set("n", "<leader>S", ":wa<CR>", snoremap) -- Save all files

kmap.set("n", "<leader>K", "<C-w>k", snoremap) -- Window navigation
kmap.set("n", "<leader>J", "<C-w>j", snoremap)
kmap.set("n", "<leader>H", "<C-w>h", snoremap)
kmap.set("n", "<leader>L", "<C-w>l", snoremap)
kmap.set("n", "<leader>ws", "<C-w>s", snoremap) -- Window creation
kmap.set("n", "<leader>wv", "<C-w>v", snoremap)

kmap.set("n", "<leader>nf", ":enew<CR>", snoremap)

kmap.set("n", "<C-d>", "<C-d>zz")
kmap.set("n", "<C-u>", "<C-u>zz")

kmap.set("n", "n", "nzzzv")
kmap.set("n", "N", "Nzzzv")


-- System custom config

if vim.loop.os_uname().sysname == "Darwin" then
	kmap.set("n", "<C-q>", "", snoremap) -- Exit by command-q on MacOs
end


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

