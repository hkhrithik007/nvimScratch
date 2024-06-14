local telescope = require "telescope"

telescope.setup {
  defaults = {
    theme = "cyberdream",
  },
  pickers = {
    find_files = {
      -- theme = "dropdown",
      -- sorting_strategy = "asceding",
      -- layout_strategy = "centre",
    },
    -- live_grep = {
    --   theme = "dropdown",
    -- },
  },
  extensions = {
    -- ...
  },
}
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
