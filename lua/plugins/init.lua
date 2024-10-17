---@diagnostic disable-next-line: unused-local
local lazy = require "lazy"
return {
  {
    "folke/which-key.nvim",
    event = "BufRead",
    dependencies = {
      "echasnovski/mini.icons",
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require "configs.whichkey"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "bufread",
    config = function()
      require "configs.nvimtree"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "jemag/telescope-diff.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require "configs.telescope"
    end,
  },
  {
    {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
      opts = {
        ensure_installed = {
          "vim",
          "lua",
          "vimdoc",
          "html",
          "css",
          "java",
          "kotlin",
        },
      },
    },
  },
  -- {
  --   "Exafunction/codeium.nvim",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({
  --     })
  --   end
  -- },
  {
    "mfussenegger/nvim-jdtls",
    lazy = "VeryLazy",
    -- event = { "BufReadPre", "BufNewFile" },
    ft = "java",
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufRead" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
    event = "BufRead",
    dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = function()
      require "configs.mason"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    -- lazy = "VeryLazy",
    ft = { "java", "kotlin" },
    dependencies = {
      -- "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
    },
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    -- lazy = "VeryLazy",
    ft = { "java", "kotlin" },
    -- event = "BufRead",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      require "configs.dapui"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- lazy = "VeryLazy",
    ft = { "java", "kotlin" },
    -- event = "BufRead",
    dependencies = {
      -- "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.mason_dap"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "windwp/nvim-autopairs",
      "williamboman/mason.nvim",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
    event = { "BufRead", "BufnewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  { -- display type hints at eol, not in the middle of a line
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    config = function()
      require "configs.end_hints"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    lazy = "VeryLazy",
    enabled = true,
    config = function()
      require "configs.lint"
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   enabled = true,
  --   -- lazy = true,
  --   opts = function()
  --     return {
  --       style = "day",
  --       light_style = "moon",
  --       -- transparent = false,
  --       -- styles = {
  --       --   sidebars = "transparent",
  --       --   floats = "transparent",
  --       -- },
  --       on_highlights = function(hl, c)
  --         -- hl.Normal = "Foo"
  --         do
  --           return
  --         end
  --         local prompt = "#2d3149"
  --         hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg }
  --         hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
  --         hl.TelescopePromptNormal = { bg = prompt }
  --         hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  --         hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
  --         hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  --         hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
  --       end,
  --     }
  --   end,
  -- },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   enabled = false,
  --   config = function()
  --     require "configs.cyberdream"
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   enabled = true,
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require "configs.catppuccin"
  --   end,
  -- },
  {
    "EdenEast/nightfox.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require "configs.nightfox"
    end,
  },
  -- {
  --   "danwlker/primeppuccin",
  --   priority = 1000,
  -- },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   enabled = false,
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd "colorscheme oxocarbon"
  --   end,
  -- },
  {
    "dgox16/oldworld.nvim",
    lazy = "VeryLazy",
    config = function()
      require("oldworld").setup()
    end,
  },
  {

    {
      "stevearc/dressing.nvim",
      lazy = "VeryLazy",
      -- event = { "BufRead", "BufnewFile" },
      init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
          require("lazy").load { plugins = { "dressing.nvim" } }
          return vim.ui.select(...)
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.input = function(...)
          require("lazy").load { plugins = { "dressing.nvim" } }
          return vim.ui.input(...)
        end
      end,
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = true,
    event = "VimEnter",
    config = function()
      -- config
      require "configs.dashboard"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    lazy = "VeryLazy",
    event = { "BufRead", "BufnewFile", "InsertEnter" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.lualine"
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "nvim-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufRead",
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    event = "BufRead",
    -- lazy = "VeryLazy",
    config = function()
      require "configs.split"
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    event = { "BufRead", "BufReadPre" },
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
    config = function()
      require "configs.coderunner"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = "VeryLazy",
    cmd = "ToggleTerm",
    -- event = "BufRead",
    config = function()
      require "configs.toggleterm"
    end,
  },
  {
    "folke/flash.nvim",
    enabled = true,
    lazy = true,
    vscode = true,
    event = "BufRead",
    opts = {},
        -- stylua: ignore
        keys =
        {
            { "A",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
           { "T",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
  },

  {
    "Exafunction/codeium.vim",
    enabled = true,
    event = { "InsertEnter" },
    commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
      vim.keymap.set({ "i", "n" }, "<C-h", function()
        return vim.fn["codeium#Chat"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-space>", function()
        return vim.fn["codeium#Complete"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "David-Kunz/gen.nvim",
    enabled = true,
    event = { "BufRead", "BufNewFile" },
    lazy = "VeryLazy",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>sm",
        ":lua require('gen').select_model()<CR>",
        { desc = "Select LLM Model", noremap = true, silent = true }
      )
    end,
  },
  {
    "folke/noice.nvim",
    enabled = true,
    lazy = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    -- event = { "BufRead", "BufnewFile", "BufReadPre" },
    opts = {
      messages = {
        enabled = false,
      },
      notify = {
        enabled = true,
      },
      lsp = {
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = false,
        },
      },
    },
  },
  {
    "seandewar/killersheep.nvim",
    event = "BufRead",
    config = function()
      require "configs.killersheep"
    end,
  },
  {
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-path", -- source for file system paths
        {
          "L3MON4D3/LuaSnip",
          build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        -- "onsails/lspkind.nvim", -- vs-code like pictograms
        "hrsh7th/cmp-cmdline",
      },
      config = function()
        require "configs.cmp"
      end,
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return require "configs.gitsigns"
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        move_cursor = true,
      }
    end,
  },
  {
    "willothy/nvim-cokeline",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for v0.4.0+
      "nvim-tree/nvim-web-devicons", -- If you want devicons
    },
    config = function()
      require "configs.cokeline"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.colorizer"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = { "BufRead", "BufNewFile" },
    lazy = true,
    config = function()
      require "configs.neoscroll"
    end,
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      aggressive_mode = true,
    },
  },
  {
    "p5quared/apple-music.nvim",
    lazy = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = true,
  },
}
