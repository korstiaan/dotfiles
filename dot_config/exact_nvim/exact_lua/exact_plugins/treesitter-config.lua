local M = {}

M.config = function ()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = false,
      max_file_lines = nil
    }
  }
end

return M
