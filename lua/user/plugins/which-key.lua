return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  -- https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
  config = function()
    local wk = require("which-key")
    wk.setup({
      layout = {
        align = "center",
      },
      ignore_missing = true,
    })
    wk.register({
      ["<leader>"] = {
        ["<tab"] = { "Toggle previous file" },
        ["?"] = { "[?] Show all keymappings" },
        ["/"] = "[/] find string in project",
        q = { "[q]uit" },
        p = {
          name = "[p]roject",
          t = "toggle [t]ree",
          c = "[c]ollapse tree",
          f = "[f]ile",
          r = "[r]ecent file",
          w = "[w]ord under cursor search",
          b = "[b]uffer list",
        },
        w = {
          name = "[w]indow",
          ["|"] = "[|] split horizontally",
          ["-"] = "[-] split vertically",
          e = "[e]qualize all windows",
          d = "[d]elete",
          m = "toggle [m]aximize",
          s = "[s]ave session for CWD",
          r = "[r]estore session for CWD",
        },
        t = {
          name = "[t]ab",
          n = "[n]ew",
          d = "[d]elete",
          l = "[l] move to next tab",
          h = "[h] move to previous tab",
          s = "[s]elect tab by key",
        },
        u = {
          name = "[u]tility",
          h = "remove all [h]ighlights",
          s = "[s]ource current file",
          l = "restart [l]sp server",
        },
        g = {
          name = "[g]it actions",
          s = "git [s]tatus",
          b = "git [b]lame",
          d = "git [d]iff",
          g = "lazy [g]it",
        },
        h = {
          name = "[h]arpoon",
          a = "[a]dd mark to current file",
          s = "[s]how all marked files",
          l = "[l] go to next marked file",
          h = "[h] go to previous marked file",
        },
        l = {
          name = "[l]sp",
          r = "show lsp [r]eferences",
          g = "[g]o to declaration",
          d = "show lsp [d]efinition",
          i = "show lsp [i]mplementations",
          t = "show lsp [t]ype definitions",
          a = "[a]vailable code actions",
          R = "smart [R]ename",
          e = "show buffer [e]rrors",
          h = "go to previous error",
          l = "go to next error",
          D = "show [D]ocumentation for what is under cursor",
        },
      },
    })
  end,
}
