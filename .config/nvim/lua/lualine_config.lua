local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

local sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
local function scroll_bar()
  local curr_line = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_line_count(0)
  local i = math.floor((curr_line - 1) / lines * #sbar) + 1
  return string.rep(sbar[i], 2)
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = { right='', left='' }
    end
  end
  return sections
end

local function search_result()
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  local last_search = vim.fn.getreg('/')

  if not vim.o.hlsearch or searchcount.total == 0 or not last_search or last_search == '' then
    return ''
  end

  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function filestatus()
  local ch

  if vim.bo.modified then
    ch = ' [+]'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    ch = ' [X]'
  else
    ch = ''
  end
  return (vim.fn.expand('%') .. ch)
end

local function filecolor()
  if vim.bo.modified then
    return { bg = '#225533' }
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return { bg = '#771122' }
  else
  end
end

local function truncated_branch()
  local branch = vim.fn.FugitiveHead()
  if not branch then
    return ''
  end
  local truncated = branch:sub(1, 13)
  if #branch > 13 then
    truncated = truncated .. '…'
  end

  return truncated
end

require('lualine').setup {
  options = {
    theme = 'auto',
  },
  sections = process_sections {
    lualine_a = { { scroll_bar }, 'mode' },
    lualine_b = {
      { 'diff' },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
      },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
      { 'filetype' },
    },
    lualine_c = {
      { filestatus, color = filecolor},
    },
    lualine_x = {{ search_result },},
    lualine_y = { { function() return '0x%B' end } },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_a = { { '' } },
  },
}
