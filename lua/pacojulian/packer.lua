-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x', -- Use the 0.1.x branch for latest updates; or pin to a newer tag like '0.1.8' if preferred
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'romgrk/barbar.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons', -- Optional: for file icons
        },
        config = function()
            vim.g.barbar_auto_setup = false -- Disable auto-setup to customize
            require('barbar').setup {
                animation = false,          -- Disable animations for a static view
                tabpages = false,           -- Hide native tab page indicators
                clickable = true,           -- Allow clicking buffers to switch
            }
        end,
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make', -- Build step to compile the native sorter
        requires = { { 'nvim-telescope/telescope.nvim' } }
    }
    use { "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    }
    -- use({
    --   'rose-pine/neovim',
    -- as = 'rose-pine',
    -- config = function()
    --    vim.cmd('colorscheme rose-pine')
    --  end
    --})

    use({
        'AlexvZyl/nordic.nvim',
        config = function()
            -- Set up the Nordic theme
            require('nordic').setup({
                -- Optional: You can pass customization options here if needed
                comment_italic = true, -- Example: Set comments to be italic
                style = "dark",        -- Set the theme style (dark or light)
            })

            -- Apply the theme
            vim.cmd('colorscheme nordic')
        end,
    })


    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use { 'mhartington/formatter.nvim' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    }
    -- nvim v0.7.2
    use('terrortylor/nvim-comment')
    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use("folke/zen-mode.nvim")

    -- comments --
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    --  /
    --  use("github/copilot.vim")
end)
