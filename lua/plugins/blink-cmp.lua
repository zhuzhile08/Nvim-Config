local function systemDependantShortcut(darwin, other)
	if vim.loop.os_uname().sysname == "Darwin" then
		return darwin
	end

	return other
end


return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",

	opts = {
		keymap = {
			preset = "none",

			[systemDependantShortcut("<D-d>", "<C-d>")] = { 'show', 'show_documentation', 'hide_documentation' },
			[systemDependantShortcut("<D-s>", "<C-s>")] = { "show_signature", "hide_signature", "fallback" },

			[systemDependantShortcut("<D-k>", "<C-k>")] = { "select_prev", "fallback" },
			[systemDependantShortcut("<D-j>", "<C-j>")] = { "select_next", "fallback" },

			['<CR>'] = { 'accept', 'fallback' }, -- Derived from the enter preset
			['<C-e>'] = { 'hide', 'fallback' },

			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },

			['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
			['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

			['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
		},

		appearance = { -- Enable nerd fonts
			nerd_font_variant = "normal",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", },
		},

		completion = { -- Completion settings
			trigger = { -- Completion triggers
				show_in_snippet = false,
				show_on_backspace_in_keyword = true,
			},
			list = { -- Don't select autocomplete
				selection = {
					preselect = false,
				},
			},
			documentation = {
				auto_show = true,
			},
		},

		fuzzy = { -- Fuzzy search
			implementation = "prefer_rust_with_warning"
		},

		signature = { -- Function signature preview, lsp_signature.nvim already does that
			enabled = false,
		},

		cmdline = { -- Enable autocompletion in the vim command line
			enabled = true,

			keymap = {
				preset = "inherit",
			},

			sources = { "buffer", "cmdline" },
			completion = {
				menu = {
					auto_show = true,
				},
				list = {
					selection = {
						preselect = false,
					},
				},
			},
		}
	},
	opts_extend = { "sources.default" },
}

