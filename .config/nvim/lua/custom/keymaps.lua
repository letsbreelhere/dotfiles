-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

-- Easier quit/save maps
vim.keymap.set('', '<leader>q', ':q<cr>')
vim.keymap.set('', '<leader>Q', ':q!<cr>')
vim.keymap.set('', '<leader>w', ':silent write<cr>')

-- Show keymap help while I'm relearning
vim.keymap.set('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = '[T]elescope [K]eymaps' })

-- Show diagnostics
vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float, { desc = 'Open [D]iagnostic [H]over' })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[D]iagnostic [P]revious' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[D]iagnostic [N]ext' })
vim.keymap.set('n', '<leader>de', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = '[D]iagnostic next [E]rror' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = '[D]iagnostic [Q]uickfix' })
vim.keymap.set('n', '<leader>da', vim.lsp.buf.code_action, { desc = '[D]iagnostic [A]ction' })

-- Equalize panes
vim.keymap.set('', '<leader>=', '<C-w>=')

-- Make * useful in visual mode
vim.keymap.set('v', '*', 'y/<c-r>"<cr>', { silent = true })

-- Keep visual highlight after (de-)indents
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

vim.keymap.set('n', '<leader>e', ':e <C-R>=expand("%:p:h") . \'/\'<CR>')

-- Open window splits in various places
vim.keymap.set('n', '<leader>sh', ':leftabove  vsp<CR>')
vim.keymap.set('n', '<leader>sl', ':rightbelow vsp<CR>')
vim.keymap.set('n', '<leader>sk', ':leftabove  sp<CR>')
vim.keymap.set('n', '<leader>sj', ':rightbelow sp<CR>')

-- Move current line up or down
vim.keymap.set('n', '<leader>j', 'ddp')
vim.keymap.set('n', '<leader>k', 'ddkP')

-- <leader> + pastebuffer-affecting commands use the system clipboard. {{{
vim.keymap.set('n', '<leader>D', '"+d$')
vim.keymap.set('v', '<leader>D', '"+d$')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>P', '"+P')
vim.keymap.set('n', '<leader>Y', '"+y$')
vim.keymap.set('v', '<leader>Y', '"+y$')
vim.keymap.set('n', '<leader>d', '"+d')
vim.keymap.set('v', '<leader>d', '"+d')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
-- }}}

-- Toggle search highlighting
vim.keymap.set('n', '<backspace>', function() vim.o.hlsearch = not vim.o.hlsearch end, { silent = true })

vim.keymap.set('n', '<leader>n', ':Neotree toggle<cr>', { silent = true, desc = "[N]eotree toggle"})

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.keymap.set('i', '<expr> <Tab>',   'pumvisible() ? "<C-n>" : "<Tab>"')

vim.keymap.set('i', '<expr> <S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"')

vim.keymap.set('n', '<leader>sp', ':CodiNew ruby<cr>', { desc = 'New [S]cratch[p]ad' })

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ctions' })


-- [[ Plugin Keymaps ]] {{{
-- See `:help telescope.builtin`

local find_files = function ()
  require('telescope.builtin').find_files({ follow = true, hidden = true })
end

-- Make sure we follow symlinks in telescope
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[F]ind [r]ecently opened files' })
vim.keymap.set('n', '<leader><space>', find_files, { desc = '[F]ind [f]ile in project' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>hs', require('telescope').extensions.hoogle.list, { desc = '[H]oogle [S]earch' })
vim.keymap.set('v', '<leader>f', function()
  require('telescope.builtin').live_grep({ default_text = vim.getVisualSelection(), desc = '[F]ind visual selection' })
end)

vim.keymap.set('v', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    default_text = vim.getVisualSelection(),
  })
end, { desc = 'Search visual selection in buffer' })

vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("")', { silent = true, expr = true })

vim.keymap.set('n', '<leader>tr', function()
  require('plenary.test_harness').test_file(vim.fn.expand('%p'))
end, { desc = '[T]est [R]unner' })
-- }}}
