-- Pulls the wezterm API
local wezterm = require 'wezterm'

-- Holds the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Moon'
config.window_background_opacity = 0.8

local act = wezterm.action
config.keys = {
    { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
    { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
    { key = '3', mods = 'ALT', action = act.ActivateTab(2) },
    { key = '4', mods = 'ALT', action = act.ActivateTab(3) },
    { key = '5', mods = 'ALT', action = act.ActivateTab(4) },
    { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },
    { key = '6', mods = 'ALT', action = act.ActivateTab(5) },
    { key = '7', mods = 'ALT', action = act.ActivateTab(6) },
    { key = '8', mods = 'ALT', action = act.ActivateTab(7) },
    { key = '9', mods = 'ALT', action = act.ActivateTab(-1) },
}

-- Returns the configuration to wezterm
return config
