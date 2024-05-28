local lazy = require("lazy")
return {
  {
    "folke/which-key.nvim",
    -- lazy = "VeryLazy",
    event = "BufRead",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("configs.whichkey")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "BufRead",
    config = function()
      require("configs.nvimtree")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.telescope")
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
  {
    "williamboman/mason.nvim",
    event = "BufRead",
    config = function()
      require "configs.mason"
    end,
    opts = {
      ensure_installed = {
        "lua-language-server",
        "kotlin-language-server",
        "jdtls",
        -- "html-lsp",
        -- "css-lsp",
        -- "prettier",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufRead",
    config = function()
      require "configs.mason-lspconfig"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = "VeryLazy",
    event = "BufRead",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("configs.dapui")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = "VeryLazy",
    event = "BufRead",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require("configs.mason_dap")
    end,
  },
  {
    "jayp0521/mason-null-ls.nvim",
    lazy = "VeryLazy",
    enabled = true,
    dependencies = {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "nvimtools/none-ls-extras.nvim",
        lazy = true,
        event = { "BufRead" },
      },
      config = function()
        require("configs.null_ls")
      end,
    },
    event = { "InsertEnter", "BufRead", "BufnewFile" },
    opts = function()
      require("configs.mason_null_ls")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "windwp/nvim-autopairs",
      "williamboman/mason.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufRead", "BufnewFile" },
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup()
    end,
  },
  {

    {
      "stevearc/dressing.nvim",
      lazy = true,
      event = { "BufRead", "BufnewFile" },
      init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui.select(...)
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.input = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui.input(...)
        end
      end,
    },
  },
  {
    "max397574/better-escape.nvim",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("configs.better-escape")
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = true,
    event = "VimEnter",
    config = function()
      -- config
      require("configs.dashboard")
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
      require("configs.lualine")
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
    "mrjones2014/smart-splits.nvim",
    event = "BufRead",
    -- lazy = "VeryLazy",
    config = function()
      require("configs.split")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    -- lazy = false,
    -- event = "BufReadPre",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("configs.bufferline")
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    event = { "BufRead", "BufReadPre" },
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
    config = function()
      require("configs.coderunner")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    event = "BufRead",
    config = function()
      require("configs.toggleterm")
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "Exafunction/codeium.vim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    -- event = "BufEnter",
    event = { "InsertEnter" },
    -- config = function()
    -- require("codeium").setup()
    -- end,

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
        ":lua require('gen').select_model()<cr>",
        { noremap = true, silent = true }
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
    event = { "BufRead", "BufnewFile", "BufReadPre" },
    opts = {
      presets = { "inc_rename" },
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
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<S-Enter>",
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end,
        mode = "c",
        desc = "Redirect Cmdline",
      },
      {
        "<leader>snl",
        function()
          require("noice").cmd("last")
        end,
        desc = "Noice Last Message",
      },
      {
        "<leader>snh",
        function()
          require("noice").cmd("history")
        end,
        desc = "Noice History",
      },
      {
        "<leader>sna",
        function()
          require("noice").cmd("all")
        end,
        desc = "Noice All",
      },
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
        mode = { "i", "n", "s" },
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
        mode = { "i", "n", "s" },
      },
    },
  },
  {
    "seandewar/killersheep.nvim",
    event = "BufRead",
    config = function()
      require("configs.killersheep")
    end,
  },
  {
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path",   -- source for file system paths
        {
          "L3MON4D3/LuaSnip",
          -- follow latest release.
          version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
          -- install jsregexp (optional!).
          build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim",         -- vs-code like pictograms
        "hrsh7th/cmp-cmdline",
      },
      config = function()
        require("configs.cmp")
      end,
    },
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require "nvim-autopairs".setup {}
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "mfussenegger/nvim-jdtls",
    event = { "BufReadPre", "BufNewFile" },
  },
}