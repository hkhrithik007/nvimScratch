-- add yours here!
local o = vim.o
vim.o.cursorline = true
o.relativenumber = true
o.cmdheight = 0
o.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

o.termguicolors = true
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true
o.wrap = false

o.smartcase = true
o.number = true
o.signcolumn = "yes"
-- For Lua configuration
o.termguicolors = true

-- If you're using Vimscript, use this instead:
-- set termguicolors

-- You may also want to set the following for better color support
o.syntax = "on"
o.background = "dark" -- or "light" if you prefer a light background
