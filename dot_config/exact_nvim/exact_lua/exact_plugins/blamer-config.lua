local M = {}

M.config = function ()
  vim.g.blamer_enabled = 1
  vim.g.blamer_delay = 200
  vim.g.blamer_relative_time = true

  vim.cmd([[
    highlight link Blamer NonText
  ]])
end

return M
