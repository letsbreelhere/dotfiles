local db = require('dashboard')

local logo_path = os.getenv('HOME') .. '/.config/nvim/static/logo.txt'
db.preview_command = 'cat | lolcat -p 0.5 -t'
db.preview_file_path = logo_path

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local logo = lines_from(logo_path)
local rowlen = require('utf8').len(logo[1])
db.preview_file_width = rowlen
db.preview_file_height = #logo

local function pad_sections(sections)
  for _, section in pairs(sections) do
    local used = require('utf8').len(section.shortcut .. section.desc)
    local spaces = string.rep(' ', rowlen - used)
    section.desc = section.desc .. spaces
  end
  return sections
end

db.custom_center = pad_sections {
  { shortcut = '', desc = 'Open scratchpad', icon = '  ', action = 'e ~/.scratch.txt' },
  { shortcut = 'SPC f g', desc = 'Live grep', icon = '  ', action = 'Telescope live_grep' },
  { shortcut = 'SPC f r', desc = 'Recent files', icon = '  ', action = 'Telescope oldfiles' },
  { shortcut = 'SPC n', desc = 'Show neotree', icon = '  ', action = 'Neotree toggle' },
  { shortcut = 'SPC SPC', desc = 'Find file', icon = '  ' },
}
