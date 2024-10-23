local opts = { noremap = true, silent = true }

-- Enable stable scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Smooth scrolling
vim.opt.scrolljump = 1

-- Disable cursor line when scrolling
vim.api.nvim_create_autocmd({ "WinScrolled" }, {
  callback = function()
    local current_window = vim.api.nvim_get_current_win()
    vim.wo[current_window].cursorline = false
  end,
})

-- Re-enable cursor line when scrolling stops
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local current_window = vim.api.nvim_get_current_win()
    vim.wo[current_window].cursorline = true
  end,
})

-- Optionally, you can add these for even smoother scrolling
vim.opt.smoothscroll = true -- Only available in Neovim 0.8+
