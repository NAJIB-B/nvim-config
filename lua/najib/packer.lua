-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({ 'rose-pine/neovim', as = 'rose-pine',

	config = function()
		vim.cmd('colorscheme rose-pine')
	end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate' })

	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('nvim-tree/nvim-web-devicons')
	use("nvim-lualine/lualine.nvim")

	use("windwp/nvim-autopairs")

	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
  use("Pocco81/auto-save.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("akinsho/toggleterm.nvim")
  use("mfussenegger/nvim-dap")
  	use {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        requires = {
				{'nvim-tree/nvim-web-devicons'},
        },
    }
	use("nvim-neotest/nvim-nio")
use	{ "rcarriga/nvim-dap-ui",

	}


  use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
            {'mlaursen/vim-react-snippets'}, -- react snippet

        },
    }

	use {
  "pmizio/typescript-tools.nvim",
  requires = { "nvim-lua/plenary.nvim"},
   config = function()
    require("typescript-tools").setup {}
  end,
}
end)
