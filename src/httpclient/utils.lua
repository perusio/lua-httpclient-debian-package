local pt = require('pl.pretty')

-- Deep copy function from the Wiki:
-- http://lua-users.org/wiki/CopyTable.
local function deep_copy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deep_copy(orig_key)] = deep_copy(orig_value)
    end
    -- The metatable is shared.
    setmetatable(copy, getmetatable(orig))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

local function print_table(t)
  return pt.write(t)
end

return { print_table = print_table, deep_copy = deep_copy }
