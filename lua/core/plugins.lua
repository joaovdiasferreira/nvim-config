vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'


	use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	}


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
	-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

--treesitter
	use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'


--cmp plugins
	use	'hrsh7th/cmp-nvim-lsp'
	use	'hrsh7th/cmp-buffer'
	use	'hrsh7th/cmp-path'
	use	'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

--snippets
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use "rafamadriz/friendly-snippets"


--themes
	use 'folke/tokyonight.nvim'
	use 'nvim-lualine/lualine.nvim'

end)
