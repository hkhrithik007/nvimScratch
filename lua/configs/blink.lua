local M = {}
function M.setup()
  local blink = require "blink.cmp"
  local ok, luasnip = pcall(require, "luasnip")
  blink.setup {
    enabled = function()
      local filetype = vim.bo.filetype
      return not vim.tbl_contains({
        "TelescopePrompt",
        "minifiles",
        "snacks_picker_input",
        "NvimTree",
        "nvimtree",
        "DressingInput", -- Add this line
      }, filetype)
    end,
    sources = {
      default = {
        "ripgrep",
        "lsp",
        "snippets",
        -- "path",
        -- "buffer",
        "codeium",
      },
      providers = {
        lsp = {
          name = "lsp",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          -- min_keyword_length = 3,
          -- score_offset = 90,
        },

        codeium = { name = "Codeium", module = "codeium.blink", async = true },
        snippets = {
          name = "snippets",
          enabled = true,
          -- max_items = 15,
          -- min_keyword_length = 4,
          module = "blink.cmp.sources.snippets",
          -- score_offset = 85,
        },
        ripgrep = {
          name = "Ripgrep",
          module = "blink-ripgrep",
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 25,
          fallbacks = { "snippets" },
          min_keyword_length = 2,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              if context and context.bufnr then
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end
              return vim.fn.getcwd()
            end,
            show_hidden_files_by_default = true,
          },
        },
        -- buffer = {
        --   name = "Buffer",
        --   enabled = true,
        --   max_items = 3,
        --   module = "blink.cmp.sources.buffer",
        --   min_keyword_length = 4,
        --   score_offset = 15,
        -- },
      },
    },

    cmdline = {
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        elseif type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
    },
    completion = {
      keyword = { range = "full" },
      list = {
        selection = {
          preselect = true, -- ✅ Fixed: Boolean instead of string
          auto_insert = true, -- ✅ Prevents auto-inserting suggestions
        },
      },
      accept = { auto_brackets = { enabled = true } },
      menu = {
        border = "rounded",
        auto_show = true,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "single",
        },
      },
      ghost_text = {
        enabled = false,
      },
    },

    snippets = {
      preset = "luasnip",
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,
    },
    keymap = {
      preset = "enter",
      ["<Down>"] = { "snippet_forward", "fallback" },
      ["<up>"] = { "snippet_backward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "Normal",
    },
    signature = { enabled = true, window = { border = "rounded" } },
  }
end

return M
