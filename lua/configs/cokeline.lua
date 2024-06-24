local is_picking_focus = require("cokeline/mappings").is_picking_focus
local is_picking_close = require("cokeline/mappings").is_picking_close

-- Define some colors (you can adjust these to match your colorscheme)
local normal_fg = "#abb2bf"
local normal_bg = "#282c34"
local comment_fg = "#5c6370"
local yellow = "#e5c07b"
local red = "#e06c75"

require("cokeline").setup {
  show_if_buffers_are_at_least = 2,

  buffers = {
    filter_valid = function(buffer)
      return buffer.type ~= "terminal"
    end,
    focus_on_delete = "prev",
    new_buffers_position = "next",
  },

  rendering = {
    max_buffer_width = 30,
  },

  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and normal_fg or comment_fg
    end,
    bg = normal_bg,
  },

  sidebar = {
    filetype = "NvimTree",
    components = {
      {
        text = "  NvimTree",
        fg = yellow,
        bg = normal_bg,
        style = "bold",
      },
    },
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
      fg = comment_fg,
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

-- Toggle NvimTree (if you're using NvimTree)
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
