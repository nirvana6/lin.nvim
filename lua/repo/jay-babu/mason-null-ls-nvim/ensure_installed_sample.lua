-- Ensure installed null-ls sources.
-- This module will be passed to `require("mason-null-ls").setup({ ensure_installed = ... })`.
--
-- For full null-ls sources list, please refer to:
--      * [null-ls BUILTINS](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md) and install them from mason.

local ensure_installed = {
    "black", -- python formatter
    "isort",
    "markdownlint", -- markdown lint
    "stylua", -- lua formatter
    "vint", -- vim lint
}

return ensure_installed