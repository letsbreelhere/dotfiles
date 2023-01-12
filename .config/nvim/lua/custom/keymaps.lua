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

vim.keymap.set('v', '<leader>s', function()
  require('telescope.builtin').live_grep({ default_text = vim.getVisualSelection(), desc = '[S]earch visual selection' })
end)

vim.keymap.set('v', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    default_text = vim.getVisualSelection(),
    desc = 'Search visual selection in buffer'
  })
end)

-- Easier quit/save maps
vim.keymap.set('', '<leader>q', ':q<cr>')
vim.keymap.set('', '<leader>Q', ':q!<cr>')
vim.keymap.set('', '<leader>w', ':w<cr>')

-- Show keymap help while I'm relearning
vim.keymap.set('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = '[T]elescope [K]eymaps' })

-- Show diagnostics without affecting existing maps
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float)
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

-- <leader> + pastebuffer-affecting commands use the system clipboard.
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

-- Toggle search highlighting
vim.keymap.set('n', '<backspace>', function() vim.o.hlsearch = not vim.o.hlsearch end, { silent = true })

vim.keymap.set('n', '<leader>f', ':Neotree toggle<cr>', { silent = true })
