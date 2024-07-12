local legendary = require('legendary')
legendary.keymaps({
	-- duplicate
	{
		description = 'Line: duplicate up',
		mode = { 'n' },
		'<leader><A-k>',
		'<CMD>LineDuplicate -1<CR>',
	},
	{
		description = 'Line: duplicate down',
		mode = { 'n' },
		'<leader><A-j>',
		'<S-d-j>',
		'<CMD>LineDuplicate +1<CR>',
	},
	{
		description = 'Selection: duplicate up',
		mode = { 'v' },
		'<leader><A-k>',
		'<CMD>VisualDuplicate -1<CR>',
	},
	{
		description = 'Selection: duplicate down',
		mode = { 'v' },
		'<leader><A-j>',
		'<CMD>VisualDuplicate +1<CR>',
	},
	-- project
	{
		description = 'find a project based on patterns',
		mode = { 'n' },
		'<leader>p',
		'<CMD>Telescope neovim-project discover<CR>',
	},
	{
		description = 'select a project from your recent history',
		mode = { 'n' },
		'<leader>h',
		'<CMD>Telescope neovim-project history<CR>',
	},
})
