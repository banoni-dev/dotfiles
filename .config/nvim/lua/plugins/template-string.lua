require('template-string').setup({
	filetypes = { 'html', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
	jsx_brackets = true,
	remove_template_string = false,
	restore_quotes = {
		normal = [[']],
		jsx = [["]],
	},
})
