return {
  {
    "williamboman/mason.nvim",
    config = function()
      require "mason".setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "mason-lspconfig".setup {
        ensure_installed = {
          "lua_ls",
          -- rustaceavim says to install this manually cuz installing via
          -- mason may mess some things up? idk if true but for now I shall listen
          -- "rust_analyzer",
          "ts_ls",
        }
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "lspconfig".lua_ls.setup {}
      require "lspconfig".ts_ls.setup {}
      -- require "lspconfig".rust_analyzer.setup {}

      -- Format file manually
      vim.keymap.set("n", "<space>f", ":lua vim.lsp.buf.format()<CR>")

      -- Format file on save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client:supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  }
}
