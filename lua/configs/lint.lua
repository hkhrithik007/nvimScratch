local lint = require "lint"

lint.linters_by_ft = {
  java = { "trivy" },
  kotlin = { "ktfmt" },
  lua = { "luacheck" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {

  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>L", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })
