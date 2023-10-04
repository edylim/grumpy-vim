return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local gruvbox = require("lualine.themes.gruvbox_dark")

    -- get project name
    local function project()
      local cur_path = vim.fn.expand("%:p")
      local home = vim.fs.find(".git", {
        path = cur_path,
        upward = true,
        type = "directory",
      })[1]

      if home == nil then
        return ""
      end

      return vim.fs.dirname(home):match("([^/]+)$")
    end

    lualine.setup({
      options = {
        theme = gruvbox, -- can customize, see below
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_c = {
          { "filename" },
          { "searchcount" },
        },
        lualine_b = {
          {
            project,
            color = { fg = "#fe8019" },
          },
          "branch",
          "diff",
          "diagnostics",
        },
      },
      inactive_sections = {
        lualine_a = { "mode" },
      },
    })

    -- For custom colors, create dictionary of colors for each mode, e.g.:
    --
    -- local my_custom_gruv = {
    --   normal = {
    --     a = { bg = "#147afd", fg = "#fdfdfd", gui = "bold" },
    --     b = { /* other colors */ },
    --     c = { /* other colors */ },
    --   },
    --   insert = { /* a, b, c */ }, visual = {}, command = {}, replace = {}, inactive = {}...
    -- }
    --
    -- then set in options:
    --
    -- options = {
    --   theme = my_custom_gruv,
    -- },
    --
  end,
}
