require('mason').setup({
	ui = {
		icons = {
			package_installed = '✓',
			package_pending = '➜',
			package_uninstalled = '✗',
		},
	},
})
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed = {
		'lua-language-server',
		'stylua',
		'clangd',
    'clang-format',
    'rustfmt'
	},
})

-- require('mason-nvim-dap').setup({
-- 	ensure_installed = {
-- 		'lua-language-server',
-- 		'stylua',
-- 		'prettierd',
-- 		'eslint_d',
-- 		'clangd',
-- 		'clang-format',
-- 		'rust-analyzer',
-- 	},
-- })
