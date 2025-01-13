local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()
local kind_icons = {
  Text = "󰷾  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
  fields = "",
  codeium = "",
}

local borderstyle = {
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
}
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
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
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "abbr", "kind" },
    format = function(entry, vim_item)
      local kind_item = lspkind.cmp_format {
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
        symbol_map = { Codeium = "" },
      }(entry, vim_item)

      -- Add our custom kind icons
      -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

      -- Set menu source hints
      -- vim_item.menu = ({
      --   nvim_lsp = "[LSP]",
      --   luasnip = "[Snippet]",
      --   buffer = "[Buffer]",
      --   path = "[Path]",
      --   codeium = "[AI]",
      -- })[entry.source.name]

      return vim_item
    end,
  },

  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then -- This is more comprehensive
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  window = {
    completion = borderstyle,
    documentation = borderstyle,
  },
  sources = cmp.config.sources({
    { name = "codeium" },
    { name = "nvim_lsp" },
    { name = "luasnip", option = { show_autosnippets = true } },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
}

-- Set up lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["<YOUR_LSP_SERVER>"].setup {
  capabilities = capabilities,
}
require "lspconfig"
-- Set up custom highlights
local highlights = {
  CmpItemAbbrDefault = { fg = "#abb2bf" },
  CmpItemAbbrMatchDefault = { fg = "#61afef" },
  CmpItemAbbrMatchFuzzyDefault = { fg = "#61afef" },
  CmpItemKindDefault = { fg = "#c678dd" },
  CmpItemMenuDefault = { fg = "#98c379" },
  PmenuSel = { bg = "#3e4452" },
  Pmenu = { bg = "#282c34" },
  FloatBorder = { fg = "#3e4452" },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Set up autopairs integration
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
