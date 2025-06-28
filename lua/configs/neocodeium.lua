local neocodeium = require "neocodeium"
local blink = require "blink.cmp"

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    neocodeium.clear()
  end,
})

neocodeium.setup {
  filter = function()
    return not blink.is_visible()
  end,
}
vim.keymap.set("i", "<C-g>", function()
  require("neocodeium").accept()
end)
vim.keymap.set("i", "<C-w>", function()
  require("neocodeium").accept_word()
end)
vim.keymap.set("i", "<C-l>", function()
  require("neocodeium").accept_line()
end)
vim.keymap.set("i", "<C-c>", function()
  require("neocodeium").cycle_or_complete()
end)
vim.keymap.set("i", "<C-r>", function()
  require("neocodeium").cycle_or_complete(-1)
end)
