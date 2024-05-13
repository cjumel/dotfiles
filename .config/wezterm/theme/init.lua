local utils = require("utils")

local M = {}

--- Update the provided options with the theme ones.
---@param options table The options to update.
---@return table
function M.make_options(options)
  -- Force reload the theme module, otherwise it is not updated when the theme symlink is changed
  package.loaded["theme.current"] = nil

  local ok, theme = pcall(require, "theme.current")
  if not ok then -- The theme symlink is missing
    theme = require("theme.catppuccin-mocha") -- Default theme
  end
  return utils.concat_dicts({ options, theme })
end

return M
