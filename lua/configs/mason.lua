local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- On attach
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
end

-- Handlers
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- Mason setup
mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "pyright", "lua_ls", "jdtls" },
  automatic_installation = true,
})

-- Servers table with settings
local servers = {
  pyright = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { globals = { "vim" } },
    },
  },
  jdtls = {},
}

-- Setup LSPs per server (modern API)
for server_name, config in pairs(servers) do
  vim.lsp.config(server_name, {
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = config,
  })
end
