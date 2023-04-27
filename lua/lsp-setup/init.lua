local lspconfig = require 'lspconfig'
local utils = require('utils')
local merge = utils.merge
local configs = {
    tsserver = {},
    lua_ls = require('lsp-setup.lua_ls'),
    jsonls = require('lsp-setup.jsonls'),
    eslint = {
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
    }
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function add_lsp_keybinds(bufnr)
    local opts = {noremap = true, silent = true, buffer = bufnr}

    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>d', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>c', vim.lsp.buf.code_action, opts)

end

local function on_attach(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    add_lsp_keybinds(bufnr)
end

local default_config = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {debounce_text_changes = 150}
}

for name, config in pairs(configs) do
    config = merge(config, default_config)
    if config.custom_attach then
        config.on_attach = function(...)
            on_attach(...)
            config.custom_attach(...)
        end
    end

    lspconfig[name].setup(config)
end
