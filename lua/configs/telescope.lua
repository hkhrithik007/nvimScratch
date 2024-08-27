local telescope = require "telescope"

telescope.setup {
  defaults = {
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      horizontal = { preview_cutoff = 80, preview_width = 0.55 },
      vertical = { mirror = true, preview_cutoff = 25 },
      prompt_position = "bottom",
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
    live_grep_args = {
      auto_quoting = true,
    },
    diffview = {
      use_diffview = true,
    },
  },
}
