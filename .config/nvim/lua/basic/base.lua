require('lazy').setup({
	'mattn/emmet-vim',
	{ 'folke/neodev.nvim', opts = {} },
	{ 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },
	'jay-babu/mason-nvim-dap.nvim',
	'nvimdev/lspsaga.nvim',
	{
		'saecki/crates.nvim',
		tag = 'stable',
		config = function()
			require('crates').setup()
		end,
	},
	{
		'github/copilot.vim',
		options = {
			opt = {
				-- some existing code in here ...
			},
			g = {
				-- some existing code in here ...
				copilot_no_tab_map = true,
				copilot_assume_mapped = true,
			},
		},
	},
	'simrat39/rust-tools.nvim',
	-- Debugging
	'nvim-lua/plenary.nvim',
	'mfussenegger/nvim-dap',
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			'MunifTanjim/nui.nvim',
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			'rcarriga/nvim-notify',
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
	'neovim/nvim-lspconfig',
	'simrat39/rust-tools.nvim',

	-- Debugging
	'nvim-lua/plenary.nvim',
	'mfussenegger/nvim-dap',
	{
		'coffebar/neovim-project',
		opts = {
			projects = { -- define project roots
				'~/my_stuff/projects/*',
				'~/.config/*',
			},
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append('globals') -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
			{ 'Shatur/neovim-session-manager' },
		},
		lazy = false,
		priority = 100,
	},
	{ 'hinell/duplicate.nvim' },
	{
		'mrjones2014/legendary.nvim',
		priority = 10000,
		lazy = false,
	},
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	{ 'stevearc/conform.nvim', opts = {} },
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	'mg979/vim-visual-multi',
	{ 'MattesGroeger/vim-bookmarks', dependencies = {
		'tom-anders/telescope-vim-bookmarks.nvim',
	} },
	{
		'pmizio/typescript-tools.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
		opts = {},
	},
	'mfussenegger/nvim-lint',
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'onsails/lspkind.nvim',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-cmdline',
		},
	},
	'nvim-treesitter/nvim-treesitter',
	'axelvc/template-string.nvim',
	'windwp/nvim-ts-autotag',
	{ 'akinsho/toggleterm.nvim', version = '*', config = true },
	{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
	'rmagatti/alternate-toggler',
	'kylechui/nvim-surround',
	{ 'sustech-data/wildfire.nvim', event = 'VeryLazy', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
	{
		'Wansmer/treesj',
		keys = { '<space>m', '<space>j', '<space>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
	},
	'numToStr/Comment.nvim',
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {},
	},
})

local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.mouse:append('a')
opt.clipboard:append('unnamedplus')

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

--opt.cursorline = true
opt.termguicolors = true

-- THEME
vim.cmd.colorscheme('catppuccin-mocha')

vim.api.nvim_create_autocmd('TextYankPost', {
	--group = vim.api.nvim_create_augroup('highlight_yank', {}),
	--desc = 'Hightlight selection on yank',
	--pattern = '*',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 })
	end,
})
