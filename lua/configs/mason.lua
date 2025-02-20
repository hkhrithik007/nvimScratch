local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_tool_installer = require "mason-tool-installer"
-- enable mason and configure icons
mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}
mason_lspconfig.setup {
  -- list of servers for mason to install
  ensure_installed = {
    "lua_ls",
    "jdtls",
    -- "kotlin_language_server",
    "pyright",
  },
}

mason_tool_installer.setup {
  ensure_installed = {
    "stylua", -- lua formatter
    "google-java-format", -- java formatter
    -- "ktfmt", -- kotlin formatter
    "checkstyle",
    "java-debug-adapter", --java debugger
    "mypy",
    "ruff",
    "black",
    "debugpy",
  },
}
--- EXAMPLE: Run mason after lazy finishes updating.
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyInstall",
  callback = function()
    vim.cmd ":MasonUpdateAll"
  end,
})
