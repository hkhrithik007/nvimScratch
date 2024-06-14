-- Set up bufferline.nvim
require("bufferline").setup {
  options = {
    -- Enable file icons and colors
    numbers = "buffer_id",
    indicator = {
      icon = "▎", -- This is the icon used for a modified buffer
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match "error" and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        padding = 1,
      },
    },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    fill = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    buffer_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
      gui = "none",
    },
    buffer_visible = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    close_button = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    close_button_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    close_button_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },

    tab_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      guifg = { attribute = "fg", highlight = "TabLineFill" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },

    duplicate_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
      gui = "italic",
    },
    duplicate_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },
    duplicate = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },

    modified = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    modified_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    separator = {
      guifg = { attribute = "bg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    separator_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    indicator_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
  },
}
