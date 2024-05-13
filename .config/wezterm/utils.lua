local M = {}

-- Concatenate any number of arrays together.
---@param arrays table An array of arrays.
---@return table
M.concat_arrays = function(arrays)
  local result = {}

  for _, array in ipairs(arrays) do
    for _, value in ipairs(array) do
      table.insert(result, value)
    end
  end

  return result
end

-- Concatenate any number of dictionaries together. Dictionaries are processed in order, so if
-- some keys are shared, the latest value encountered will take precedence.
---@param dictionaries table An array of dictionaries.
---@return table
M.concat_dicts = function(dictionaries)
  local result = {}

  for _, dictionary in ipairs(dictionaries) do
    for key, value in pairs(dictionary) do
      result[key] = value
    end
  end

  return result
end

M.theme = {}

--- Apply the theme options to the default ones.
---@param options table The default options.
---@return table
function M.theme.make_options(options)
  -- The theme file should stay in the root directory of the Lua configuration, otherwise auto-relaod stops working
  local ok, theme = pcall(require, "_theme")
  if not ok then -- The theme symlink is missing
    theme = require("themes.catppuccin-mocha")
  end

  return M.concat_dicts({ options, theme })
end

return M
