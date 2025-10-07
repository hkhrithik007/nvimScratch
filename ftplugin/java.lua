local bundles = {
  vim.fn.glob(
    "/Users/hritiksharma/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.2.jar",
    1
  ),
}

-- vim.list_extend(bundles, vim.split(vim.fn.glob("/path/to/microsoft/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
  cmd = { "/Users/hritiksharma/.local/share/nvim/mason/packages/jdtls/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  init_options = {
    bundles = bundles,
  },
}

require("jdtls").start_or_attach(config)
