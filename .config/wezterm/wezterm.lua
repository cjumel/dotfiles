local utils = require("utils")

-- [[ Define options ]]
local options = require("options")

-- [[ Define theme ]]
-- The theme file should stay in the root directory of the Lua configuration, otherwise auto-relaod
-- stops working
local ok, theme = pcall(require, "theme") -- Handle the case the theme file is missing
if not ok then
  theme = {}
end

-- [[ Setup actions ]]
require("actions")

-- [[ Define keymaps ]]
local custom_keys = require("custom_keys")
local default_keys = require("default_keys")
local keys = {
  keys = utils.concat_arrays({
    default_keys.keys,
    custom_keys.keys,
  }),
  key_tables = default_keys.key_tables,
}

return utils.concat_dicts({
  options,
  theme,
  keys,
})
