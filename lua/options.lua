-- add yours here!
-- vim.cmd "colorscheme tokyonight-night"
local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.o.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
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
-- vim.opt.guicursor = "n:block-blinkwait1000-blinkon500-blinkoff500"
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- vim.opt.igonorecase = true
vim.opt.smartcase = true
-- vim.opt.hlsearch = false
--
vim.opt.number = true
-- vim.opt.colorcolumn = "true"
vim.opt.signcolumn = "yes"
-- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- For Lua configuration
vim.opt.termguicolors = true

-- If you're using Vimscript, use this instead:
-- set termguicolors

-- You may also want to set the following for better color support
vim.opt.syntax = "on"
vim.opt.background = "dark" -- or "light" if you prefer a light background
