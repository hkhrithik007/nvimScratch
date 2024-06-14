-- Lua
require("bufferline").setup {
  options = {
    -- Enable/disable icons
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
    },
    -- Enable/disable close button
    close_button = false,
    -- Enable/disable left/right scroll buttons
    left_trunc_marker = "",
    right_trunc_marker = "",
    -- Enable/disable maximum prefix digits
    max_prefix_length = 4,
    -- Enable/disable persistent buffer ordering
    persistent_buffer_order = true,
    -- Enable/disable diagnostics
    diagnostics = "nvim_lsp",
    -- Enable/disable extensions
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
      },
    },
    -- Enable/disable custom colors
    color_icons = true,
    -- Sets a custom sort logic for buffers
    sort_by = "extension",
  },
  highlights = {
    fill = {
      guibg = "#3c3836",
    },
    background = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    tab = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    tab_selected = {
      guifg = "#ebdbb2",
      guibg = "#504945",
      gui = "bold",
    },
    tab_close = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    duplicate_selected = {
      gui = "bold",
      guibg = "#504945",
    },
    duplicate_visible = {
      gui = "bold",
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    duplicate = {
      guifg = "#928374",
      guibg = "#3c3836",
    },
    modified = {
      guifg = "#fabd2f",
      guibg = "#3c3836",
    },
    modified_selected = {
      guifg = "#fabd2f",
      guibg = "#504945",
    },
    modified_visible = {
      guifg = "#fabd2f",
      guibg = "#3c3836",
    },
    separator = {
      guifg = "#928374",
      guibg = "#3c3836",
    },
    separator_selected = {
      guifg = "#928374",
      guibg = "#504945",
    },
    separator_visible = {
      guifg = "#928374",
      guibg = "#3c3836",
    },
    pick_selected = {
      guifg = "#ebdbb2",
      guibg = "#504945",
    },
    pick_visible = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    pick = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    numbers = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    diagnostic = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    hint = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    info = {
      guifg = "#ebdbb2",
      guibg = "#3c3836",
    },
    warning = {
      guifg = "#fabd2f",
      guibg = "#3c3836",
    },
    error = {
      guifg = "#fb4934",
      guibg = "#3c3836",
    },
    error_diagnostic = {
      guifg = "#fb4934",
      guibg = "#3c3836",
    },
  },
}
