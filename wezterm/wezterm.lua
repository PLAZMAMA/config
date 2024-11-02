-- Pulls the wezterm API
local wezterm = require("wezterm")

-- Holds the configuration.
local config = wezterm.config_builder()

-- Color scheme and apperance
config.color_scheme = "Tokyo Night Moon"
config.window_background_opacity = 0.8
config.disable_default_key_bindings = false
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	active_titlebar_bg = "rgba(36, 40, 59, 0.8)",
	inactive_titlebar_bg = "rgba(36, 40, 59, 0.8)",
}
config.colors = {
	tab_bar = {
		active_tab = { bg_color = "rgba(132, 1, 67, 0.8)", fg_color = "white" },
		inactive_tab = { bg_color = "rgba(36, 40, 59, 0.8)", fg_color = "white" },
		inactive_tab_edge = "rgba(255, 255, 255, 0)",
		new_tab = { bg_color = "rgba(36, 40, 59, 0.8)", fg_color = "white" },
		new_tab_hover = { bg_color = "rgba(132, 1, 67, 0.8)", fg_color = "white" },
	},
}

-- Add Wezterm windowed fullscreen mode on MacOS.
-- Because it doesn't keep the wallpaper when going into normal fullscreen mode.
config.native_macos_fullscreen_mode = false

-- Keybinds
local act = wezterm.action

config.keys = {
	{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
	{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
	{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
	{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
	{ key = "v", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "f", mods = "ALT", action = wezterm.action.ToggleFullScreen },
	{ key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
}

----------------------------------
-- Creating passthrough key binds

-- Table for specifing which keybindings to passthrough
local passthrough_key_binds = {
	{ key = "7", mods = "CTRL" },
	{ key = "8", mods = "CTRL" },
	{ key = "9", mods = "CTRL" },
	{ key = "0", mods = "CTRL" },
	{ key = "/", mods = "CTRL" },
	{ key = "m", mods = "CTRL" },
}

-- Creating complete keybindings table
for indx, key_bind in pairs(passthrough_key_binds) do
	table.insert(config.keys, {
		key = key_bind.key,
		mods = key_bind.mods,
		action = wezterm.action.SendKey({ key = key_bind.key, mods = key_bind.mods }),
	})
end

-- Returns the configuration to wezterm
return config
