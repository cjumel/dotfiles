local actions = require("keys.actions")
local custom_keys = require("keys.custom_keys")
local default_keys = require("keys.default_keys")
local utils = require("utils")

-- Setup the custom actions used in the custom keys
actions.set_actions()

return {
  keys = utils.concat_arrays({
    default_keys.keys,
    custom_keys.keys,
  }),
  key_tables = default_keys.key_tables,
}
