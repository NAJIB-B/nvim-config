local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'cssls', 'lua_ls', 'html', 'eslint'},
  handlers = {
    function(lua_ls)
      require('lspconfig')[lua_ls].setup({})
    end,

    function(html)
      require('lspconfig')[html].setup({})
    end,

    function(cssls)
      require('lspconfig')[cssls].setup({})
    end,

    function(eslint)
      require('lspconfig')[eslint].setup({})
    end,

  },
})

require('luasnip.loaders.from_vscode').lazy_load()
require("vim-react-snippets").lazy_load()

local cmp = require('cmp')

cmp.setup({
  sources = {
{name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
    preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({select = false}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
	 ['<CR>'] = cmp.mapping.confirm({select = false}),
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
