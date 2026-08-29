-- This scripts uses the Aerospace next & prev workspace custom keymaps, instead of Aerospace CLI's commands, because I
-- already have another software which relies on them (Logi Options+) and in order to have a single implementation

---@diagnostic disable-next-line: undefined-global
Swipe = hs.loadSpoon("Swipe")

local FINGERS = 4
local TRACKPAD_FRACTION_THRESHOLD = 0.03

local NEXT_KEY = "n"
local PREV_KEY = "p"
local KEY_MODIFIERS = { "cmd", "alt", "ctrl" }

local current_id, threshold
Swipe:start(FINGERS, function(direction, distance, id)
  if id == current_id then
    if distance > threshold then
      threshold = math.huge -- Only trigger once per swipe
      if direction == "left" then
        ---@diagnostic disable-next-line: undefined-global
        hs.eventtap.keyStroke(KEY_MODIFIERS, NEXT_KEY)
      elseif direction == "right" then
        ---@diagnostic disable-next-line: undefined-global
        hs.eventtap.keyStroke(KEY_MODIFIERS, PREV_KEY)
      end
    end
  else
    current_id = id
    threshold = TRACKPAD_FRACTION_THRESHOLD
  end
end)
