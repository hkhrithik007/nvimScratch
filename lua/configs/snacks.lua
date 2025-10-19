local M = {}

function M.setup()
  local snacks = require "snacks"

  snacks.setup {
    dashboard = {
      enabled = true,
      sections = {
        { section = "header", gap = 1 },
        {
          pane = 2,
          section = "terminal",
          cmd = "fish -c '/Users/hkhrithik/.config/color-scripts/color-scripts/square'",
          height = 5,
          padding = 1,
          gap = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1, gap = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1, gap = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
          gap = 1,
        },
        { section = "startup", gap = 1 },
      },
    },

    notification_history = {
      border = "rounded",
      zindex = 100,
      width = 0.6,
      height = 0.6,
      minimal = false,
      title = " Notification History ",
      title_pos = "center",
      ft = "markdown",
      bo = { filetype = "snacks_notif_history", modifiable = false },
      wo = { winhighlight = "Normal:SnacksNotifierHistory" },
      keys = { q = "close" },
    },

    lazygit = {
      {
        configure = true,
        config = {
          os = { editPreset = "nvim-remote" },
          gui = { nerdFontsVersion = "3" },
        },
        theme_path = vim.fs.normalize(vim.fn.stdpath "cache" .. "/lazygit-theme.yml"),
        theme = {
          [241] = { fg = "Special" },
          activeBorderColor = { fg = "MatchParen", bold = true },
          cherryPickedCommitBgColor = { fg = "Identifier" },
          cherryPickedCommitFgColor = { fg = "Function" },
          defaultFgColor = { fg = "Normal" },
          inactiveBorderColor = { fg = "FloatBorder" },
          optionsTextColor = { fg = "Function" },
          searchingActiveBorderColor = { fg = "MatchParen", bold = true },
          selectedLineBgColor = { bg = "Visual" },
          unstagedChangesColor = { fg = "DiagnosticError" },
        },
        win = { style = "lazygit" },
      },
    },

    terminal = {
      {
        bo = { filetype = "snacks_terminal" },
        wo = {},
        keys = {
          q = "hide",
          gf = function(self)
            local f = vim.fn.findfile(vim.fn.expand "<cfile>", "**")
            if f == "" then
              Snacks.notify.warn "No file under cursor"
            else
              self:hide()
              vim.schedule(function()
                vim.cmd("e " .. f)
              end)
            end
          end,
          term_normal = {
            "<esc>",
            function(self)
              self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
              if self.esc_timer:is_active() then
                self.esc_timer:stop()
                vim.cmd "stopinsert"
              else
                self.esc_timer:start(200, 0, function() end)
                return "<esc>"
              end
            end,
            mode = "t",
            expr = true,
            desc = "Double escape to normal mode",
          },
        },
      },
    },

    scroll = {
      animate = {
        duration = { step = 15, total = 250 },
        easing = "linear",
      },
      animate_repeat = {
        delay = 100,
        duration = { step = 5, total = 50 },
        easing = "linear",
      },
      filter = function(buf)
        return vim.g.snacks_scroll ~= false
          and vim.b[buf].snacks_scroll ~= false
          and vim.bo[buf].buftype ~= "terminal"
      end,
    },

    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  }
end

return M
