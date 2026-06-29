local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

local is_windows = os.getenv("OS") and os.getenv("OS"):lower():find("windows")
local is_macos = wezterm.target_triple:lower():find("darwin") ~= nil
local modifier = is_macos and "CMD" or "CTRL"

config.color_scheme = 'rose-pine-moon'
config.max_fps = 120
config.font = wezterm.font("Hack Nerd Font")
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_frame = {
  font = wezterm.font("Hack Nerd Font", { weight = "DemiBold" }),
}
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#ffd700",
      fg_color = "#191724",
    },
  },
}
config.quit_when_all_windows_are_closed = false
config.inactive_pane_hsb = {
  saturation = 0.0,
  brightness = 0.5,
}

if is_macos then
  config.window_background_opacity = 0.8
  config.macos_window_background_blur = 50
  config.font_size = 13.0
  config.window_frame.font_size = 13.0
end

--keys
local is_window_maximized = false
local toggle_maximize_window = wezterm.action_callback(function(window, pane)
  if is_window_maximized then
    window:restore()
    is_window_maximized = false
  else
    window:maximize()
    is_window_maximized = true
  end
end)

config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = modifier }
config.keys = {
  { key = "v", mods = modifier, action = act.PasteFrom('Clipboard') },
  { key = 'c', mods = modifier, action = act.CopyTo('Clipboard') },
  { key = 't', mods = modifier, action = act.SpawnTab('CurrentPaneDomain') },
  { key = 'q', mods = modifier, action = act.CloseCurrentTab{ confirm = true } },
  { key = 'f', mods = modifier, action = toggle_maximize_window },
}

if is_macos then
  table.insert(config.keys, { key = "LeftArrow", mods = "CMD", action = act.ActivateTabRelative(-1) })
  table.insert(config.keys, { key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) })
else
  table.insert(config.keys, { key = "LeftArrow", mods = "CTRL", action = act.ActivateTabRelative(-1) })
  table.insert(config.keys, { key = "RightArrow", mods = "CTRL", action = act.ActivateTabRelative(1) })
end

return config
