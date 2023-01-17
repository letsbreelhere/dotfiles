local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
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
      comp.separator = left and { right = ' ' } or { left = ' ' }
    end
  end
  return sections
end

local function search_result()
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  local last_search = vim.fn.getreg('/')

  if searchcount.total == 0 or not last_search or last_search == '' then
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
    return { bg = '#009900' }
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return { bg = '#990000' }
  else
    return { }
  end
end

require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = { left = '🮥', right = '🮤' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch' },
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
    lualine_y = { { function() return ' 0x%B' end } },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_a = { { '' } },
  },
}
