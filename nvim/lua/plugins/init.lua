return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "c_sharp",
        "razor",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup {
        ui = {
          border = "rounded",
        },
        automatic_installation = true,
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
        ensure_installed = {
          "black",
          "pylint",
          "html-lsp",
          "css-lsp",
          "lua-language-server",
          "pyright",
          "tsserver",
          "terraform-lsp",
          "powershell-editor-services",
          "csharpier",
          "roslyn",
          "rzls",
        },
      }
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      automatic_installation = true,
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
      }
    end,
  },
  {
    "nvimtools/none-ls-extras.nvim",
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.eslint,
          null_ls.builtins.formatting.csharpier,
          null_ls.builtins.formatting.markdownlint,
          null_ls.builtins.formatting.tsserver,
          require "none-ls.diagnostics.eslint",
        },
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup {
        -- configuration options here
      }
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  {
    "voldikss/vim-floaterm",
    lazy = false,
    config = function()
      vim.g.floaterm_keymap_toggle = "<leader>t"
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
      vim.g.floaterm_wintype = "float"
      vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
    end,
  },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup {
        enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be clear_scheduled_display
          "NormalFloat",
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "TelescopeResultsBorder",
          "TelescopePreviewBorder",
          "WhichKeyFloat",
          "WhichKeyBorder",
        },
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {},
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  {
    "seblyng/roslyn.nvim",
    event = "VeryLazy",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    ft = { "cs", "razor" },
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    ft = { "html", "razor", "cshtml", "xml", "jsx", "tsx" },
  },
}
