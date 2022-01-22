local M = {}

M.config = function ()
  require'bufferline'.setup {
    options = {
      diagnostics = 'nvim_lsp',
      separator_style = "slant",
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          padding = 1,
          text_align = "left"
        }
      },
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
            or (e == "warning" and " " or "" )
          s = s .. n .. sym
        end
        return s
      end,
    }
  }
end

return M
