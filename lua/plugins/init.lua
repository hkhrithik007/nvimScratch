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
      "debugloop/telescope-undo.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
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
          "pyhton",
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
    "linrongbin16/lsp-progress.nvim",
    lazy = true,
    evenet = { "LspAttach", "BufRead" },
    config = function()
      require "configs.progress"
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
    "arkav/lualine-lsp-progress",
    event = "LspAttach",
    lazy = true,
    config = function()
      require "configs.progress"
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
      "onsails/lspkind.nvim",
      "Saghen/blink.cmp",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
    event = { "BufRead", "BufnewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "saghen/blink.cmp",
    lazy = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
      "mikavilpas/blink-ripgrep.nvim",
      "saghen/blink.compat",
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
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme eidolon-midnight]]
    end,
  },
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

  -- {
  --   "Exafunction/codeium.vim",
  --   enabled = false,
  --   event = { "InsertEnter" },
  --   commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
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
  {
    "Exafunction/codeium.nvim",
    event = { "InsertEnter" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "Saghen/blink.cmp",
    },
    config = function()
      require("codeium").setup {
        enable_cmp_source = true,
        virtual_text = {
          enabled = false,
        },
      }
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
  {
    "karb94/neoscroll.nvim",
    event = { "BufRead", "BufNewFile" },
    lazy = true,
    config = function()
      require "configs.neoscroll"
    end,
  },
  {
    "ngtuonghy/live-server-nvim",
    enabled = false,
    lazy = "VeryLazy",
    build = ":LiveServerInstall",
    config = function()
      require("live-server-nvim").setup {}
    end,
  },
}
