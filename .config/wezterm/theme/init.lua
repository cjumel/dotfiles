local utils = require("utils")

local M = {}

--- Update the provided options with the theme ones.
---@param config table The options to update.
---@param opts table|nil Options to customize the function behavior.
---@return table
function M.make_config(config, opts)
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
  return utils.concat_dicts({ config, theme })
end

return M
