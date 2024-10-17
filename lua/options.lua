-- add yours here!
-- vim.cmd "colorscheme tokyonight-night"
-- vim.cmd.colorscheme "catppuccin"
local o = vim.o
-- o.cursorlineo ='both' -- to enable cursorline!
vim.o.cursorline = true
-- vim.o.cursorcolumn = true
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

-- vim.o.guicursor = "n:block-blinkwait1000-blinkon500-blinkoff500"
o.termguicolors = true
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true
o.wrap = false

-- vim.o.igonorecase = true
o.smartcase = true
-- vim.o.hlsearch = false
o.number = true
-- vim.o.colorcolumn = "true"
o.signcolumn = "yes"
-- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- For Lua configuration
o.termguicolors = true

-- If you're using Vimscript, use this instead:
-- set termguicolors

-- You may also want to set the following for better color support
o.syntax = "on"
o.background = "dark" -- or "light" if you prefer a light background
