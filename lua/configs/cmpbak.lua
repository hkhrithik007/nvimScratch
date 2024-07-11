local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- Custom highlight groups for nvim-cmp
local custom_highlights = function(C)
  return {
    CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
    CmpItemKindKeyword = { fg = C.base, bg = C.red },
    CmpItemKindText = { fg = C.base, bg = C.teal },
    CmpItemKindMethod = { fg = C.base, bg = C.blue },
    CmpItemKindConstructor = { fg = C.base, bg = C.blue },
    CmpItemKindFunction = { fg = C.base, bg = C.blue },
    CmpItemKindFolder = { fg = C.base, bg = C.blue },
    CmpItemKindModule = { fg = C.base, bg = C.blue },
    CmpItemKindConstant = { fg = C.base, bg = C.peach },
    CmpItemKindField = { fg = C.base, bg = C.green },
    CmpItemKindProperty = { fg = C.base, bg = C.green },
    CmpItemKindEnum = { fg = C.base, bg = C.green },
    CmpItemKindUnit = { fg = C.base, bg = C.green },
    CmpItemKindClass = { fg = C.base, bg = C.yellow },
    CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
    CmpItemKindFile = { fg = C.base, bg = C.blue },
    CmpItemKindInterface = { fg = C.base, bg = C.yellow },
    CmpItemKindColor = { fg = C.base, bg = C.red },
    CmpItemKindReference = { fg = C.base, bg = C.red },
    CmpItemKindEnumMember = { fg = C.base, bg = C.red },
    CmpItemKindStruct = { fg = C.base, bg = C.blue },
    CmpItemKindValue = { fg = C.base, bg = C.peach },
    CmpItemKindEvent = { fg = C.base, bg = C.blue },
    CmpItemKindOperator = { fg = C.base, bg = C.blue },
    CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
    CmpItemKindCopilot = { fg = C.base, bg = C.teal },
  }
end

-- Apply custom highlights
-- local C = require("catppuccin.palettes").get_palette()
-- for group, colors in pairs(custom_highlights(C)) do
--   vim.api.nvim_set_hl(0, group, colors)
-- end

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
-- Rest of the nvim-cmp configuration
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
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
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

-- The rest of your nvim-cmp configuration (cmdline setup, autopairs, etc.) remains unchanged
