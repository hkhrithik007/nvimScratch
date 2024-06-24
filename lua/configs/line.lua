local is_picking_focus = require("cokeline/mappings").is_picking_focus
local is_picking_close = require("cokeline/mappings").is_picking_close

local red = vim.g.terminal_color_1 or "#E06C75"
local yellow = vim.g.terminal_color_3 or "#E5C07B"

require("cokeline").setup {
  show_if_buffers_are_at_least = 2,

  buffers = {
    -- Filter out terminal buffers
    filter_valid = function(buffer)
      return buffer.type ~= "terminal"
    end,
    -- Focus the previous buffer when the current one is closed
    focus_on_delete = "prev",
    -- New buffers will be inserted next to the currently focused buffer
    new_buffers_position = "next",
  },

  rendering = {
    max_buffer_width = 30,
  },

  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and "#FFFFFF" or "#777777"
    end,
    bg = "#282C34",
  },

  components = {
    {
      text = function(buffer)
        return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. " " or "  "
      end,
      fg = yellow,
      style = function(buffer)
        return (is_picking_focus() and "bold") or nil
      end,
    },
    {
      text = function(buffer)
        return buffer.devicon.icon .. " "
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = function(buffer)
        return buffer.filename .. " "
      end,
      style = function(buffer)
        return buffer.is_focused and "bold" or nil
      end,
    },
    {
      text = function(buffer)
        return buffer.is_modified and "● " or "  "
      end,
      fg = function(buffer)
        return buffer.is_modified and red or nil
      end,
    },
    {
      text = "│",
      fg = "#4B5263",
    },
  },
}
-- Keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Switch between buffers
map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", opts)
map("n", "<Tab>", "<Plug>(cokeline-focus-next)", opts)
map("n", "<Leader>b", "<Plug>(cokeline-pick-focus)", opts)

-- Close buffers
map("n", "<Leader>q", "<Plug>(cokeline-pick-close)", opts)
