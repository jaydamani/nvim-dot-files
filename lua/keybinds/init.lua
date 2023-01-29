local utils = require('utils')
local map = utils.map

--local map_file = utils.map_file
--map_file('global', { })
map({ jj = '<C-\\><C-n>' }, { mode = 't'  })
map {
  ['<Tab>'] = '<CMD>bnext<CR>',
  ['<S-Tab>'] = '<CMD>bprev<CR>',
  ['<C-h>'] = '<CMD>winc h<CR>',
  ['<C-j>'] = '<CMD>winc j<CR>',
  ['<C-k>'] = '<CMD>winc k<CR>',
  ['<C-l>'] = '<CMD>winc l<CR>',
  ['[d'] = '<CMD>lua vim.diagnostic.goto_prev()<CR>',
  [']d'] = '<CMD>lua vim.diagnostic.goto_next()<CR>',
  ['<space>e'] = '<CMD>lua vim.diagnostic.open_float()<CR>',
  ['<space>q'] = '<CMD>lua vim.diagnostic.setloclist<CR>',
  ['<space>f'] = '<CMD>lua vim.lsp.buf.format { async = true }<CR>',
  [';'] = {
    ':',
    silent = false
  },
  jj = {
    '<esc>',
    mode = 'i',
  },
}
