require('alternate-toggler').setup({
	alternates = {
		['==='] = '!==',
		['=='] = '!=',
	},
})

local keymap = vim.keymap

keymap.set('n', '<leader>i', '<cmd>ToggleAlternate<cr>')
