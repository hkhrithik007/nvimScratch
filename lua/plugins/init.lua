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
          "pyhton",
          "javascript",
          -- "java",
          -- "kotlin",
        },
      },
    },
  },
  --java tools
  {
    {
      "mfussenegger/nvim-jdtls",
      lazy = "VeryLazy",
      ft = "java",
    },
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
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require "configs.mason"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    ft = { ".java", "kt", "python" },
    lazy = true,
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      local PATH = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(PATH)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = { "java", "kotlin" },
    lazy = true,
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      require "configs.dapui"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    ft = { "java", "kotlin" },
    lazy = true,
    dependencies = {
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
      -- "onsails/lspkind.nvim",
      "Saghen/blink.cmp",
    },
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspStart" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    build = "cargo build --release", -- Uncomment this line
    lazy = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "mikavilpas/blink-ripgrep.nvim",
      {
        "saghen/blink.compat",
        main = "blink-compat",
        version = "*",
        opts = {
          impersonate_nvim_cmp = true,
          enable_events = true,
        },
      },
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load "friendly-snippets"
        end,
      },
    },
    config = function()
      require("configs.blink").setup()
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
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require "configs.nightfox"
    end,
  },
  {
    "Vallen217/eidolon.nvim",
    lazy = true,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme eidolon-midnight]]
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
    event = "VimEnter",
    config = function()
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
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    -- opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = false },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- picker = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    -- },
    config = function(_, opts)
      require("configs.snacks").setup(opts)
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
    },
  },

  -- {
  --   "Exafunction/windsurf.vim",
  --   enabled = true,
  --   event = { "InsertEnter" },
  --   config = function()
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-;>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-,>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-x>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set({ "i", "n" }, "<C-h", function()
  --       return vim.fn["codeium#Chat"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-space>", function()
  --       return vim.fn["codeium#Complete"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },
  --
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
    "Exafunction/windsurf.nvim",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      require("codeium").setup {
        enable_cmp_source = true,
        virtual_text = { enabled = false },
      }
    end,
  },
  {
    "folke/noice.nvim",
    enabled = true,
    event = "BufRead",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
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
      enabled = false,
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
    config = function()
      require "configs.gitsigns"
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
  -- {
  --   "karb94/neoscroll.nvim",
  --   event = { "BufRead", "BufNewFile" },
  --   lazy = true,
  --   config = function()
  --     require "configs.neoscroll"
  --   end,
  -- },
  {
    "ngtuonghy/live-server-nvim",
    enabled = true,
    lazy = "VeryLazy",
    event = { "BufRead", "BufNewFile" },
    fd = {
      "index.html",
      "index.php",
      "index.js",
      "index.ts",
      "index.html",
      "index.tsx",
      "index.jsx",
      "index.css",
      "index.scss",
    },
    build = ":LiveServerInstall",
    config = function()
      require("live-server-nvim").setup {}
    end,
  },
}
