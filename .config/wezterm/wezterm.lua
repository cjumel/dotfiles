local utils = require("utils")

-- [[ Define base options ]]
local options = require("options")

-- [[ Apply theme-related options ]]
local theme = require("theme")
options = theme.make_options(options)

-- [[ Define keys ]]
local keys = require("keys")

return utils.concat_dicts({ options, keys })
