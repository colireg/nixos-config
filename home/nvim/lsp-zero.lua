local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').tsserver.setup({})
require('lspconfig').elixirls.setup({ cmd = {'elixir-ls'} })
require('lspconfig').pyright.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').lua_ls.setup({})
require('lspconfig').nixd.setup{}
