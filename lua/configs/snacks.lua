local M = {}

function M.setup()
  local snacks = require "snacks"

  snacks.setup {
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "fish -c '/Users/hkhrithik/.config/color-scripts/color-scripts/square'",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        unpack((function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Notifications",
              cmd = "fish -c 'gh notify -s -a -n5'",
              action = function()
                vim.ui.open "https://github.com/notifications"
              end,
              key = "n",
              icon = " ",
              height = 5,
              enabled = true,
            },
            {
              title = "Open Issues",
              cmd = "fish -c 'gh issue list -L 3'",
              key = "i",
              action = function()
                vim.fn.jobstart({ "fish", "-c", "gh issue list --web" }, { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "fish -c 'gh pr list -L 3'",
              key = "P",
              action = function()
                vim.fn.jobstart({ "fish", "-c", "gh pr list --web" }, { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "fish -c 'git --no-pager diff --stat -B -M -C'",
              height = 10,
            },
          }

          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end)()),
        { section = "startup" },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  }
end

return M
