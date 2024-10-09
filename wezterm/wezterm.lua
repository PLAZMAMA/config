-- Pulls the wezterm API
local wezterm = require 'wezterm'

-- Holds the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Moon'
config.window_background_opacity = 0.8

-- Returns the configuration to wezterm
return config
