-------------------------------------
-- [[ Neovim Configuration File ]] --
-------------------------------------

-----------------
-- Vim Options --
-----------------
vim.g.mapleader       = ' ' -- Space as the leader key.
vim.g.maplocalleader  = ' ' -- Space as the leader key.

vim.opt.mouse         = 'a' -- Enable mouse for all modes.
vim.opt.scrolloff     = 10 -- Keep padding around cursor.
vim.opt.termguicolors = true -- Enable GUI colors.
vim.opt.undofile      = true -- Enable persistent undo.

vim.opt.updatetime    = 250 -- Milliseconds before swap file write.
vim.opt.timeoutlen    = 300 -- Milliseconds to wait for mapped sequence to complete.

vim.opt.breakindent   = true -- Indent wrapped lines to match line start.
vim.opt.cursorline    = true -- Highlight current line.
vim.opt.linebreak     = true -- Wrap long lines at 'breakat' if 'wrap' is set.
vim.opt.number        = true -- Show line numbers.
vim.opt.splitright    = true -- Vertical splits to the right.
vim.opt.splitbelow    = true -- Horizontal splits underneath.

vim.opt.ruler         = false -- Don't show cursor position in command line.
vim.opt.showmode      = false -- Don't show mode in command line.
vim.opt.signcolumn    = 'yes' -- Always show sign column.
vim.opt.wrap          = true -- Wrap long lines.

vim.opt.ignorecase    = true -- Infer letter cases for keyword completion.
vim.opt.inccommand    = 'split' -- Show results of command when typing.
vim.opt.incsearch     = true -- Show search results when typing.
vim.opt.smartcase     = true -- Don't ignore case when search if pattern has upper case.
vim.opt.smartindent   = true -- make indenting smarter.

vim.opt.completeopt   = 'menuone,noinsert,noselect' -- Custom completions.
vim.opt.formatoptions = 'qjl1' -- Don't autoformat comments.
vim.opt.virtualedit   = 'block' -- Allow for going past end of the line in visual block mode.

vim.opt.list          = true -- Enable helper symbols.
vim.opt.listchars     = { tab = '→ ', trail = '•', nbsp = '␣' } -- Helper symbols.

-------------
-- Keymaps --
-------------

-- Highlighted related keymaps.
vim.opt.hlsearch      = true
vim.keymap.set('n', '<Esc>', function() vim.cmd.nohlsearch() end)
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Save with CTRL-S.
vim.keymap.set('n', '<C-s>', function() vim.cmd.w() end, { desc = 'Save' })
vim.keymap.set({ 'i', 'x' }, '<C-s>', function() vim.cmd.w() end, { desc = 'Save and go to Normal mode' })

-- Esc in terminal.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Go to Normal mode from terminal' })

-- Toggle options.
vim.keymap.set('n', '\\b', function()
  vim.o.bg = vim.o.bg == 'dark' and 'light' or 'dark'; print(vim.o.bg)
end, { desc = "Toggle '[b]ackground'" })
vim.keymap.set('n', '\\c', function() vim.bo.cursorline = not vim.bo.cursorline end, { desc = "Toggle '[c]ursorline'" })
vim.keymap.set('n', '\\C', function() vim.bo.cursorcolumn = not vim.bo.cursorcolumn end,
  { desc = "Toggle '[C]ursorcolumn'" })
vim.keymap.set('n', '\\h',
  function()
    vim.o.hlsearch = not vim.o.hlsearch; print((vim.o.hlsearch and '  ' or 'no') .. 'hlsearch')
  end, { desc = 'Toggle search [h]ighlight' })
vim.keymap.set('n', '\\i', function() vim.o.ignorecase = not vim.o.ignorecase end, { desc = "Toggle '[i]gnorecase'" })
vim.keymap.set('n', '\\l', function() vim.bo.list = not vim.bo.list end, { desc = "Toggle '[l]ist'" })
vim.keymap.set('n', '\\n', function() vim.bo.number = not vim.bo.number end, { desc = "Toggle '[n]umber'" })
vim.keymap.set('n', '\\r', function() vim.bo.relativenumber = not vim.bo.relativenumber end,
  { desc = "Toggle '[r]elativenumber'" })
vim.keymap.set('n', '\\s', function() vim.bo.spell = not vim.bo.spell end, { desc = "Toggle '[s]pell'" })
vim.keymap.set('n', '\\w', function() vim.bo.wrap = not vim.bo.wrap end, { desc = "Toggle '[w]rap'" })

