local M = {}

M.config = function ()
  require'bufferline'.setup {
    options = {
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          padding = 0,
          text_align = "left"
        }
      },
      show_tab_indicators = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
            or (e == "warning" and " " or "" )
          s = s .. n .. sym
        end
        return s
      end,
    },
    highlights = {
      fill = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "StatusLineNC" },
      },
      background = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "StatusLine"}
      },
      buffer_visible = {
        gui = "",
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" }
      },
      buffer_selected = {
        gui = "",
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" }
      },
      separator = {
        guifg = { attribute = "bg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "StatusLine" },
      },
      separator_selected = {
        guifg = { attribute = "fg", highlight = "Special" },
        guibg = { attribute = "bg", highlight = "Normal" }
      },
      separator_visible = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "StatusLineNC" },
      },
      close_button = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "StatusLine" }
      },
      close_button_selected = {
        guifg = { attribute = "fg", highlight = "normal" },
        guibg = { attribute = "bg", highlight = "normal" }
      },
      close_button_visible = {
        guifg = { attribute = "fg", highlight = "normal" },
        guibg = { attribute = "bg", highlight = "normal" }
      },

    }
  }
end

return M
