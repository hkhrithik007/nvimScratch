local M = {}

M.setup = function()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local lspkind = require "lspkind"

  -- LuaSnip setup
  luasnip.config.setup {}

  -- Load snippets
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()
  require("luasnip.loaders.from_lua").lazy_load()

  -- Extend filetypes for documentation snippets
  local doc_filetypes = {
    typescript = "tsdoc",
    javascript = "jsdoc",
    lua = "luadoc",
    python = "pydoc",
    rust = "rustdoc",
    cs = "csharpdoc",
    java = "javadoc",
    c = "cdoc",
    cpp = "cppdoc",
    php = "phpdoc",
    kotlin = "kdoc",
    ruby = "rdoc",
    sh = "shelldoc",
  }

  for filetype, doctype in pairs(doc_filetypes) do
    luasnip.filetype_extend(filetype, { doctype })
  end

  -- Icons for completion items
  local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
  }

  -- Border style for completion window
  local borderstyle = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
  }

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = { completeopt = "menu,menuone,noinsert" },
    mapping = cmp.mapping.preset.insert {
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-y>"] = cmp.mapping.confirm { select = true },
      ["<C-Space>"] = cmp.mapping.complete {},
      ["<C-l>"] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { "i", "s" }),
    },
    window = {
      completion = borderstyle,
      documentation = borderstyle,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_lsp_signature_help" },
      { name = "buffer" },
      { name = "path" },
      { name = "nvlime" },
      { name = "conjure" },
      { name = "neorg" },
      { name = "lazydev" },
    },
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        local kind = lspkind.cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = string.format("%s %s", kind_icons[strings[1]] or "", strings[1] or "")
        kind.menu = strings[2] or ""
        return kind
      end,
    },
  }
end

return M
