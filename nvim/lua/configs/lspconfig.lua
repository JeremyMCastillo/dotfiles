require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }

-- vim.lsp.config["omnisharp"] = {}
vim.lsp.config["tsserver"] = {}
vim.lsp.config["gh_actions_ls"] = {}
vim.lsp.config["terraform_lsp"] = {
  filetypes = { "tf", "terraform", "tfvars" },
}
vim.lsp.config["powershell_es"] = {
  filetypes = { "ps1", "psm1", "psd1", "pwsh" },
  bundle_path = "c:/Program Files/PowerShellEditorServices",
}
vim.lsp.config["bashls"] = {
  filetypes = { "sh", "zsh" },
}
vim.lsp.config["yamlls"] = {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        ["/path/from/root/of/project"] = "/.github/workflows/*",
      },
    },
  },
}

vim.lsp.enable(servers)
vim.lsp.enable "lua_la"
vim.lsp.enable "omnisharp"
vim.lsp.enable "pyright"
vim.lsp.enable "ts_ls"
vim.lsp.enable "terraform_lsp"
vim.lsp.enable "powershell_es"
vim.lsp.enable "bashls"
vim.lsp.enable "gh_actions_ls"
vim.lsp.enable "yamlls"
--
-- lspconfig.omnisharp.setup {}
-- lspconfig.lua_ls.setup {}
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}

-- read :h vim.lsp.config for changing options of lsp servers
