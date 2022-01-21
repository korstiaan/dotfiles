local M = {}

M.config = function ()
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }

  require('telescope').load_extension('fzf')

  vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true, })
  vim.api.nvim_set_keymap('n', '<leader>fF', "<cmd>lua require('telescope.builtin').git_files()<cr>", { noremap = true, })
  vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true, })
end

return M
