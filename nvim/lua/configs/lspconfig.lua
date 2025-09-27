require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "pyright", "tsserver", "lua_ls" }
vim.lsp.enable(servers)

for _, server in ipairs(servers) do
  if lspconfig[server] then
    lspconfig[server].setup {
      on_attach = function (client, bufnr)
        if client.name == "tsserver" or client.name == "typescript" then
          client.server_capabilities.documentFormattingProvider = false
        end
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
    }
  end
end

-- read :h vim.lsp.config for changing options of lsp servers 
