local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Diagnostic sign icons
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Lua LS (new declarative config)
vim.lsp.config["luals"] = {
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
    },
  },
}

-- JDTLS (Java)
vim.lsp.config["jdtls"] = {
  capabilities = capabilities,
  signatureHelp = { enabled = true },
  contentProvider = { preferred = "fernflower" },
  sources = {
    organizeImports = true,
  },
}

-- Python
vim.lsp.config["pylsp"] = {
  capabilities = capabilities,
}
vim.lsp.config["html"] = {
  capabilities = capabilities,
}
vim.lsp.config["cssls"] = {
  capabilities = capabilities,
}
vim.lsp.config["tsserver"] = {
  capabilities = capabilities,
}
-- Enable servers
for _, server in ipairs { "lua_ls", "jdtls", "pylsp", "html", "cssls", "tsserver" } do
  vim.lsp.enable(server)
end
