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

  vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", { noremap = true, })
  vim.api.nvim_set_keymap('n', 'gr', "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", { noremap = true, })
  vim.api.nvim_set_keymap('n', 'gi', "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", { noremap = true, })
  vim.api.nvim_set_keymap("n", "gs", "<cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>", { noremap = true, })
  vim.api.nvim_set_keymap("n", "gS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", { noremap = true, })
  vim.api.nvim_set_keymap("n", "<space>ca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", { noremap = true, })
  vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", { noremap = true, })
  vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>lua require('telescope.builtin').diagnostics({ bufnr = 0 })<CR>", { noremap = true, })
  vim.api.nvim_set_keymap("n", "<leader>cD", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", { noremap = true, })

end

return M
