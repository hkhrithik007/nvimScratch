require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    -- java = { "google-java-format" },
    -- kotlin = { "ktfmt" },
  },
}
