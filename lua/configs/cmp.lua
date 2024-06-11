local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()
-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2D3642", fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C8D3E5", bg = "#1C1F26" })
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#8A92A8", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#89DDFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#89DDFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#D9A9FF", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#FF7C7C", bg = "#5E3535" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#FF7C7C", bg = "#5E3535" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#FF7C7C", bg = "#5E3535" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#89DDFF", bg = "#3D5E5E" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#89DDFF", bg = "#3D5E5E" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#89DDFF", bg = "#3D5E5E" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE57C", bg = "#5E4D35" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE57C", bg = "#5E4D35" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE57C", bg = "#5E4D35" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#E5B3FF", bg = "#5E3D5E" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#E5B3FF", bg = "#5E3D5E" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#E5B3FF", bg = "#5E3D5E" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#E5B3FF", bg = "#5E3D5E" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#E5B3FF", bg = "#5E3D5E" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C8D3E5", bg = "#8A92A8" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C8D3E5", bg = "#8A92A8" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#FFB386", bg = "#5E4539" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#FFB386", bg = "#5E4539" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#FFB386", bg = "#5E4539" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#7CFF7C", bg = "#3D5E3D" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#7CFF7C", bg = "#3D5E3D" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#7CFF7C", bg = "#3D5E3D" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#7CFFFF", bg = "#3D5E5E" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#7CFFFF", bg = "#3D5E5E" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#7CFFFF", bg = "#3D5E5E" })
-- `/` cmdline setup.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})

cmp.setup {
  completion = {
    completeopt = "menu,menuone,preview,noselect",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm { select = false },
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
    -- { name = "codeium" },
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
}

local handlers = require "nvim-autopairs.completion.handlers"
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done {
    filetypes = {
      -- "*" is an alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"],
        },
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end,
        },
      },
      -- Disable for tex
      tex = false,
    },
  }
)
