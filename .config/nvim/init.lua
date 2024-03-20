-------------------------------------
-- [[ Neovim Configuration File ]] --
-------------------------------------

-----------------
-- Vim Options --
-----------------
vim.g.mapleader      = ' ' -- Space as the leader key.
vim.g.maplocalleader = ' ' -- Space as the leader key.

vim.opt.mouse         = 'a'  -- Enable mouse for all modes.
vim.opt.scrolloff     = 10   -- Keep padding around cursor.
vim.opt.termguicolors = true -- Enable GUI colors.
vim.opt.undofile      = true -- Enable persistent undo.

vim.opt.updatetime = 250 -- Milliseconds before swap file write.
vim.opt.timeoutlen = 300 -- Milliseconds to wait for mapped sequence to complete.

vim.opt.breakindent = true -- Indent wrapped lines to match line start.
vim.opt.cursorline  = true -- Highlight current line.
vim.opt.linebreak   = true -- Wrap long lines at 'breakat' if 'wrap' is set.
vim.opt.number      = true -- Show line numbers.
vim.opt.splitright  = true -- Vertical splits to the right.
vim.opt.splitbelow  = true -- Horizontal splits underneath.

vim.opt.ruler      = false -- Don't show cursor position in command line.
vim.opt.showmode   = false -- Don't show mode in command line.
vim.opt.signcolumn = 'yes' -- Always show sign column.
vim.opt.wrap       = true  -- Wrap long lines.

vim.opt.ignorecase  = true    -- Infer letter cases for keyword completion.
vim.opt.inccommand  = 'split' -- Show results of command when typing.
vim.opt.incsearch   = true    -- Show search results when typing.
vim.opt.smartcase   = true    -- Don't ignore case when search if pattern has upper case.
vim.opt.smartindent = true    -- make indenting smarter.

vim.opt.completeopt   = 'menuone,noinsert,noselect' -- Custom completions.
vim.opt.formatoptions = 'qjl1'                      -- Don't autoformat comments.
vim.opt.virtualedit   = 'block'                     -- Allow for going past end of the line in visual block mode.

vim.opt.list = true                                         -- Enable helper symbols.
vim.opt.listchars = { tab = '→ ', trail = '•', nbsp = '␣' } -- Helper symbols.

-------------
-- Keymaps --
-------------

-- Highlighted related keymaps.
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Save with CTRL-S.
vim.keymap.set('n', '<C-S>', '<Cmd>silent! update | redraw<CR>', { desc = 'Save' })
vim.keymap.set({ 'i', 'x' }, '<C-S>', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Save and go to Normal mode' })

-- Toggle options.
vim.keymap.set('n', '\\b', '<Cmd>lua vim.o.bg = vim.o.bg == "dark" and "light" or "dark"; print(vim.o.bg)<CR>',       { desc = "Toggle 'background'" })
vim.keymap.set('n', '\\c', '<Cmd>setlocal cursorline! cursorline?<CR>',                                               { desc = "Toggle 'cursorline'" })
vim.keymap.set('n', '\\C', '<Cmd>setlocal cursorcolumn! cursorcolumn?<CR>',                                           { desc = "Toggle 'cursorcolumn'" })
vim.keymap.set('n', '\\h', '<Cmd>let v:hlsearch = 1 - v:hlsearch | echo (v:hlsearch ? "  " : "no") . "hlsearch"<CR>', { desc = 'Toggle search highlight' })
vim.keymap.set('n', '\\i', '<Cmd>setlocal ignorecase! ignorecase?<CR>',                                               { desc = "Toggle 'ignorecase'" })
vim.keymap.set('n', '\\l', '<Cmd>setlocal list! list?<CR>',                                                           { desc = "Toggle 'list'" })
vim.keymap.set('n', '\\n', '<Cmd>setlocal number! number?<CR>',                                                       { desc = "Toggle 'number'" })
vim.keymap.set('n', '\\r', '<Cmd>setlocal relativenumber! relativenumber?<CR>',                                       { desc = "Toggle 'relativenumber'" })
vim.keymap.set('n', '\\s', '<Cmd>setlocal spell! spell?<CR>',                                                         { desc = "Toggle 'spell'" })
vim.keymap.set('n', '\\w', '<Cmd>setlocal wrap! wrap?<CR>',                                                           { desc = "Toggle 'wrap'" })

-- Window navigation
vim.keymap.set('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Window resize (respecting `v:count`)
vim.keymap.set('n', '<C-Left>',  '"<Cmd>vertical resize -" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Down>',  '"<Cmd>resize -"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Up>',    '"<Cmd>resize +"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window height' })
vim.keymap.set('n', '<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window width' })

-- Move only sideways in command mode. Using `silent = false` makes movements to be immediately shown.
vim.keymap.set('c', '<M-h>', '<Left>',  { silent = false, desc = 'Left' })
vim.keymap.set('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })

-- Don't `norevim.keymap.set` in insert mode to have these keybindings behave exactly like arrows (crucial inside TelescopePrompt).
vim.keymap.set('i', '<M-h>', '<Left>',  { noremap = false, desc = 'Left' })
vim.keymap.set('i', '<M-j>', '<Down>',  { noremap = false, desc = 'Down' })
vim.keymap.set('i', '<M-k>', '<Up>',    { noremap = false, desc = 'Up' })
vim.keymap.set('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

vim.keymap.set('t', '<M-h>', '<Left>',  { desc = 'Left' })
vim.keymap.set('t', '<M-j>', '<Down>',  { desc = 'Down' })
vim.keymap.set('t', '<M-k>', '<Up>',    { desc = 'Up' })
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
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function(event)
      local builtin = require('telescope.builtin')
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
      end

      -- Telescope shortcuts.
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
          map('gI', builtin.lsp_implementations, '[G]oto [i]mplementations')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [s]ymbols')
          map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [s]ymbols')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
        end,
      })
    end,
  },

  -- For marking files.
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require('harpoon')
      local conf = require('telescope.config').values
      local toggle_telescope = function(harpoon_files)
        local make_finder = function()
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          return require('telescope.finders').new_table({
            results = file_paths,
          })
        end
        require('telescope.pickers').new({}, {
          prompt_title = 'Harpoon',
          finder = make_finder(),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(buffn, map)
            map({ 'n', 'i' }, '<C-d>', function()
              local state = require('telescope.actions.state')
              local selection = state.get_selected_entry()
              local current_picker = state.get_current_picker(buffn)

              harpoon:list():removeAt(selection.index)
              current_picker:refresh(make_finder())
            end)
            return true
          end,
        }):find()
      end

      harpoon.setup()
      vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end, { desc = '[A]ppend to harpoon list' })
      vim.keymap.set('n', '<leader><leader>', function() toggle_telescope(harpoon:list()) end, { desc = '[ ] View harpoon items' })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end,
  },

  -- Mini utilities.
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.comment').setup()
      require('mini.completion').setup()
      require('mini.files').setup()
      require('mini.pairs').setup()
      require('mini.surround').setup()

      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = true })
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      vim.keymap.set('n', '<leader>e', function() MiniFiles.open() end, { desc = 'Open file [e]xplorer' })
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

      -- Disable virtual text for diagnostic.
      vim.diagnostic.config({
        virtual_text = false,
      })

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
        callback = function ()
          vim.diagnostic.open_float(nil, { focus = false })
        end
      })
    end,
  }
})
