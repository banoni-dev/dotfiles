return {
	'stevearc/conform.nvim',
	lazy = true,
	event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				javascript = { 'prettierd' },
				typescript = { 'biome' },
				javascriptreact = { 'biome' },
				typescriptreact = { 'biome' },
				css = { 'biome' },
				html = { 'prettierd' },
				json = { 'biome' },
				yaml = { 'biome' },
				rust = { 'rustfmt' },
				cpp = { 'clang-format' },
			},

			format_on_save = {
				pattern = '.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs,*.js,*.ts,*.jsx,*.tsx,*.cpp,*.c,*.go',
				timeout_ms = 500,
				async = false,
				lsp_fallback = true,
			},
		})
	end,
}
