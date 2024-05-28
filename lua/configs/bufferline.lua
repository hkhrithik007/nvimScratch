-- Bufferline configuration
require("bufferline").setup({
  options = {
    mode = "buffers",
    -- Enable/disable animations
    animation = true,

    -- Enable/disable close button
    close_button = true,

    -- Enable/disable icons
    icons = true,

    -- Enable/disable diagnostics
    diagnostics = true,

    -- Separator style (can be "slant" | "thick" | "thin" | { "any", "any" })
    separator_style = "thin",

    -- Enable/disable custom offsets
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },

    -- Enable/disable tab names
    tab_size = 18,
    show_tab_indicators = true,

    -- Enable/disable hover
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },

    -- Enable/disable custom sorting
    sort_by = "id",
  },
})
