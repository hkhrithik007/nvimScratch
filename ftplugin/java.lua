local config = {
  cmd = { "/Users/hkhrithik/.local/share/nvim/mason/packages/jdtls/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  init_options = {
    bundles = {
      vim.fn.glob(
        "/Users/hkhrithik/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.1.jar",
        1
      ),
    },
  },
}
require("jdtls").start_or_attach(config)
