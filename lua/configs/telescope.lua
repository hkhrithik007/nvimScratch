local telescope = require "telescope"

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    layout_config = {
      horizontal = { preview_cutoff = 80, preview_width = 0.55 },
      vertical = { mirror = true, preview_cutoff = 25 },
      prompt_position = "top",
      width = 0.87,
      height = 0.80,
    },
  },
  pickers = {
    find_files = {
      hidden = false,
    },
    live_grep = {
      additional_args = function(opts)
        return { "--hidden" }
      end,
    },
  },
  extensions = {
    fzf = {
      fuzzy = false, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    live_grep_args = {
      auto_quoting = true,
    },
    diffview = {
      use_diffview = true,
    },
  },
}
require("telescope").load_extension "fzf"
