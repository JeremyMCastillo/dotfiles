return {
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>cvl", "<cmd>CoverageLoad<cr>",    desc = "Coverage Load" },
      { "<leader>cvt", "<cmd>CoverageToggle<cr>",  desc = "Coverage Toggle" },
      { "<leader>cvs", "<cmd>CoverageSummary<cr>", desc = "Coverage Summary" },
    },
    config = function()
      require("coverage").setup {
        auto_reload = true,
        lang = {
          dotnet = {
            coverage_file = "coverage/coverage.cobertura.xml",
          },
        },
        signs = {
          covered   = { hl = "CoverageCovered",   text = "▎" },
          uncovered = { hl = "CoverageUncovered",  text = "▎" },
          partial   = { hl = "CoveragePartial",    text = "▎" },
        },
      }
    end,
  },
}
