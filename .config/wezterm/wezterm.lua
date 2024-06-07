-- [[ Define base options ]]
local options = require("options")

-- [[ Apply theme-related options ]]
local theme = require("theme")
options = theme.make_options(options)

-- [[ Define keys option ]]
local actions = require("actions")
local keys = require("keys")
actions.set_actions()
options.keys = keys

return options
