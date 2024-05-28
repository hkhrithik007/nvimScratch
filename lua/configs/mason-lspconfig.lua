-- Neovim configuration for mason-lspconfig

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- List of servers to automatically install and configure
local servers = {
  "jdtls",
  "lua_ls",
}

-- Automatically install language servers
mason_lspconfig.setup {
  ensure_installed = servers,
}

-- Automatically configure language servers
for _, server in ipairs(servers) do
  local opts = {
    on_attach = require("handlers").on_attach,
    capabilities = require("handlers").capabilities,
  }

  -- if server == "sumneko_lua" then
  --   local sumneko_opts = require("user.lsp.settings.sumneko_lua")
  --   opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  -- end

  lspconfig[server].setup(opts)
end
