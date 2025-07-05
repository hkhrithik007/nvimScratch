-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
on_attach = function(client, bufnr)
  vim.keymap.set("n", "<leader>w", function()
    local params = vim.lsp.util.make_formatting_params {}
    local handler = function(result, err)
      if not result then
        return
      end

      vim.lsp.util.apply_text_edits(result, bufnr, client.offset_encoding)
      vim.cmd "write"
    end

    client.request("textDocument/formatting", params, handler, bufnr)
  end, { buffer = bufnr })
end
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "<leader>ss", "<cmd>source %<cr>", { desc = "Source file" })
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>", { desc = "Quit" })
