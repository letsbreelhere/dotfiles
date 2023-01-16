-- Complete commands up to longest shared match
vim.o.wildmode = 'longest:full,full'

-- Stop the horrible 'existing swap file!' warnings
vim.o.shortmess = vim.o.shortmess .. 'A'

-- Hide completion messages
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone"

-- No wordwrap
vim.o.wrap = false

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.o.bg = 'dark'
vim.cmd [[colorscheme rose-pine]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.list = true
vim.o.listchars = 'tab:⇥⇥,extends:⇉,precedes:⇇,trail:·,nbsp:·'

-- set termguicolors to enable highlight groups
vim.o.termguicolors = true

vim.o.foldmethod = 'marker'
