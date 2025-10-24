require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    java = { "google-java-format" },
    -- kotlin = { "ktfmt" },
    python = { "black" },
    html = { "prettier" },
    css = { "prettier" },
    ts_ls = { "prettier" },
  },
}
require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
