local M = {}

M.config = function ()
  require('lualine').setup {
    options = {
      theme = 'vscode',
    },
    tabline = {},
    sections = {
      lualine_a = {'mode'},
      lualine_b = {{ 'FugitiveHead', icon = '' }, 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    extensions = {'nvim-tree'}
  }
end

return M
