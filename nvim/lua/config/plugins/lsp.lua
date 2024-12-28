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
    },
    config = function()
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").ts_ls.setup({})
    end,
  },
}
