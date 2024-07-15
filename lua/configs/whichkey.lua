local wk = require "which-key"
local telescope = require "telescope"

function _LAZYGIT_TOGGLE()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
  lazygit:toggle()
end
wk.add {
  {
    { "<leader>f", group = "file" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    {
      "<leader>fg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Find Text",
      mode = "n",
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers",
      mode = "n",
    },
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
    },
    {
      "<leader>gk",
      function()
        require("gitsigns").prev_hunk()
      end,
      desc = "Prev Hunk",
      mode = "n",
    },
    {
      "<leader>gl",
      function()
        require("gitsigns").blame_line()
      end,
      desc = "Blame",
      mode = "n",
    },
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Hunk",
      mode = "n",
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset Hunk",
      mode = "n",
    },
    {
      "<leader>gR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Buffer",
      mode = "n",
    },
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Stage Hunk",
      mode = "n",
    },
    {
      "<leader>gu",
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Undo Stage Hunk",
      mode = "n",
    },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", mode = "n" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", mode = "n" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", mode = "n" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", mode = "n" },
  },
  {
    { "<leader>l", group = "Lsp" },
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
    },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", mode = "n" },
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Installer Info", mode = "n" },
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
    },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", mode = "n" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", mode = "n" },
  },
  {
    { "<leader>s", group = "search" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", mode = "n" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", mode = "n" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", mode = "n" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", mode = "n" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", mode = "n" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", mode = "n" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", mode = "n" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", mode = "n" },
  },
  {
    { "<leader>t", group = "terminal" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "n" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Float Terminal", mode = "n" },
    {
      "<leader>th",
      "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
      desc = "Toggle Horizontal Terminal",
      mode = "n",
    },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle Vertical Terminal", mode = "n" },
  },

  {
    { "<leader>p", group = "lazy" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install", mode = "n" },
    { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync", mode = "n" },
    { "<leader>pS", "<cmd>Lazy clear<cr>", desc = "Status", mode = "n" },
    { "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean", mode = "n" },
    { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update", mode = "n" },
    { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile", mode = "n" },
    { "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log", mode = "n" },
    { "<leader>pd", "<cmd>Lazy debug<cr>", desc = "Debug", mode = "n" },
  },

  {
    { "<leader>d", group = "debug" },
    {
      "<leader>dt",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
      mode = "n",
    },
    {
      "<leader>db",
      function()
        require("dap").step_back()
      end,
      desc = "Step Back",
      mode = "n",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
      mode = "n",
    },
    {
      "<leader>dC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run To Cursor",
      mode = "n",
    },
    {
      "<leader>dd",
      function()
        require("dap").disconnect()
      end,
      desc = "Disconnect",
      mode = "n",
    },
    {
      "<leader>dg",
      function()
        require("dap").session()
      end,
      desc = "Get Session",
      mode = "n",
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
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
      mode = "n",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause()
      end,
      desc = "Pause",
      mode = "n",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle Repl",
      mode = "n",
    },
    {
      "<leader>ds",
      function()
        require("dap").continue()
      end,
      desc = "Start",
      mode = "n",
    },
    {
      "<leader>dq",
      function()
        require("dap").close()
      end,
      desc = "Quit",
      mode = "n",
    },
    {
      "<leader>dU",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle UI",
      mode = "n",
    },
  },

  {
    { "<leader>r", group = "run" },
    {
      "<leader>rs",
      '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss silent exec "!sass %:p %:r.css"<CR>',
      desc = "Auto Compile Sass",
      mode = "n",
    },
    { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code", mode = "n" },
    { "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File", mode = "n" },
    { "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project", mode = "n" },
    {
      "<leader>rg",
      "<cmd>ToggleTerm size=70 direction=float<cr>clear<cr>gradle run<cr>",
      desc = "Run Gradle",
      mode = "n",
    },
    {
      "<leader>rm",
      "<cmd>ToggleTerm size=70 direction=float<cr>clear<cr>mvn clean package<cr>",
      desc = "Run Maven",
      mode = "n",
    },
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>k", "<cmd>KillKillKill<cr>", desc = "Killersheep", mode = "n" },
    { "<leader>q", "<cmd>q!<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w!<cr>", desc = "Write" },
  },
}
