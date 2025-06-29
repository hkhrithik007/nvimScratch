local M = {}

function M.setup()
  local snacks = require "snacks"

  snacks.setup {
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "ascii-image-converter ~/.config/nvim/lua/configs/luffy.png -C",
          random = 10,
          indent = 2,
          height = 17,
        },
        -- {
        --   pane = 2,
        --   { section = "keys", gap = 1, padding = 1 },
        --   { section = "startup" },
        -- },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  }
end

return M
