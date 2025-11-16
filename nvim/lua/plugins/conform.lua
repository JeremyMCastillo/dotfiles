return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>fm",
      function()
        require("conform").format { async = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "lua_ls", "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascriptreact = { "prettierd" },
      cs = { "csharpier" },
      sh = { "shfmt" },
      json = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      xml = { "prettierd", "prettier", stop_after_first = true },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      tfvars = { "terraform_fmt" },
      env = {},
      tsx = { "eslint_d", "prettierd" },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 10000, lsp_fallback = false },
    -- Customize formatters
    formatters = {
      shfmt = {
        append_args = { "-i", "2" },
      },
      xmlformat = {
        command = "xmlformat",
        args = { "--selfclose", "-" },
      },
      terraform_fmt = {
        command = "terraform",
        args = { "fmt", "-" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
