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
  for _, section in pairs(sections) do
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

local copilot_indicator = function()
  local client = vim.lsp.get_active_clients({ name = "copilot" })[1]
  if client == nil then
    return ""
  end

  if vim.tbl_isempty(client.requests) then
    return "idle" -- default icon whilst copilot is idle
  end

  local spinners = {
    "🤖💭",
    "🤖  ",
  }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 240) % #spinners

  return spinners[frame + 1]
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

local theme = require'lualine.themes.ayu_dark'
theme.normal.b.bg = '#050108'
theme.normal.b.fg = '#ffffff'
theme.normal.c.bg = '#050108'
theme.normal.c.fg = '#ffffff'

require('lualine').setup {
  options = {
    refresh = { statusline = 100 },
    theme = theme,
  },
  sections = process_sections {
    lualine_a = { "%p%%", 'mode' },
    lualine_b = {
      { copilot_indicator },
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
    lualine_y = { { function() return '0x%B' end } },
    lualine_z = { '%l:%c', '%L' },
  },
  inactive_sections = {
    lualine_a = { { '' } },
  },
}
