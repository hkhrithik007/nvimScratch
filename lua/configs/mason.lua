local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_tool_installer = require "mason-tool-installer"
local servers = {
  pyright = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  jdtls = {},
}

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

mason.setup()
mason_lspconfig.setup {
  automatic_enable = false, -- HACK: rely on lspconfig[server_name].setup to enable the LSPs. For some reason, pyright doesn't get enabled this way
  ensure_installed = vim.tbl_keys(servers),
}

for server_name, _ in pairs(servers) do
  require("lspconfig")[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
  }
end
--- EXAMPLE: Run mason after lazy finishes updating.
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyInstall",
  callback = function()
    vim.cmd ":MasonUpdateAll"
  end,
})
