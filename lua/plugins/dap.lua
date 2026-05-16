return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<F6>", "<cmd>DapToggleBreakpoint<CR>", desc = "Add breakpoint at line" },
			{ "<F5>", "<cmd>DapContinue<CR>", desc = "Start or continue debugging" },
			{ "<F4>", "<cmd>DapStepOver<CR>", desc = "Step over a piece of code" },
			{ "<F3>", "<cmd>DapStepInto<CR>", desc = "Step into a function" },
			{ "<F2>", "<cmd>DapPause<CR>", desc = "Pause debugging" },
			{ "<F1>", "<cmd>DapTerminate<CR>", desc = "Terminate debugging" },
		},
		config = function()
			local dap = require("dap")

			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb",

				-- detached = false,
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		event = "VeryLazy",
		config = function()
			require("dapui").setup()

			local listeners = require("dap").listeners.before
			local dapui = require("dapui")

			listeners.attach.dapui_config = function()
				dapui.open()
			end

			listeners.launch.dapui_config = function()
				dapui.open()
			end

			listeners.event_terminated.dapui_config = function()
				dapui.close()
			end

			listeners.event_exited.dapui_config = function()
				dapui.close()
			end
		end
	}
}

