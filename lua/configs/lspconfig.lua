-- Configure Lua Language Server
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Configure Python
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

-- Configure Java (specify command if not in PATH)
vim.lsp.config("jdtls", {
  cmd = { "jdtls" },
})

-- Configure HTML
vim.lsp.config("html", {
  filetypes = { "html", "htmldjango" },
})

-- Configure CSS
vim.lsp.config("cssls", {
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

-- Now enable all servers
--vim.lsp.enable { "lua_ls", "pyright", "jdtls", "html", "cssls" }
