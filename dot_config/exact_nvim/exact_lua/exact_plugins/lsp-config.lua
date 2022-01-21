local M = {}

M.config = function ()
  local pid = vim.fn.getpid()
  local lspconfig = require('lspconfig')

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  lspconfig.tsserver.setup{ capabilities = capabilities }
  lspconfig.html.setup{ capabilities = capabilities }
  lspconfig.solargraph.setup{ capabilities = capabilities }
  lspconfig.pyright.setup{ capabilities = capabilities }
  lspconfig.sumneko_lua.setup{ capabilities = capabilities }
  lspconfig.omnisharp.setup({
    capabilities = capabilities,
    cmd = { vim.loop.os_homedir() .. "/.local/share/omnisharp/run", "-lsp" , "--hostPID", tostring(pid) },
    on_exit = function(_code, _signal, _client_id)
      -- omnisharp and/or mono servers don't always get killed, make them anyway
      os.execute('pkill -f "hostPID ' .. tostring(pid) .. '"')
    end
  })
end

return M
