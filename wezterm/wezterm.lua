-- Pulls the wezterm API
local wezterm = require 'wezterm'

-- Holds the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Moon'
config.window_background_opacity = 0.8
config.disable_default_key_bindings = false

local act = wezterm.action
config.keys = {
   { key = '1', mods = 'CTRL', action = act.ActivateTab(0) },
   { key = '2', mods = 'CTRL', action = act.ActivateTab(1) },
   { key = '3', mods = 'CTRL', action = act.ActivateTab(2) },
   { key = '4', mods = 'CTRL', action = act.ActivateTab(3) },
   { key = 'v', mods = 'ALT', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },
   { key = 'C', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
   { key = 'V', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },

   -- TODO: Put key passthrough code in a for loop
   { key = '7', mods = 'CTRL', action = wezterm.action.SendKey{key="7", mods="CTRL"} },
   { key = '8', mods = 'CTRL', action = wezterm.action.SendKey{key="8", mods="CTRL"} },
   { key = '9', mods = 'CTRL', action = wezterm.action.SendKey{key="9", mods="CTRL"} },
   { key = '0', mods = 'CTRL', action = wezterm.action.SendKey{key="0", mods="CTRL"} },
   { key = '/', mods = 'CTRL', action = wezterm.action.SendKey{key="/", mods="CTRL"} },
}

-- Returns the configuration to wezterm
return config
