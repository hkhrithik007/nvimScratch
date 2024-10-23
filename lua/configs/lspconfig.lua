local lspconfig = require "lspconfig"

-- import mason_lspconfig plugin
local mason_lspconfig = require "mason-lspconfig"

-- import cmp-nvim-lsp plugin
local cmp_nvim_lsp = require "cmp_nvim_lsp"

local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }
  end,
})

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
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
    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
            keywordSnippet = "Replace",
            showWord = "Disable", -- don't suggest common words as fallback
            workspaceWord = false, -- already done by cmp-buffer
            postfix = ".", -- useful for `table.insert` and the like
          },
          diagnostics = {
            globals = { "vim" }, -- when contributing to nvim plugins missing a `.luarc.json`
            disable = { "trailing-space" }, -- formatter already handles that
          },
          hint = { -- inlay hints
            enable = true,
            setType = true,
            arrayIndex = "Disable", -- too noisy
            semicolon = "Disable", -- mostly wrong on invalid code
          },
          -- FIX https://github.com/sumneko/lua-language-server/issues/679#issuecomment-925524834
          workspace = { checkThirdParty = "Disable" },
        },
      },
    }
  end,
  ["jdtls"] = function()
    -- configure lua server (with special settings)
    lspconfig["jdtls"].setup {
      capabilities = capabilities,
      settings = {
        java = {
          hint = { -- inlay hints
            enable = true,
            setType = true,
            arrayIndex = "Enable", -- too noisy
            semicolon = "Disable", -- mostly wrong on invalid code
          },
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
          sources = {
            organizeImports = true,
          },
        },
      },
    }
  end,
  ["kotlin_language_server"] = function()
    -- configure lua server (with special settings)
    lspconfig["kotlin_language_server"].setup {
      capabilities = capabilities,
      settings = {
        kotlin = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          },
          hint = { -- inlay hints
            enable = true,
            setType = true,
            arrayIndex = "Disable", -- too noisy
            semicolon = "Disable", -- mostly wrong on invalid code
          },
        },
      },
    }
  end,
}
