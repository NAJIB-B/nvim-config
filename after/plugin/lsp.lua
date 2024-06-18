local lsp_zero = require('lsp-zero')


-- here you can setup the language servers
require('lspconfig').tsserver.setup({
		root_dir =	require'lspconfig'.util.root_pattern("package.json", "tsconfig.json", ".git"),
})

      require('lspconfig').pylyzer.setup({})
require('lspconfig').html.setup({})
require('lspconfig').cssls.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(lua_ls)
      require('lspconfig')[lua_ls].setup({})
    end,


	lua_ls = function()
			require('lspconfig').lua_ls.setup({
					single_file_support = false,
					on_attach = function(client, bufnr)
							print('hello lua server')
					end
			})
	end,

	rust_analyzer = function()
			require('lspconfig').rust_analyzer.setup({
					on_attach = function(client, bufnr)
							print('hello lua server')
					end
			})
	end,

  },
})
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-y>'] = cmp.mapping.confirm({select = false}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
