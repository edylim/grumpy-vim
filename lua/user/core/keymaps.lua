-- leader key
vim.g.mapleader = " "

local km = vim.keymap

-- shortcuts
km.set("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit Vim" })
km.set("n", "<leader>?", "<cmd>Telescope keymaps<CR>", { desc = "Show all keymappings" })
km.set("i", "jj", "<ESC>", { desc = "Home row <ESC> from insert mode" })

-- move selection
km.set("v", "J", "<plug>SchleppDown", { desc = "Move highlighted text down" })
km.set("v", "K", "<plug>SchleppUp", { desc = "Move highlighted text down" })
km.set("v", "H", "<plug>SchleppLeft", { desc = "Move highlighted text down" })
km.set("v", "L", "<plug>SchleppRight", { desc = "Move highlighted text down" })

-- windows
km.set("n", "<leader>w|", "<C-w>v", { desc = "Split window horizontally to the right" })
km.set("n", "<leader>w-", "<C-w>s", { desc = "Split window vertically below" })
km.set("n", "<leader>we", "<C-w>=", { desc = "Make windows equal by width or height" })
km.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Delete current window" })
km.set("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize window toggle" })
-- auto-session
km.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
km.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore previous session for CWD" })

-- tabs
km.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Create a new tab" })
km.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
km.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Move to next tab" })
km.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Move to previous tab" })
km.set("n", "<leader>ts", "<cmd>BufferLinePick<CR>", { desc = "Select tab by key" })

-- utility
km.set("n", "<leader>uh", "<cmd>nohl<CR>", { desc = "Remove highlights on page" })
km.set("n", "<leader>us", "<cmd>so<CR>", { desc = "Source current file" })
km.set("n", "<leader>ul", "<cmd>LspRestart<CR>", { desc = "Restart LSP server" })

-- project/files
km.set("n", "<leader><tab>", "<C-^>", { desc = "Toggle previous file" })
km.set("n", "<leader>pt", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle project file tree" })
km.set("n", "<leader>pp", "<cmd>Telescope projects<CR>", { desc = "Select project" })
km.set("n", "<leader>pc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse project file tree" })
km.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>", { desc = "Find file in project" })
km.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "List recent files" })
km.set("n", "<leader>pw", "<cmd>Telescope grep_string<CR>", { desc = "Search project for word under cursor" })
km.set("n", "<leader>pb", "<cmd>Telescope buffers<CR>", { desc = "Show current file buffers" })
km.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Search project for string" })

-- quick git
km.set("n", "<leader>gs", "<cmd>Git status<CR>", { desc = "Show git status" })
km.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Show git blame" })
km.set("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "Show git diff" })
-- full git
km.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open lazy git" })

-- harpoon
km.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon mark file" })
km.set(
  "n",
  "<leader>hs",
  "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
  { desc = "Harpoon show all marked files" }
)
km.set("n", "<leader>hl", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpooned file" })
km.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Go to previous harpooned file" })

-- lsp
km.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
km.set("n", "<leader>lg", vim.lsp.buf.declaration, { desc = "Go to declaration" })
km.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
km.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
km.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
km.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "See available code actions" })
km.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Smart rename" })
km.set("n", "<leader>le", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
km.set("n", "<leader>lh", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
km.set("n", "<leader>ll", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
km.set("n", "<leader>lD", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
