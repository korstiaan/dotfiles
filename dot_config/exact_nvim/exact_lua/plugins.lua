require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    use 'tomasiser/vim-code-dark'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-fugitive'

    use 'preservim/nerdtree'

    use 'ryanoasis/vim-devicons'

    use 'junegunn/rainbow_parentheses.vim'

    use 'junegunn/fzf.vim'

  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
