require('lspsaga').setup({
	ui = {
		border = 'rounded',
	},
	lightbulb = {
		enable = false,
	},
})
local keymap = vim.keymap
keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
		vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', '<cmd>Lspsaga code_action<cr>', opts)
		vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
	end,
})

vim.keymap.set('n', '<leader>k', '<cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { noremap = true, silent = true })

-- error lens
vim.fn.sign_define({
	{
		name = 'DiagnosticSignError',
		text = '',
		texthl = 'DiagnosticSignError',
		linehl = 'ErrorLine',
	},
	{
		name = 'DiagnosticSignWarn',
		text = '',
		texthl = 'DiagnosticSignWarn',
		linehl = 'WarningLine',
	},
	{
		name = 'DiagnosticSignInfo',
		text = '',
		texthl = 'DiagnosticSignInfo',
		linehl = 'InfoLine',
	},
	{
		name = 'DiagnosticSignHint',
		text = '',
		texthl = 'DiagnosticSignHint',
		linehl = 'HintLine',
	},
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
})

lspconfig.clangd.setup({
	on_attach = function(client)
		client.offset_encoding = 'utf-16'
	end,
})

-- lspconfig.rust_analyzer.setup({
-- 	settings = {
-- 		['rust-analyzer'] = {
-- 			cargo = {
-- 				allFeatures = true,
-- 			},
-- 			checkOnSave = {
-- 				command = 'clippy',
-- 			},
-- 			workspace = {
-- 				extraEnv = {
-- 					RUST_BACKTRACE = '1',
-- 				},
-- 				useRustcWrapperForBuildScripts = true,
-- 			},
-- 			procMacro = {
-- 				enable = true,
-- 			},
-- 		},
-- 	},
-- })
