local utils = require("utils")

-- [[ Define options ]]
local options = require("options")
-- Handle the case the theme file is missing
local ok, theme = pcall(require, "theme")
if not ok then
  theme = {}
end
local config = utils.table.concat_dicts({ options, theme })

-- [[ Define WezTerm events ]]
require("events")

-- [[ Define keymaps ]]
config.keys = require("keys")

return config
