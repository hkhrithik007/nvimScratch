-- Mason configuration - ONLY handles installation, NOT LSP setup
local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_tool_installer = require "mason-tool-installer"

-- List of servers to ensure are installed
local servers = {
  "pyright",
  "lua_ls",
  "jdtls",
  "html",
  "cssls",
  "ts_ls",
  "jsonls",
}

-- Mason setup (package manager)
mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    border = "rounded",
  },
  max_concurrent_installers = 10,
}

-- Mason-lspconfig setup (bridges Mason with LSP)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
  automatic_enable = true, -- Don't auto-enable, let vim.lsp.config handle it
}

-- Mason-tool-installer (for formatters, linters, etc.)
mason_tool_installer.setup {
  ensure_installed = {
    "prettier",
    "stylua",
    "black",
    "pylint",
    "eslint_d",
  },
}

-- Auto-update Mason after Lazy install
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyInstall",
  callback = function()
    vim.cmd "MasonUpdateAll"
  end,
})
