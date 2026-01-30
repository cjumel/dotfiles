local config = require("config")

local theme = require("theme")
config = theme.update_config(config)

return config
