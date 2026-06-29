local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

local is_windows = os.getenv("OS") and os.getenv("OS"):lower():find("windows")
local is_macos = wezterm.target_triple:lower():find("darwin") ~= nil

config.color_scheme = 'rose-pine-moon'
config.max_fps = 120
config.font = wezterm.font("Hack Nerd Font")
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 0.8
config.window_frame = {
  font = wezterm.font("Hack Nerd Font", { weight = "DemiBold" }),
  font_size = 13.0,
}
config.inactive_pane_hsb = {
  saturation = 0.0,
  brightness = 0.5,
}

--keys
local maximize_window = wezterm.action_callback(function(window, pane)
  window:maximize()
end)

config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = "CTRL" }
config.keys = {
  { key = "v", mods = "CTRL", action = act.PasteFrom('Clipboard') },
  { key = 'c', mods = 'CTRL', action = act.CopyTo('Clipboard') },
  { key = 't', mods = 'CTRL', action = act.SpawnTab('CurrentPaneDomain') },
  { key = 'q', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'f', mods = 'CTRL', action = act.ToggleFullScreen },  
}

return config
