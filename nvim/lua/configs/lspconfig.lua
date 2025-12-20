require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }

-- Dotnet
-- vim.lsp.config["roslyn"] = {
--   on_attach = function(client, bufnr)
--     vim.lsp.codelens.refresh { bufnr = bufnr }
--   end,
--   filetypes = { "cs", "razor", "cshtml" },
--   settings = {
--     ["csharp|background_analysis"] = {
--       dotnet_analyzer_diagnostics_scope = "fullSolution",
--       dotnet_compiler_diagnostics_scope = "fullSolution",
--     },
--     ["csharp|code_lens"] = {
--       dotnet_enable_references_code_lens = true,
--       dotnet_enable_tests_code_lens = true,
--     },
--     ["csharp|completion"] = {
--       dotnet_show_completion_items_from_unimported_namespaces = true,
--       dotnet_show_name_completion_suggestions = true,
--     },
--   },
-- }

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
-- vim.lsp.enable "roslyn"

-- read :h vim.lsp.config for changing options of lsp servers
