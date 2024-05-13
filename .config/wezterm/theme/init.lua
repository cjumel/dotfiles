local utils = require("utils")

local M = {}

local ok, theme = pcall(require, "theme.current")
if not ok then -- The theme symlink is missing
  theme = require("theme.catppuccin-mocha") -- Default theme
end

--- Update the provided options with the theme ones.
---@param options table The options to update.
---@return table
function M.make_options(options) return utils.concat_dicts({ options, theme }) end

return M
