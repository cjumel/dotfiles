local config = require("options")

local theme = require("theme")
config = theme.make_config(config)

local actions = require("actions")
actions.set_actions()
config.disable_default_key_bindings = true
local keys = require("keys")
config.keys = keys

return config
