vim.api.nvim_set_keymap('n', '<leader><s-p>',  [[<cmd>Files<CR>]], { noremap = true, })
vim.api.nvim_set_keymap('n', '<leader><s-f>',  [[:Ag<CR>]], { noremap = true, })

vim.api.nvim_set_keymap('n', '<leader>tt',     [[:NvimTreeToggle<CR>]], { noremap = true, })
vim.api.nvim_set_keymap('n', '<leader>tr',     [[:NvimTreeRefresh<CR>]], { noremap = true, })
