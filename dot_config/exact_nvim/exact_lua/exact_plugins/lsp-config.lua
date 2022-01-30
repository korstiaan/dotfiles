local M = {}

M.config = function ()
  local pid = vim.fn.getpid()
  local lspconfig = require('lspconfig')

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  lspconfig.tsserver.setup{ capabilities = capabilities, on_attach = on_attach }
  lspconfig.html.setup{ capabilities = capabilities, on_attach = on_attach }
  lspconfig.solargraph.setup{ capabilities = capabilities, on_attach = on_attach }
  lspconfig.pyright.setup{ capabilities = capabilities, on_attach = on_attach }
  lspconfig.sumneko_lua.setup{ capabilities = capabilities, on_attach = on_attach }
  lspconfig.omnisharp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { vim.loop.os_homedir() .. "/.local/share/omnisharp/run", "-lsp" , "--hostPID", tostring(pid) },
    on_exit = function(_code, _signal, _client_id)
      -- omnisharp and/or mono servers don't always get killed, make them anyway
      os.execute('pkill -f "hostPID ' .. tostring(pid) .. '"')
    end
  })
end

return M
