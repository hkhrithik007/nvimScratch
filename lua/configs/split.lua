local split = require "smart-splits"

split.setup {
  ignored_filetypes = {
    "nofile",
    "quickfix",
    "prompt",
  },
  ignored_buftypes = { "nofile" },
  enable_ignored_filetypes = false,
  autosave_ignored = true,
  autosave_only = {
    "gitcommit",
  },
  ignored_fallthrough = {},
  hooks = {
    before_save = nil,
    before_quit = nil,
    after_quit = nil,
  },
  ignored_buftypes_except_filetypes = {
    ["nerdtree"] = "nerdtree",
  },
  skip_prompt_for_additional_buffers = true,
}
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
vim.keymap.set("n", "<C-a>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-s>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-w>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-d>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
