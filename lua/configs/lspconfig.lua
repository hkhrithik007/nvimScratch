local lspconfig = require "lspconfig"

-- import mason_lspconfig plugin
local mason_lspconfig = require "mason-lspconfig"
local capabilities = require('blink.cmp').get_lsp_capabilities()
-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
mason_lspconfig.setup_handlers {
  -- default handler for installed servers
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end,
  ["lua_ls"] = function()
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
settings = {
    Lua = {
      completion = {
        callSnippet = 'Disable',
        keywordSnippet = 'Disable',
      }
    }
  }
    }
  end,
  ["jdtls"] = function()
    -- configure lua server (with special settings)
    lspconfig["jdtls"].setup {
      capabilities = capabilities,
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      sources = {
        organizeImports = true,
      },
      --   },
      -- },
    }
  end,
  -- ["kotlin_language_server"] = function()
  --   lspconfig["kotlin_language_server"].setup {
  --     capabilities = capabilities,
  --   }
  -- end,
  ["pylsp"] = function()
    lspconfig["pylsp"].setup {
      capabilities = capabilities,
    }
  end,
}
