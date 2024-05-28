-- EXAMPLE

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "jdtls", "kotlin_language_server" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })

  lspconfig.jdtls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })

  lspconfig.kotlin_language_server.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end
