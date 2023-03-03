M = {}
M.file_exists = function (file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

M.lines_from = function (file)
  if not M.file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

M.chunks_of = function (text, size)
  local t = {}
  for i=1, #text, size do
    t[#t+1] = text:sub(i, i + size - 1)
  end

  return t
end

return M
