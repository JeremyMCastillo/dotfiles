require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local servers = { "html", "cssls" }

-- vim.lsp.config["omnisharp"] = {}
vim.lsp.config["tsserver"] = {}

vim.lsp.enable(servers)
vim.lsp.enable "lua_la"
vim.lsp.enable "omnisharp"
vim.lsp.enable "pyright"
vim.lsp.enable "ts_ls"
--
-- lspconfig.omnisharp.setup {}
-- lspconfig.lua_ls.setup {}
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}

-- read :h vim.lsp.config for changing options of lsp servers
