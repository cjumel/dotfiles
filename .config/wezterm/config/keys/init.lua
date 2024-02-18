local utils = require("utils")

local default_config_keys = require("config.keys.default")

local custom_keys = require("config.keys.custom_keys")

return {
  keys = utils.table.concat_arrays({
    default_config_keys.keys,
    custom_keys,
  }),
  key_tables = default_config_keys.key_tables,
}
