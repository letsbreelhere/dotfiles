DB = require('dashboard')
U = require('custom.util')

local logo_path = os.getenv('HOME') .. '/.config/nvim/static/logo.txt'
DB.preview_command = 'cat'
DB.preview_file_path = logo_path

local logo = U.lines_from(logo_path)
local rowlen = require('utf8').len(logo[1])
DB.preview_file_width = rowlen
DB.preview_file_height = #logo

-- local tips_path = os.getenv('HOME') .. '/.config/nvim/static/vimtips.txt'
-- local tips_lines = U.lines_from(tips_path)
-- math.randomseed(os.time())
-- local tip = tips_lines[math.random(#tips_lines)]
--
-- DB.custom_header = { tip }

local function pad_sections(max_size, sections)
  for _, section in pairs(sections) do
    local used = require('utf8').len(section.shortcut .. section.desc)
    local spaces = string.rep(' ', max_size - used)
    section.desc = section.desc .. spaces
  end
  return sections
end

DB.custom_center = pad_sections (80, {
  { shortcut = 'SPC s p', desc = 'Open scratchpad', icon = ' ', action = 'CodiNew ruby' },
  { shortcut = 'SPC f g', desc = 'Live grep', icon = ' ', action = 'Telescope live_grep' },
  { shortcut = 'SPC f r', desc = 'Recent files', icon = ' ', action = 'Telescope oldfiles' },
  { shortcut = 'SPC n', desc = 'Show neotree', icon = ' ', action = 'Neotree toggle' },
  { shortcut = 'SPC SPC', desc = 'Find file', icon = ' ' },
})
