-- LSP configuration - Uses Neovim 0.11+ native API
-- Separate from Mason (Mason only installs, this configures)

-- Capabilities (if using completion plugin)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- On attach function (keybindings and settings per buffer)
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- Navigation
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- Actions
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

  -- Diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
end

-- Handlers (UI customization)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- ============================================================================
-- Global LSP Configuration (applies to all servers)
-- ============================================================================
vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

-- ============================================================================
-- Server-specific configurations
-- ============================================================================

-- Lua Language Server
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { globals = { "vim" } },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
    },
  },
})

-- Python (Pyright)
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
      },
    },
  },
})

-- HTML
vim.lsp.config("html", {
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
})

-- CSS
vim.lsp.config("cssls", {
  settings = {
    css = {
      validate = true,
      lint = { unknownAtRules = "ignore" },
    },
    scss = { validate = true },
    less = { validate = true },
  },
})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
  init_options = {
    preferences = {
      disableSuggestions = false,
    },
  },
})

-- JSON
vim.lsp.config("jsonls", {
  init_options = {
    provideFormatter = true,
  },
})

-- Java
vim.lsp.config("jdtls", {})

-- ============================================================================
-- Enable all servers
-- ============================================================================
vim.lsp.enable {
  "lua_ls",
  "pyright",
  "jdtls",
  "html",
  "cssls",
  "ts_ls",
  "jsonls",
}

-- ============================================================================
-- Diagnostic Configuration
-- ============================================================================
vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
}

vim.diagnostic.config {
  virtual_text = { prefix = "●", source = "if_many" },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "always" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
    priority = 10,
  },
}
