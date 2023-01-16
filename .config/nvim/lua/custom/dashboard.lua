local db = require('dashboard')

db.preview_command = 'cat | lolcat -p 1 -S 400 -t'
db.preview_file_path = os.getenv('HOME') .. '/.config/nvim/static/logo.txt'

local rowlen = 55
db.preview_file_width = rowlen
db.preview_file_height = 6

local function pad_sections(sections)
  for _, section in pairs(sections) do
    local used = require('utf8').len(section.shortcut .. section.desc)
    local spaces = string.rep(' ', rowlen - used)
    section.desc = section.desc .. spaces
  end
  return sections
end

db.custom_center = pad_sections {
  { shortcut = 'SPC f g', desc = 'Live grep', icon = '  ', action = 'Telescope live_grep' },
  { shortcut = 'SPC f r', desc = 'Recent files', icon = '  ', action = 'Telescope oldfiles' },
  { shortcut = 'SPC n', desc = 'Show neotree', icon = '  ', action = 'Neotree toggle' },
  { shortcut = 'SPC SPC', desc = 'Find file', icon = '  ' },
}
