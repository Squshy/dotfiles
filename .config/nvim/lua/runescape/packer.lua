-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({ 'rose-pine/neovim', as = 'rose-pine' })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')              -- AST
    use('nvim-treesitter/nvim-treesitter-context') -- Show curent fn

    use('mbbill/undotree')
    use('jose-elias-alvarez/null-ls.nvim')
    use('nvim-lua/plenary.nvim')
    use('tpope/vim-fugitive')
    use('theprimeagen/harpoon')
    use("theprimeagen/refactoring.nvim")

    -- Dadbod DB interactions
    use('tpope/vim-dadbod', {
        opt = true,
        requires = {
            { 'kristijanhusak/vim-dadbod-ui' },
            { 'kristijanhusak/vim-dadbod-completion' }
        },
        config = function()
            require('/after/plugin/dadbod').setup()
        end
    })

    use('kristijanhusak/vim-dadbod-ui')
    use('kristijanhusak/vim-dadbod-completion')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
