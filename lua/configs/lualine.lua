-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
    lualine_b = { { 'diff', separator = { left = '', right = '' }, right_padding = 2 }, },
    lualine_c = {
      -- { 'diagnostics', separator = { right = '' }, right_padding = 2 },
    }, lualine_x = {
    {
      function()
        local msg = "No LSP"
        local buf_nr = vim.api.nvim_get_current_buf()
        local buf_ft = vim.bo.filetype
        local clients = vim.lsp.get_clients { bufnr = buf_nr }
        local lsp_short_names = {
          pyright = "py",
          tsserver = "ts",
          rust_analyzer = "rs",
          lua_ls = "lua",
          clangd = "c++",
          bashls = "sh",
          jsonls = "json",
          html = "html",
          cssls = "css",
          tailwindcss = "tw",
          dockerls = "docker",
          sqlls = "sql",
          yamlls = "yml",
        }
        local names = {}
        -- Add active LSP clients
        for _, client in ipairs(clients) do
          if client.name ~= "null-ls" then
            table.insert(names, lsp_short_names[client.name] or client.name)
          end
        end
        -- Add linters from nvim-lint
        local lint_ok, lint = pcall(require, "lint")
        if lint_ok and lint.linters_by_ft then
          local linters = lint.linters_by_ft[buf_ft]
          if type(linters) == "table" then
            for _, linter in ipairs(linters) do
              table.insert(names, linter)
            end
          elseif type(linters) == "string" then
            table.insert(names, linters)
          end
        end
        -- Add formatters from conform.nvim
        local conform_ok, conform = pcall(require, "conform")
        if conform_ok and conform.list_formatters_for_buffer then
          local formatters = conform.list_formatters_for_buffer()
          for _, formatter in ipairs(formatters) do
            table.insert(names, formatter)
          end
        end
        -- Remove duplicates
        local seen = {}
        local unique = {}
        for _, name in ipairs(names) do
          if not seen[name] then
            table.insert(unique, name)
            seen[name] = true
          end
        end
        if #unique == 0 then
          return msg
        end
        return "[" .. table.concat(unique, ", ") .. "]"
      end,
      icon = '󰙳 ',
      separator = { left = '', right = '' },
      color = function()
        local buf_nr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients { bufnr = buf_nr }

        local has_lsp = false
        for _, client in ipairs(clients) do
          if client.name ~= "null-ls" then
            has_lsp = true
            break
          end
        end

        if has_lsp then
          return { fg = colors.black, bg = colors.cyan, gui = "bold" }
        else
          return { fg = colors.white, bg = colors.grey, gui = "bold" }
        end
      end,
    },
  },
    lualine_y = { 'branch', 'diagnostics', { 'filetype', separator = { left = '', right = '' }, left_padding = 2 } },
    lualine_z = {
      { 'location', separator = { left = '', right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
