return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",

	opts = {
		keymap = {
			preset = "super-tab",
			["<C-d>"] = { 'show', 'show_documentation', 'hide_documentation' }
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
				show_on_backspace = true,
				show_on_backspace_in_keyword = true,
			},
			list = {
				selection = {
					preselect = false,
				},
			}, -- Don't select autocomplete
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
			completion = { menu = { auto_show = true, }, },
		}
	},
	opts_extend = { "sources.default" },
}

