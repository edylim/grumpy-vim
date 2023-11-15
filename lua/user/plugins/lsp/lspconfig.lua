return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["html"].setup({ capabilities = capabilities })
    lspconfig["stylelint_lsp"].setup({ capabilities = capabilities })
    lspconfig["eslint"].setup({ capabilities = capabilities })
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      init_options = {
        preferences = {
          disableSuggestions = true, -- don't need to be harassed about my code
        },
      },
    })
    lspconfig["cssls"].setup({ capabilities = capabilities })
    lspconfig["tailwindcss"].setup({ capabilities = capabilities })
    lspconfig["svelte"].setup({ capabilities = capabilities })
    lspconfig["pyright"].setup({ capabilities = capabilities })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
