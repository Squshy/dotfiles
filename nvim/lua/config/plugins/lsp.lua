return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          -- rustaceavim says to install this manually cuz installing via
          -- mason may mess some things up? idk if true but for now I shall listen
          -- "rust_analyzer",
          "ts_ls",
          "pyright",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "stevearc/conform.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup({ capabilities = capabilities })
      require("lspconfig").ts_ls.setup({ capabilities = capabilities })
      require("lspconfig").pyright.setup({ capabilities = capabilities })

      vim.keymap.set("n", "<space>td", vim.lsp.buf.type_definition)
      vim.keymap.set("n", "<space>gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "<space>vrr", vim.lsp.buf.references)
      vim.keymap.set("n", "<space>vrn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<space>vca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<space>vd", vim.diagnostic.open_float)
    end,
  },
}
