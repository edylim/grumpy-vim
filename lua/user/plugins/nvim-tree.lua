return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#444444 ]])

    nvimtree.setup({
      -- following 3 options for updating tree to CWD (project.nvim)
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },

      view = {
        width = 40,
        relativenumber = true,
      },
      filters = {
        custom = {
          ".DS_Store",
          "Brewfile.lock.json",
          "lazy-lock.json",
        },
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              --   󰜮 󰜴
              arrow_closed = "󰜴",
              arrow_open = "󰜮",
            },
          },
        },
      },
      git = {
        ignore = false,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    })
  end,
}
