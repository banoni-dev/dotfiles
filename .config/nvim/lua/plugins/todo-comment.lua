vim.keymap.set('n', ']t', function()
	require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
	require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

vim.keymap.set('n', '<leader>t', '<cmd>TodoTelescope<cr>', { desc = 'Previous todo comment' })

require('todo-comments').setup({
	keywords = {
		FIX = {
			icon = ' ', -- icon used for the sign, and in search results
			color = '#d60909', -- can be a hex color, or a named color (see below)
			alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = ' ', color = '#2a3b9e' },
		HACK = { icon = ' ', color = '#0f0e0f' },
		WARN = { icon = ' ', color = '#5c490b', alt = { 'WARNING', 'XXX' } },
		PERF = { icon = ' ', color = '#75017d', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
		NOTE = { icon = ' ', color = '#036106', alt = { 'INFO' } },
		TEST = { icon = '⏲ ', color = '#eaff00', alt = { 'TESTING', 'PASSED', 'FAILED' } },
	},
	colors = {
		error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
		warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
		info = { 'DiagnosticInfo', '#FF0000' },
		hint = { 'DiagnosticHint', '#FF0000' },
		default = { 'Identifier', '#FF0000' },
		test = { 'Identifier', '#FF00FF' },
	},
})
