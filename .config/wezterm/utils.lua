local M = {}

-- Merge any number of dictionaries together. Dictionaries are processed in order, so if some keys are shared, the
-- latest value encountered will take precedence.
---@param dicts table[]
---@return table
M.merge_dicts = function(dicts)
  local res = {}
  for _, dict in ipairs(dicts) do
    for k, v in pairs(dict) do
      res[k] = v
    end
  end
  return res
end

return M
