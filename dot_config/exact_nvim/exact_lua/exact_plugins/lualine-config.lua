require('lualine').setup {
  options = {
    theme = 'codedark',
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        buffers_color = {
          active = 'lualine_a_insert',
          inactive = 'lualine_a_inactive',
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{ 'FugitiveHead', icon = '' }, 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {}
}
