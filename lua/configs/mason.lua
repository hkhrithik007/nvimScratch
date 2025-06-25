local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_tool_installer = require "mason-tool-installer"
-- Configure a server via `vim.lsp.config()` or `{after/}lsp/lua_ls.lua`
require("mason").setup()
-- Note: `nvim-lspconfig` needs to be in 'runtimepath' by the time you set up mason-lspconfig.nvim
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls" },
}
--- EXAMPLE: Run mason after lazy finishes updating.
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyInstall",
  callback = function()
    vim.cmd ":MasonUpdateAll"
  end,
})
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "jdtls", "pylsp" },
}
