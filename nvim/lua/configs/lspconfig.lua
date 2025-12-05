require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }

vim.lsp.config["roslyn"] = {}
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
      },
    },
  },
}

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if not base_on_attach then
      return
    end

    base_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})
-- vim.lsp.config["eslint"] = {
--   cmd = { "eslint_d", "--stdin", "--stdin-filename", "%f" },
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
--   settings = {
--     format = { enable = true }, -- this will enable formatting on eslint
--     packageManager = "yarn",
--   },
--   on_attach = function(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = true
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
--   root_dir = require("lspconfig").util.root_pattern(".eslintrc", ".eslintrc.js", "package.json", "eslintrc.json"),
-- }

vim.lsp.config["ts_ls"] = {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}

vim.lsp.enable(servers)
vim.lsp.enable "lua_la"
vim.lsp.enable "pyright"
vim.lsp.enable "ts_ls"
vim.lsp.enable "terraform_lsp"
vim.lsp.enable "powershell_es"
vim.lsp.enable "bashls"
vim.lsp.enable "gh_actions_ls"
vim.lsp.enable "yamlls"
vim.lsp.enable "eslint"
--
-- lspconfig.omnisharp.setup {}
-- lspconfig.lua_ls.setup {}
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}

-- read :h vim.lsp.config for changing options of lsp servers
