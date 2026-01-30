local utils = require("utils")

local M = {}

--- Update the provided config with the theme one.
---@param config table
---@param opts table?
---@return table
function M.update_config(config, opts)
  opts = opts or {}
  local force_reload = opts.force_reload or false

  -- Force reload the theme module, otherwise it is not updated when the theme symlink is changed
  if force_reload then
    package.loaded["theme.current"] = nil
  end

  local ok, theme = pcall(require, "theme.current")
  if not ok then -- The theme symlink is missing
    theme = require("theme.default") -- Default theme
  end
  return utils.merge_dicts({ config, theme })
end

return M
