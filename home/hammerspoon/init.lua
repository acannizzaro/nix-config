-- Reload config
hs.hotkey.bind({"cmd", "shift"}, "R", function()
  hs.reload()
end)

-- Window management helper
local function moveWindow(x, y, w, h)
  return function()
    local win = hs.window.focusedWindow()
    if not win then return end
    local screen = win:screen():frame()
    win:setFrame({
      x = screen.x + (screen.w * x),
      y = screen.y + (screen.h * y),
      w = screen.w * w,
      h = screen.h * h,
    })
  end
end

-- Half screen
hs.hotkey.bind({"ctrl", "alt"}, "Left",  moveWindow(0,   0,   0.5, 1))     -- Left half
hs.hotkey.bind({"ctrl", "alt"}, "Right", moveWindow(0.5, 0,   0.5, 1))     -- Right half
hs.hotkey.bind({"ctrl", "alt"}, "Up",    moveWindow(0,   0,   1,   0.5))   -- Top half
hs.hotkey.bind({"ctrl", "alt"}, "Down",  moveWindow(0,   0.5, 1,   0.5))   -- Bottom half

-- Quarters
hs.hotkey.bind({"ctrl", "alt", "shift"}, "Left",  moveWindow(0,   0,   0.5, 0.5))   -- Top-left
hs.hotkey.bind({"ctrl", "alt", "shift"}, "Right", moveWindow(0.5, 0,   0.5, 0.5))   -- Top-right
hs.hotkey.bind({"ctrl", "alt", "shift"}, "Down",  moveWindow(0,   0.5, 0.5, 0.5))   -- Bottom-left
hs.hotkey.bind({"ctrl", "alt", "shift"}, "Up",    moveWindow(0.5, 0.5, 0.5, 0.5))   -- Bottom-right

-- Full screen (not native macOS fullscreen)
hs.hotkey.bind({"ctrl", "alt"}, "Return", moveWindow(0, 0, 1, 1))

-- Center window
hs.hotkey.bind({"ctrl", "alt"}, "C", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:centerOnScreen()
end)

-- Move window to next screen
hs.hotkey.bind({"ctrl", "alt"}, "N", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:moveToScreen(win:screen():next())
end)

-- Quick app launcher
local function launchOrFocus(app)
  return function()
    hs.application.launchOrFocus(app)
  end
end

hs.hotkey.bind({"ctrl", "alt"}, "T", launchOrFocus("Ghostty"))
hs.hotkey.bind({"ctrl", "alt"}, "B", launchOrFocus("Firefox"))
hs.hotkey.bind({"ctrl", "alt"}, "F", launchOrFocus("Finder"))

hs.alert.show("Hammerspoon loaded")
