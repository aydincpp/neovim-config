-- lua/utils/doc.lua
--
-- Generates markdown table from lua/core/keymaps_meta.lua
--
-- Usage:
--  Just Source the file with :source command,
--  and it will generate the markdown file

local M = {}

local meta = require("core.keymaps_meta")

-- Escape keys containing backticks
function M.escape_key(key)
  if key:find("`") then
    return "`` " .. key .. " ``"
  else
    return "` " .. key .. " `"
  end
end

-- Flatten the keymaps from nested meta table
function M.flatten_keymaps()
  local result = {}
  for _, category in pairs(meta) do
    for _, map in pairs(category) do
      local modes = map.mode
      if type(modes) ~= "table" then
        modes = { modes }
      end
      for _, mode in ipairs(modes) do
        for _, key_entry in ipairs(map.keys) do
          table.insert(result, {
            group = map.group,
            mode = mode,
            key = M.escape_key(key_entry.lhs),
            desc = key_entry.desc,
          })
        end
      end
    end
  end
  return result
end

-- Generate Markdown table from keymaps
function M.generate_markdown()
  local keymaps = M.flatten_keymaps()
  local lines = {
    "| Group | Mode | Key | Description |",
    "|-------|------|-----|-------------|"
  }
  for _, km in ipairs(keymaps) do
    table.insert(lines, string.format("| %s | %s | %s | %s |",
      km.group, km.mode, km.key, km.desc
    ))
  end
  return table.concat(lines, "\n")
end

-- Save Markdown table to file
function M.save_markdown(file_path)
  local content = M.generate_markdown()
  local f = io.open(file_path, "w")
  f:write(content)
  f:close()
end

M.save_markdown("keymaps_meta_tbl.md")

return M
