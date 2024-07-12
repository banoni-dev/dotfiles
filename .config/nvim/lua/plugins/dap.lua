local dap = require('dap')
dap.adapters.codelldb = {
	type = 'server',
	host = '127.0.0.1',
	port = 13000, -- 💀 Use the port printed out or specified with `--port`
}

dap.adapters.codelldb = {
	type = 'server',
	port = '${port}',
	executable = {
		-- CHANGE THIS to your path!
		command = '/home/ahmed/my_stuff/unzipped_files/codelldb/extension/adapter/codelldb',
		args = { '--port', '${port}' },

		-- On windows you may have to uncomment this:
		-- detached = false,
	},
}

dap.configurations.cpp = {
	{
		name = 'Launch file',
		type = 'codelldb',
		request = 'launch',
		program = function()
			return vim.fn.expand('~/my_stuff/debug')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}

local dapui = require('dapui')
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
