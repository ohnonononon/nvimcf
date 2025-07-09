return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require 'dap'
		local dapui = require 'dapui'

		require('mason-nvim-dap').setup{
		automatic_installation = true,
			handlers = {},
			ensure_installed = {
			'codelldb',
			},
		}
	dapui.setup {
		icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
		controls = {
			icons = {
				pause = '⏸',
				play = '▶',
				step_into = '⏎',
				step_over = '⏭',
				step_out = '⏮',
				step_back = 'b',
				run_last = '▶▶',
				terminate = '⏹',
				disconnect = '⏏',
			},
		},
		}
		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close
		-- DAP Adapter for codelldb
		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb", -- or full path to codelldb
		}

		-- C/C++ Configurations
		dap.configurations.c = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- Optional: Use same config for C++
		dap.configurations.cpp = dap.configurations.c

		-- Optional: Enable UI and virtual text
		require("nvim-dap-virtual-text").setup()
		require("dapui").setup()
	end,

	keys = {
   {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<leader>si',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<leader>sv',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<leader>so',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<leader>d1',
      function()
        require('dap').run_last()
      end,
      desc = 'Debug:Run Last Configuration.',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<leader>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
	},
}
