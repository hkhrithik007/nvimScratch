local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noselect",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),     -- previous suggestion
    ["<Tab>"] = cmp.mapping.select_next_item(),       -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),            -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },     -- snippets
    { name = "buffer" },      -- text within current buffer
    { name = "path" },        -- file system paths
    -- { name = "codeium" },
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
      mode = "symbol",
      symbol_map = { Codeium = "" },
    })
  },
})

local handlers = require('nvim-autopairs.completion.handlers')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is an alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end
        }
      },
      -- Disable for tex
      tex = false
    }
  })
)