-- Window navigation
vim.keymap.set('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Window resize (respecting `v:count`).
vim.keymap.set('n', '<C-Left>',
  function() vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width(0) - vim.v.count1) end,
  { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Down>',
  function() vim.api.nvim_win_set_height(0, vim.api.nvim_win_get_height(0) - vim.v.count1) end,
  { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Up>',
  function() vim.api.nvim_win_set_height(0, vim.api.nvim_win_get_height(0) + vim.v.count1) end,
  { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Right>',
  function() vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width(0) + vim.v.count1) end,
  { desc = 'Increase window width' })

-- Move only sideways in command mode. Using `silent = false` makes movements to be immediately shown.
vim.keymap.set('c', '<M-h>', '<Left>', { silent = false, desc = 'Left' })
vim.keymap.set('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })

-- Don't `norevim.keymap.set` in insert mode to have these keybindings behave exactly like arrows (crucial inside TelescopePrompt).
vim.keymap.set('i', '<M-h>', '<Left>', { noremap = false, desc = 'Left' })
vim.keymap.set('i', '<M-j>', '<Down>', { noremap = false, desc = 'Down' })
vim.keymap.set('i', '<M-k>', '<Up>', { noremap = false, desc = 'Up' })
vim.keymap.set('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

vim.keymap.set('t', '<M-h>', '<Left>', { desc = 'Left' })
vim.keymap.set('t', '<M-j>', '<Down>', { desc = 'Down' })
vim.keymap.set('t', '<M-k>', '<Up>', { desc = 'Up' })
vim.keymap.set('t', '<M-l>', '<Right>', { desc = 'Right' })

-------------
-- Plugins --
-------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
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

  -- Theming
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's',   mode = { 'n', 'x', 'o' }, function() require('flash').jump() end,              desc = 'Flash' },
      { 'S',   mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end,        desc = 'Flash Treesitter' },
      { 'r',   mode = 'o',               function() require('flash').remote() end,            desc = 'Remote Flash' },
      { 'R',   mode = { 'o', 'x' },      function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
      { '\\f', mode = { 'c' },           function() require('flash').toggle(); end,           desc = "Toggle '[F]lash'" },
    },
  },

  -- Telescope fuzzy finder.
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope-ui-select.nvim' },
    config = function(event)
      require('telescope').load_extension('ui-select')

      local builtin = require('telescope.builtin')
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
      end

      -- Telescope shortcuts.
      map('<leader><leader>', builtin.buffers, '[ ] Find existing buffers')
      map('<leader>b', builtin.buffers, 'Find existing [b]uffers')
      map('<leader>f', builtin.find_files, 'Find [f]iles')
      map('<leader>g', builtin.live_grep, '[G]rep string')

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP Telescope shortcuts',
        group = vim.api.nvim_create_augroup('lsp-telescope-shortcuts', { clear = true }),
        callback = function()
          map('gd', builtin.lsp_definitions, '[G]oto [d]efinitions')
          map('gy', builtin.lsp_type_definitions, '[G]oto t[y]pe definition')
          map('gr', builtin.lsp_references, '[G]oto [r]eferences')
          map('gI', builtin.lsp_implementations, '[G]oto [I]mplementations')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [s]ymbols')
          map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [s]ymbols')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>m', function() vim.lsp.buf.format { async = true } end, 'For[m]at File')
        end,
      })
    end,
  },

  -- Mini utilities.
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup {}
      require('mini.comment').setup {}
      require('mini.completion').setup {
        fallback_action = function() end,
      }
      require('mini.files').setup {}
      require('mini.pairs').setup {}
      require('mini.sessions').setup {}
      require('mini.starter').setup {}
      require('mini.surround').setup {
        mappings = {
          add = '<leader>sa',
          delete = '<leader>sd',
          find = '<leader>sf',
          find_left = '<leader>sF',
          highlight = '<leader>sh',
          replace = '<leader>sr',
          update_n_lines = '<leader>sn',

          suffix_last = '<leader>l',
          suffix_next = '<leader>n',
        },
      }

      local statusline = require('mini.statusline')
      statusline.setup { use_icons = true }
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      vim.keymap.set('n', '<leader>e', function() MiniFiles.open() end, { desc = 'Open file [e]xplorer' })
      vim.keymap.set('n', '<leader>cs', function()
        vim.ui.input({ prompt = 'Session Name: ' },
          function(session_name) _ = session_name and MiniSessions.write(session_name) end)
      end, { desc = '[C]reate [s]ession' })
      vim.keymap.set('n', '<leader>rs', function() MiniSessions.select('read') end, { desc = '[R]ead [s]ession' })
      vim.keymap.set('n', '<leader>us', function() MiniSessions.select('write') end, { desc = '[U]pdate [s]ession' })
      vim.keymap.set('n', '<leader>ds', function() MiniSessions.select('delete') end, { desc = '[D]elete [s]ession' })
    end,
  },

  -- Syntax highlighting.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup { auto_install = true, highlight = { enable = true } }
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
      require('neodev').setup {}
      require('mason').setup {}
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {}
          end,
        }
      }

      -- Disable virtual text for diagnostic.
      vim.diagnostic.config {
        virtual_text = false,
      }

      -- Improved diagnostic symbols.
      local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'Highlight currently selected symbol',
        group = vim.api.nvim_create_augroup('lsp-symbol-highlight', { clear = true }),
        callback = function(event)
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

      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        desc = 'Diagnostic message over cursor',
        group = vim.api.nvim_create_augroup('float-diagnostic', { clear = true }),
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false })
        end
      })
    end,
  }
}
