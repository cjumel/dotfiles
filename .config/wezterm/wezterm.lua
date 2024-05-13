local utils = require("utils")

-- [[ Define options ]]
local options = require("options")
local theme = require("theme")
options = theme.make_options(options)

-- [[ Setup actions ]]
local actions = require("actions")
actions.set_actions()

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

return utils.concat_dicts({ options, keys })
