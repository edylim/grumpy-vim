return {
  "rmagatti/auto-session",
  config = function()
    local as = require("auto-session")

    as.setup({
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
      auto_restore_enabled = false,
      auto_save_enabled = true,
    })
  end,
}
