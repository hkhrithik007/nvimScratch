local cmp = require "cmp"
local luasnip = require "luasnip"
-- local lspkind = require "lspkind"
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
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "abbr", "kind" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

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
      elseif luasnip.expand_or_jumpable() then
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
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "codeium" },
  }, {
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  }),
}

-- Set up lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["<YOUR_LSP_SERVER>"].setup {
  capabilities = capabilities,
}
require "lspconfig"
require("lua-language-server").start {
  capabilities = capabilities,
}
-- Set up custom highlights
vim.cmd [[
  highlight CmpItemAbbrDefault guifg=#abb2bf
  highlight CmpItemAbbrMatchDefault guifg=#61afef
  highlight CmpItemAbbrMatchFuzzyDefault guifg=#61afef
  highlight CmpItemKindDefault guifg=#c678dd
  highlight CmpItemMenuDefault guifg=#98c379
  highlight PmenuSel guibg=#3e4452
  highlight Pmenu guibg=#282c34
  highlight FloatBorder guifg=#3e4452
]]

-- Set up autopairs integration
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
