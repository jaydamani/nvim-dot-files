local packer = require("packer")
local get_config = function(path) return 'require("plugins.' .. path .. '")' end
local config = function(plugin) return 'require("' .. plugin .. '")' end

packer.startup(function()
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter"
  }

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use {
    "mfussenegger/nvim-dap",
    config = config 'dap-setup',
    requires = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "theHamsta/nvim-dap-virtual-text"
    },
  }

  use { "tpope/vim-fugitive" }

  use {
    'hrsh7th/nvim-cmp',
    config = config('plugins.cmp'),
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-omni',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lua'
    }
  }
  use {
    "neovim/nvim-lspconfig",
    config = config('lsp-setup'),
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    --config = get_config('treesitter'),
    run = ':TSUpdate'
  }

  use 'dracula/vim'

  use {
    'lervag/vimtex',
    config = function()
      vim.api.nvim_set_var('vimtex_view_method', 'zathura')
      vim.api.nvim_set_var('vimtex_compiler_method', 'tectonic')
    end
  }
end)
