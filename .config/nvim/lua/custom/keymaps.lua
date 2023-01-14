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
vim.keymap.set('', '<leader>w', ':w<cr>')

-- Show keymap help while I'm relearning
vim.keymap.set('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = '[T]elescope [K]eymaps' })

-- Show diagnostics
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist)

-- Equalize panes
vim.keymap.set('', '<leader>=', '<C-w>=')

-- Make * useful in visual mode
vim.keymap.set('v', '*', 'y/<c-r>"<cr>', { silent = true })

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

vim.keymap.set('n', '<leader>f', ':Neotree toggle<cr>', { silent = true })

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.keymap.set('i', '<expr> <Tab>',   'pumvisible() ? "<C-n>" : "<Tab>"')
vim.keymap.set('i', '<expr> <S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"')

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)


-- [[ Plugin Keymaps ]] {{{
-- See `:help telescope.builtin`

-- Make sure we follow symlinks in telescope
local find_files = function ()
  require('telescope.builtin').find_files({ follow = true, hidden = true })
end

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', find_files, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>h', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })

vim.keymap.set('v', '<leader>s', function()
  require('telescope.builtin').live_grep({ default_text = vim.getVisualSelection(), desc = '[S]earch visual selection' })
end)

vim.keymap.set('v', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    default_text = vim.getVisualSelection(),
    desc = 'Search visual selection in buffer'
  })
end)
-- }}}
