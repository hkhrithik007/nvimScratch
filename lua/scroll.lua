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

-- Keymappings for smooth scrolling
-- vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)
-- vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts)
-- vim.api.nvim_set_keymap("n", "<C-b>", "<C-b>zz", opts)
-- vim.api.nvim_set_keymap("n", "<C-f>", "<C-f>zz", opts)

-- Optionally, you can add these for even smoother scrolling
vim.opt.smoothscroll = true -- Only available in Neovim 0.8+
