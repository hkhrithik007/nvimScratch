local bundles = {
  vim.fn.glob(
    "/Users/hkhrithik/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.2.jar",
    1
  ),
}

-- Load java-test bundles and exclude some jars
local java_test_bundles =
    vim.split(vim.fn.glob("/Users/hkhrithik/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
local excluded = {
  "com.microsoft.java.test.runner-jar-with-dependencies.jar",
  "jacocoagent.jar",
}
for _, jar in ipairs(java_test_bundles) do
  local fname = vim.fn.fnamemodify(jar, ":t")
  if not vim.tbl_contains(excluded, fname) then
    table.insert(bundles, jar)
  end
end

local config = {
  cmd = { "/Users/hkhrithik/.local/share/nvim/mason/packages/jdtls/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  init_options = {
    bundles = bundles,
  },
}

require("jdtls").start_or_attach(config)
