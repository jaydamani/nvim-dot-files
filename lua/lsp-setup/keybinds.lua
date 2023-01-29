return {
    gd = vim.lsp.buf.declaration,
    gD = vim.lsp.buf.definition,
    gr = vim.lsp.buf.references,
    K = vim.lsp.buf.hover,
    gi = vim.lsp.buf.implementation,
    ['<space>wa'] = vim.lsp.buf.add_workspace_folder,
    ['<space>wr'] = 'remove_workspace_folder',
    ['<space>wl'] = function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    ['<space>D'] = vim.lsp.buf.type_definition,
    ['<space>rn'] = vim.lsp.buf.rename,
    ['<space>ca'] = vim.lsp.buf.code_action,
    ['<C-k>'] = vim.lsp.buf.signature_help
}
