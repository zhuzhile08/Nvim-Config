return {
	"neovim/nvim-lspconfig",
	config = function()
		local vlsp = vim.lsp

		vlsp.enable("pylsp")
		vlsp.config("pylsp", {
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							ignore = { "W391" },
							maxLineLength = 100,
						}
					}
				}
			}
		})

		vlsp.enable("clangd")


		vlsp.enable("cmake")


		vlsp.enable("lua_ls")
		vlsp.config("lua_ls", {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc')) then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,
			settings = {
				Lua = { },
			}
		})
	end
}

