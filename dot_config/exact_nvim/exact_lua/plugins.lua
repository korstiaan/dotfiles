require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    use {
      'tomasiser/vim-code-dark',
      config = function ()
        vim.cmd('colorscheme codedark')
      end
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function () require'plugins.lualine-config'.config() end
    }

    use 'tpope/vim-fugitive'

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require'nvim-tree'.setup {
          view = {
            width = 40,
            auto_resize = true
          },
          open_on_setup = true,
          open_on_tab = true,
          hijack_cursor = true,
          update_focused_file = {
            enable = true,
            update_cwd = false,
          }
        }
      end
    }

    use 'ryanoasis/vim-devicons'
    use 'bronson/vim-trailing-whitespace'

    use {
      'junegunn/rainbow_parentheses.vim',
      config = function ()
        vim.cmd('autocmd VimEnter * RainbowParentheses')
      end
    }

    use {
      'junegunn/fzf.vim',
      config = function ()
        vim.fn.setenv("FZF_DEFAULT_COMMAND", 'rg --files --hidden -g "!.git"')
      end
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
      config = function () require 'plugins.treesitter-config'.config() end
    }

    use {
      'hrsh7th/nvim-cmp',
      requires= {
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
      },
      config = function () require'plugins.nvim-cmp'.config() end
    }

    use {
      'neovim/nvim-lspconfig',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
      },
      config = function () require'plugins.lsp-config'.config() end
    }
  end,
  config = {
    display = {
      open_fn = require('packer.util').float
    }
  }
})
