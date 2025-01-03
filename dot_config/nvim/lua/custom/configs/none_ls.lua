local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local null_ls = require 'null-ls'

local opts = {
  sources = {
    null_ls.builtins.formatting.prettierd,
    -- python
    -- null_ls.builtins.formatting.yapf,
    -- null_ls.builtins.formatting.isort,
    -- null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofmt,
    -- null_ls.builtins.diagnostics.mypy,
  },
  on_attach = function(client, bufnr)
    if client.supports_method 'TextDocument/formatting' then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_augroup('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
