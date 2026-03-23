return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    [1] = "telescope"
  },
  ---@diagnostic enable: missing-fields
  keys = {
    {
      "<leader>sc",
      function() require("fzf-lua").command_history() end,
      desc = "[S]earch [C]ommand History",
    },
    {
      "<leader>?",
      function() require("fzf-lua").oldfiles() end,
      desc = "[?] Find recently opened files",
    },
    {
      "<leader><space>",
      function() require("fzf-lua").buffers() end,
      desc = "[ ] Find existing buffers",
    },
    {
      "<leader>st",
      function() require("fzf-lua").builtin() end,
      desc = "[S]earch Select [T]elescope",
    },
    {
      "<leader>gf",
      function() require("fzf-lua").git_files() end,
      desc = "Search [G]it [F]iles",
    },
    {
      "<leader>sf",
      function() require("fzf-lua").files() end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sh",
      function() require("fzf-lua").help_tags() end,
      desc = "[S]earch [H]elp",
    },
    {
      "<leader>sw",
      function() require("fzf-lua").grep_cword() end,
      desc = "[S]earch current [W]ord",
    },
    {
      "<leader>sg",
      function() require("fzf-lua").live_grep() end,
      desc = "[S]earch by [G]rep",
    },
    {
      "<leader>sG",
      function() require("fzf-lua").live_grep({ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }) end,
      desc = "[S]earch by [G]rep on Git Root",
    },
    {
      "<leader>sd",
      function() require("fzf-lua").diagnostics_document() end,
      desc = "[S]earch [D]iagnostics",
    },
    {
      "<leader>sr",
      function() require("fzf-lua").resume() end,
      desc = "[S]earch [R]esume",
    },
    {
      "<leader>sk",
      function() require("fzf-lua").keymaps() end,
      desc = "[S]earch [K]eymaps",
    },
    {
      "<leader>s/",
      function() require("fzf-lua").live_grep({ grep_open_files = true }) end,
      desc = "[S]earch [/] in Open Files",
    },
  },

}
