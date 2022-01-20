require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    use 'tomasiser/vim-code-dark'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function ()
        require('plugins/lualine-config')
      end
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
      config = function ()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = 'all',
          highlight = { enable = true },
          incremental_selection = { enable = true },
          textobjects = { enable = true },
        }
      end
    }

    use {
      'neovim/nvim-lspconfig',
      config = function ()
        local pid = vim.fn.getpid()
        local lspconfig = require('lspconfig')

        lspconfig.tsserver.setup {}
        lspconfig.html.setup {}
        lspconfig.solargraph.setup {}
        lspconfig.pyright.setup {}
        lspconfig.sumneko_lua.setup {}
        lspconfig.omnisharp.setup {
            cmd = { vim.loop.os_homedir() .. "/.local/share/omnisharp/run", "-lsp" , "--hostPID", tostring(pid) };
            on_exit = function(_code, _signal, _client_id)
              -- omnisharp and/or mono servers don't always get killed, make them anyway
              os.execute('pkill -f "hostPID ' .. tostring(pid) .. '"')
            end
        }

      end
    }

  end,
  config = {
    display = {
      open_fn = require('packer.util').float
    }
  }
})
