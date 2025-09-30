local set_lazy_key = require("builtin.utils.keymap").set_lazy_key

local M = {
  set_lazy_key("n", "<leader>cp", ":Copilot panel ", { silent = false, desc = "Open Copilot panel" }),
}

return M

