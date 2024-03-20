-------------------------------------
-- [[ Neovim Configuration File ]] --
-------------------------------------

-----------------------------------------------
-- Vim Options (Many set through MiniBasic.) --
-----------------------------------------------
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 10

-------------
-- Plugins --
-------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  -- Better tab/spaces.
  'tpope/vim-sleuth',

  -- Git signs on the left.
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Command hints.
  { 'folke/which-key.nvim', event = 'VeryLazy', opts = {} },

  -- Better listing.
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  -- Theming
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },

  -- Telescope fuzzy finder.
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Mini utilities.
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.basics').setup({
        options = { extra_ui = true },
        mappings = { windows = true, move_with_alt = true },
      })
      require('mini.comment').setup()
      require('mini.completion').setup()
      require('mini.extra').setup()
      require('mini.files').setup()
      require('mini.pairs').setup()
      require('mini.pick').setup()
      require('mini.surround').setup()

      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = true })
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- Syntax highlighting.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({ auto_install = true, highlight = { enable = true } })
    end,
  },

  -- LSP plugins.
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      require('neodev').setup()
      require('mason').setup()
      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end,
  }
})

-------------
-- Keymaps --
-------------
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Picker shortcuts.
vim.keymap.set('n', '<leader>b', function() MiniPick.builtin.buffers() end, { desc = 'Find existing [b]uffers' })
vim.keymap.set('n', '<leader>f', function() MiniPick.builtin.files() end, { desc = 'Find [f]iles' })
vim.keymap.set('n', '<leader>g', function() MiniPick.builtin.grep_live() end, { desc = '[G]rep string' })

-- LSP shortcuts.
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP specific keybinds',
  group = vim.api.nvim_create_augroup('lsp-keybinds', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', function() MiniExtra.pickers.lsp({ scope = 'definition' }) end, '[G]oto [d]efinitions')
    map('gD', function() MiniExtra.pickers.lsp({ scope = 'declaration' }) end, '[G]oto [d]eclaration')
    map('gy', function() MiniExtra.pickers.lsp({ scope = 'type_defintion' }) end, '[G]oto t[y]pe definition')
    map('gr', function() MiniExtra.pickers.lsp({ scope = 'references' }) end, '[G]oto [r]eferences')
    map('gI', function() MiniExtra.pickers.lsp({ scope = 'implementation' }) end, '[G]oto [i]mplementations')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ds', function() MiniExtra.pickers.lsp({ scope = 'document_symbol' }) end, '[D]ocument [s]ymbols')
    map('<leader>ws', function() MiniExtra.pickers.lsp({ scope = 'workspace_symbol' }) end, '[W]orkspace [s]ymbols')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- Highlights currently selected symbol.
    local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          callback = vim.lsp.buf.clear_references,
        })
    end
  end,
})
