local wk = require "which-key"
---@diagnostic disable-next-line: unused-local
local telescope = require "telescope"

function _LAZYGIT_TOGGLE()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
  lazygit:toggle()
end
wk.add {
  {
    { "<leader>f", group = "file", icon = "" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n", icon = "󰈞" },
    {
      "<leader>fg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Find Text",
      mode = "n",
      icon = "󰺮",
    },
    {
      "<leader>fu",
      function()
        require("telescope").extensions.undo.undo()
      end,
      desc = "find undo history",
      mode = "n",
      icon = "",
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers",
      mode = "n",
      icon = "",
    },
    -- {
    --   "<leader>fp",
    --   function()
    --     require("apple-music").select_playlist_telescope()
    --   end,
    --   desc = "[F]ind [P]laylists",
    --   icon = "󰀶",
    -- },
    -- {
    --   "<leader>fa",
    --   function()
    --     require("apple-music").select_album_telescope()
    --   end,
    --   desc = "[F]ind [A]lbum",
    --   icon = "󰀶",
    -- },
    -- {
    --   "<leader>fs",
    --   function()
    --     require("apple-music").select_track_telescope()
    --   end,
    --   desc = "[F]ind [S]ong",
    --   icon = "󰀶",
    -- },
  },
  {
    { "<leader>g", group = "git" },
    { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit", mode = "n" },
    {
      "<leader>gj",
      function()
        require("gitsigns").next_hunk()
      end,
      desc = "Next Hunk",
      mode = "n",
      icon = "",
    },
    {
      "<leader>gk",
      function()
        require("gitsigns").prev_hunk()
      end,
      desc = "Prev Hunk",
      mode = "n",
      icon = "",
    },
    {
      "<leader>gl",
      function()
        require("gitsigns").blame_line()
      end,
      desc = "Blame",
      mode = "n",
      icon = "",
    },
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Hunk",
      mode = "n",
      icon = "",
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset Hunk",
      mode = "n",
      icon = "",
    },
    {
      "<leader>gR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Buffer",
      mode = "n",
      icon = "",
    },
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Stage Hunk",
      mode = "n",
      icon = "",
    },
    {
      "<leader>gu",
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Undo Stage Hunk",
      mode = "n",
      icon = "",
    },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", mode = "n", icon = "" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", mode = "n", icon = "" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", mode = "n", icon = "" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", mode = "n", icon = "" },
  },
  {
    { "<leader>l", group = "Lsp", icon = "" },
    {
      "<leader>la",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
      mode = "n",
    },
    {
      "<leader>lL",
      function()
        require("lint").try_lint()
      end,
      desc = "Trigger linting for current file",
      mode = "n",
    },
    { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", mode = "n" },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", mode = "n" },
    {
      "<leader>lf",
      function()
        vim.lsp.buf.format { async = true }
      end,
      desc = "Format",
      mode = "n",
      icon = "󰉠",
    },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", mode = "n", icon = "" },
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Installer Info", mode = "n", icon = "" },
    {
      "<leader>lj",
      function()
        vim.diagnostic.goto_next()
      end,
      desc = "Next Diagnostic",
      mode = "n",
    },
    {
      "<leader>lk",
      function()
        vim.diagnostic.goto_prev()
      end,
      desc = "Prev Diagnostic",
      mode = "n",
    },
    {
      "<leader>ll",
      function()
        vim.lsp.codelens.run()
      end,
      desc = "CodeLens Action",
      mode = "n",
      icon = "",
    },
    {
      "<leader>lq",
      function()
        vim.diagnostic.setloclist()
      end,
      desc = "Quickfix",
      mode = "n",
    },
    {
      "<leader>lr",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename",
      mode = "n",
      icon = "󰑕",
    },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", mode = "n" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", mode = "n" },
  },
  {
    { "<leader>S", group = "search", icon = "󱙓" },
    { "<leader>Sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", mode = "n", icon = "" },
    { "<leader>Sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", mode = "n" },
    { "<leader>Sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", mode = "n" },
    { "<leader>SR", "<cmd>Telescope registers<cr>", desc = "Registers", mode = "n" },
    { "<leader>Sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", mode = "n" },
    { "<leader>SC", "<cmd>Telescope commands<cr>", desc = "Commands", mode = "n" },
  },
  {
    { "<leader>t", group = "terminal" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "n" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Float Terminal", mode = "n" },
    {
      "<leader>tv",
      "<cmd>ToggleTerm size=80 direction=vertical<cr>",
      desc = "Toggle Vertical Terminal",
      mode = "n",
    },
  },

  {
    { "<leader>p", group = "lazy", icon = "" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install", mode = "n", icon = "" },
    { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync", mode = "n", icon = "" },
    { "<leader>pS", "<cmd>Lazy clear<cr>", desc = "Status", mode = "n", icon = "󱖫" },
    { "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean", mode = "n", icon = "󰿞" },
    { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update", mode = "n", icon = "󰚰" },
    { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile", mode = "n", icon = "󰙄" },
    { "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log", mode = "n", icon = "󱂅" },
    { "<leader>pd", "<cmd>Lazy debug<cr>", desc = "Debug", mode = "n", icon = "" },
  },

  {
    { "<leader>d", group = "debug", icon = "" },
    {
      "<leader>dt",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
      mode = "n",
      icon = "",
    },
    {
      "<leader>db",
      function()
        require("dap").step_back()
      end,
      desc = "Step Back",
      mode = "n",
      icon = "",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
      mode = "n",
      icon = "",
    },
    {
      "<leader>dC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run To Cursor",
      mode = "n",
      icon = "",
    },
    {
      "<leader>dd",
      function()
        require("dap").disconnect()
      end,
      desc = "Disconnect",
      mode = "n",
      icon = "",
    },
    {
      "<leader>dg",
      function()
        require("dap").session()
      end,
      desc = "Get Session",
      mode = "n",
      icon = "",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
      mode = "n",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
      mode = "n",
      icon = "",
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
      mode = "n",
      icon = "",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause()
      end,
      desc = "Pause",
      mode = "n",
      icon = "󰏤",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle Repl",
      mode = "n",
      icon = "",
    },
    {
      "<leader>ds",
      function()
        require("dap").continue()
      end,
      desc = "Start",
      mode = "n",
      icon = "",
    },
    {
      "<leader>dq",
      function()
        require("dap").close()
      end,
      desc = "Quit",
      mode = "n",
      icon = "󰅛",
    },
    {
      "<leader>dU",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle UI",
      mode = "n",
      icon = "",
    },
  },

  {
    { "<leader>r", group = "run", icon = "" },
    {
      "<leader>rs",
      '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss silent exec "!sass %:p %:r.css"<CR>',
      desc = "Auto Compile Sass",
      mode = "n",
    },
    { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code", mode = "n", icon = "" },
    { "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File", mode = "n", icon = "" },
    { "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project", mode = "n", icon = "" },
    {
      "<leader>rg",
      "<cmd>ToggleTerm size=70 direction=float<cr>clear<cr>gradle run<cr>",
      desc = "Run Gradle",
      mode = "n",
      icon = "",
    },
    {
      "<leader>rm",
      "<cmd>ToggleTerm size=70 direction=float<cr>clear<cr>mvn clean package<cr>",
      desc = "Run Maven",
      mode = "n",
      icon = "",
    },
  },
  {
    {
      { "<leader>s", group = "Split buffer", icon = "󱓝" }, -- group for evil resizing
      {
        "<leader>ss",
        require("smart-splits").swap_buf_left,
        desc = "buffer Swap Buffer Left",
        mode = "n",
        icon = "󱐪",
      },
      { "<leader>sv", "<cmd>vsplit<cr>", desc = "buffer Vertical Split", mode = "n", icon = "" },
      { "<leader>sh", "<cmd>split<cr>", desc = "buffer Horizontal Split", mode = "n", icon = "" },
    },
  },
  {
    { "<leader>L", group = "LSP Extra", icon = "" }, -- group for LSP commands

    { "<leader>LR", "<cmd>Telescope lsp_references<CR>", desc = "Show LSP references", mode = "n", icon = "" },
    { "<leader>LD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n", icon = "󱂢" },
    { "<leader>Ld", "<cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions", mode = "n", icon = "" },
    {
      "<leader>Li",
      "<cmd>Telescope lsp_implementations<CR>",
      desc = "Show LSP implementations",
      mode = "n",
      icon = "󰙳",
    },
    {
      "<leader>Lt",
      "<cmd>Telescope lsp_type_definitions<CR>",
      desc = "Show LSP type definitions",
      mode = "n",
      icon = "󰙳",
    },
  },
  -- {
  --   { "<leader>a", group = "Apple-music", icon = "" },
  --
  --   {
  --     "<leader>ap",
  --     function()
  --       require("apple-music").toggle_play()
  --     end,
  --     desc = "Toggle [P]layback",
  --   },
  --   {
  --     "<leader>as",
  --     function()
  --       require("apple-music").toggle_shuffle()
  --     end,
  --     desc = "Toggle [S]huffle",
  --   },
  --
  --   {
  --     "<leader>ax",
  --     function()
  --       require("apple-music").cleanup_all()
  --     end,
  --     desc = "Cleanup Temp Playlists",
  --   },
  -- },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>k", "<cmd>KillKillKill<cr>", desc = "Killersheep", mode = "n", icon = "󰳆" },
    { "<leader>q", "<cmd>q!<cr>", desc = "Quit", icon = "󰈆" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w!<cr>", desc = "Write", icon = "󱣪" },
    { "<leader>e", "<cmd>:NvimTreeToggle<cr>", desc = "NvimTree Focus", icon = "" },
    { "<leader>x", "<cmd>bw<cr>", desc = "buffer close", icon = "󰱞", mode = "n" },
  },
}
