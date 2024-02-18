local utils = require("utils")

-- [[ Define options ]]
local config_options = require("config.options")

-- [[ Define theme ]]
-- The theme file should stay in the root directory of the Lua configuration, otherwise auto-relaod
-- stops working
local ok, config_theme = pcall(require, "theme") -- Handle the case the theme file is missing
if not ok then
  config_theme = {}
end

-- [[ Define keymaps ]]
local config_keys = require("config.keys")

return utils.table.concat_dicts({
  config_options,
  config_theme,
  config_keys,
})
