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
vim.o.listchars = 'tab:⇥⇥,extends:…,precedes:…,trail:·,nbsp:·'

-- set termguicolors to enable highlight groups
vim.o.termguicolors = true

vim.o.foldmethod = 'marker'

vim.g.scratchpad_autostart = false

vim.o.scrolloff = 10
vim.o.sidescroll = 0
vim.o.sidescrolloff = 999

-- Fold settings
-- @return { [1]: string, [2]: string[] }[]|string
function CustomFoldtext()
  local ts = require('nvim-treesitter')

  local foldstart = vim.v.foldstart
  local bufnr = vim.api.nvim_get_current_buf()

  ---@type boolean, LanguageTree
  local ok, parser = pcall(ts.get_parser, bufnr)

  if not ok then
    return vim.fn.foldtext()
  end

  local query = ts.query.get(parser:lang(), 'highlights')
  if not query then
    return vim.fn.foldtext()
  end

  local tree = parser:parse({ foldstart - 1, foldstart })[1]

  local line = vim.api.nvim_buf_get_lines(bufnr, foldstart - 1, foldstart, false)[1]

  if not line then
    return vim.fn.foldtext()
  end

  local result = {}

  local line_pos = 0

  for id, node, metadata in query:iter_captures(tree:root(), 0, foldstart - 1, foldstart) do
    local name = query.captures[id]
    local start_row, start_col, end_row, end_col = node:range()

    local priority = tonumber(metadata.priority or vim.highlight.priorities.treesitter)

    if start_row == foldstart - 1 and end_row == foldstart - 1 then
      -- check for characters ignored by treesitter
      if start_col > line_pos then
        table.insert(result, {
          line:sub(line_pos + 1, start_col),
          { { 'Folded', priority } },
          range = { line_pos, start_col },
        })
      end
      line_pos = end_col

      local text = line:sub(start_col + 1, end_col)
      table.insert(result, { text, { { '@' .. name, priority } }, range = { start_col, end_col } })
    end
  end

  local i = 1
  while i <= #result do
    -- find first capture that is not in current range and apply highlights on the way
    local j = i + 1
    while
      j <= #result
      and result[j].range[1] >= result[i].range[1]
      and result[j].range[2] <= result[i].range[2]
      do
      for k, v in ipairs(result[i][2]) do
        if not vim.tbl_contains(result[j][2], v) then
          table.insert(result[j][2], k, v)
        end
      end
      j = j + 2
    end

    -- remove the parent capture if it is split into children
    if j > i + 1 then
      table.remove(result, i)
    else
      -- highlights need to be sorted by priority, on equal prio, the deeper nested capture (earlier
      -- in list) should be considered higher prio
      if #result[i][2] > 1 then
        table.sort(result[i][2], function(a, b)
          return a[2] < b[2]
        end)
      end

      result[i][2] = vim.tbl_map(function(tbl)
        return tbl[1]
      end, result[i][2])
      result[i] = { result[i][1], result[i][2] }

      i = i + 1
    end
  end

  return result
end

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.CustomFoldtext()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
