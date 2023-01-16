local colors = {
  black        = '#3c3836',
  white        = '#f9f5d7',
  orange       = '#af3a03',
  green        = '#427b58',
  blue         = '#076678',
  gray         = '#d5c4a1',
  darkgray     = '#7c6f64',
  lightgray    = '#ebdbb2',
  inactivegray = '#a89984'
}

local theme = {
  normal = {
    a = { bg = colors.gray, fg = colors.darkgray, gui = 'bold' },
    b = { bg = colors.inactivegray, fg = colors.darkgray },
    c = { bg = colors.lightgray, fg = colors.darkgray },
  },
  insert = {
    a = { bg = colors.green, fg = colors.white, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.darkgray },
    c = { bg = colors.green, fg = colors.black },
  },
  visual = {
    a = { bg = colors.orange, fg = colors.white, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.darkgray },
    c = { bg = colors.orange, fg = colors.white },
  },
  replace = {
    a = { bg = colors.blue, fg = colors.white, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.darkgray },
    c = { bg = colors.blue, fg = colors.black },
  },
  command = {
    a = { bg = colors.darkgray, fg = colors.white, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.darkgray },
    c = { bg = colors.lightgray, fg = colors.darkgray },
  },
  inactive = {
    a = { bg = colors.lightgray, fg = colors.inactivegray },
    b = { bg = colors.lightgray, fg = colors.inactivegray },
    c = { bg = colors.lightgray, fg = colors.inactivegray },
  },
}

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
      comp.separator = left and { right = ' ' } or { left = ' ' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  local ch

  if vim.bo.modified then
    ch = ' +'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    ch = ' X'
  else
    ch = ''
  end
  return (vim.fn.expand('%') .. ch)
end

local function mod_color()
  local c

  if vim.bo.modified then
    c = { bg = colors.green, fg = colors.white }
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    c = { bg = colors.orange, fg = colors.white }
  else
    c = { bg = colors.gray, fg = colors.darkgray }
  end
  return c
end

require('lualine').setup {
  options = {
    theme = theme,
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', color = { bg = colors.inactivegray, fg = colors.white } },
      { 'diff', color = { bg = colors.gray } },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.orange, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.inactivegray, fg = colors.white } },
      },
      { modified, color = mod_color },
      { 'filetype', icon_only = true, color = mod_color },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { { function() return ' 0x%B' end } },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_a = { {'%f %m', color = mod_color } },
  },
}
