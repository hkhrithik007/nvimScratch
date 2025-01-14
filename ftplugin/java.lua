-- Disable all LSP notifications globally at the start
-- Silence Noice notifications

-- Disable all LSP notifications globally at the start
vim.notify = function() end
vim.lsp.set_log_level "OFF"

-- Silence any remaining notification systems
local has_notify, notify = pcall(require, "notify")
if has_notify then
  notify.setup {
    background_colour = "#000000",
    enabled = false,
    level = "off",
  }
end

-- more space in the neovim command line for displaying messages
-- use this function notation to build some variables
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.ts = 4
vim.opt_local.expandtab = true

local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

-- Override the LSP message handler to be silent
local old_notify = vim.notify
vim.lsp.handlers["window/showMessage"] = function() end
vim.lsp.handlers["window/logMessage"] = function() end
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

local function capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end
  local CAPABILITIES = vim.lsp.protocol.make_client_capabilities()
  CAPABILITIES.textDocument.completion.completionItem.snippetSupport = true
  CAPABILITIES.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return CAPABILITIES
end

local function directory_exists(path)
  local f = io.popen("cd " .. path)
  local ff = f:read "*all"
  if ff:find "ItemNotFoundException" then
    return false
  else
    return true
  end
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- calculate workspace dir
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
if directory_exists(workspace_dir) then
else
  os.execute("mkdir " .. workspace_dir)
end

-- get the mason install path
local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

-- get the current OS
local os
if vim.fn.has "macunix" then
  os = "mac"
elseif vim.fn.has "win32" then
  os = "win"
else
  os = "linux"
end

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    "\n"
  )
)

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=false",
    "-Dlog.level=OFF",
    "-javaagent:" .. install_path .. "/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    install_path .. "/config_" .. os,
    "-data",
    workspace_dir,
  },
  capabilities = capabilities(),
  root_dir = root_dir,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {},
        filteredTypes = {
          "com.sun.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "~/.sdkman/candidates/java/17.0.1-tem",
          },
        },
      },
    },
  },
  handlers = {
    ["language/status"] = function() end,
    ["$/progress"] = function() end,
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { focusable = false, silent = true }),
    ["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { focusable = false, silent = true }
    ),
    ["window/showMessage"] = function() end,
    ["window/logMessage"] = function() end,
    ["workspace/configuration"] = function() end,
    ["textDocument/publishDiagnostics"] = function() end,
    ["$/status/report"] = function() end,
  },
  init_options = {
    bundles = {
      vim.fn.glob(
        mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
        "\n"
      ),
    },
    extendedClientCapabilities = {
      progressReportProvider = false,
      classFileContentsSupport = true,
      generateToStringPromptSupport = false,
      hashCodeEqualsPromptSupport = false,
      advancedExtractRefactoringSupport = false,
      advancedOrganizeImportsSupport = false,
      generateConstructorsPromptSupport = false,
      generateDelegateMethodsPromptSupport = false,
      moveRefactoringSupport = false,
      overrideMethodsPromptSupport = false,
      promptToMigrateFromJavaxToJakarta = false,
    },
  },
}

config["on_attach"] = function(client, bufnr)
  -- Disable neovim diagnostic virtual text and other displays
  vim.diagnostic.config {
    virtual_text = false,
    signs = false,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
  }

  local _, _ = pcall(vim.lsp.codelens.refresh)
  -- validation if DAP not installed
  local dap_status, _ = pcall(require, "nvim-dap")
  if not dap_status then
    return
  end
  require("jdtls.dap").setup_dap_main_class_configs()
  jdtls.setup_dap { hotcodereplace = "auto" }
  require("user.lsp.handlers").on_attach(client, bufnr)
end

-- Disable diagnostic virtual text and signs
vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

jdtls.start_or_attach(config)
vim.cmd [[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]]
