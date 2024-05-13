local utils = require("utils")

local M = {}

-- The "_theme.lua" file should stay in the root directory of the Lua configuration, otherwise auto-relaod stops working
local ok, theme = pcall(require, "_theme")
if not ok then -- The theme symlink is missing
  theme = require("themes.catppuccin-mocha") -- Default theme
end

--- Update the provided options with the theme ones.
---@param options table The options to update.
---@return table
function M.make_options(options) return utils.concat_dicts({ options, theme }) end

return M
