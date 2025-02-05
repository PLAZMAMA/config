-- Pulls the wezterm API
local wezterm = require("wezterm")

-- Holds the configuration.
local config = wezterm.config_builder()

-- Color scheme and apperance
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.9
config.disable_default_key_bindings = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
local active_tab_bar_color = "rgba(132, 1, 67, 0.7)"
config.colors = {
	tab_bar = {
		active_tab = { bg_color = active_tab_bar_color, fg_color = "white" },
		inactive_tab = { bg_color = "rgba(36, 40, 59, 0.)", fg_color = "white" },
		inactive_tab_hover = { bg_color = active_tab_bar_color, fg_color = "white" },
		inactive_tab_edge = "rgba(255, 255, 255, 0)",
		new_tab = { bg_color = "rgba(36, 40, 59, 0.)", fg_color = "white" },
		new_tab_hover = { bg_color = active_tab_bar_color, fg_color = "white" },
		background = "rgba(36, 40, 59, 0.)",
	},
}

-- Add Wezterm windowed fullscreen mode on MacOS.
-- Because it doesn't keep the wallpaper when going into normal fullscreen mode.
config.native_macos_fullscreen_mode = false

-- Enable kitty graphics for image viewing in Neovim.
config.enable_kitty_graphics = true

-- Change max fps if needed to, right now it feel fine with 60 fps TBH.
-- config.max_fps = 120

-- Change default font size on MacOS
if wezterm.target_triple == "aarch64-apple-darwin" then
	config.font_size = 18
end

----------------------------------
-- Keybinds
local act = wezterm.action

config.keys = {
	{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
	{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
	{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
	{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
	{ key = "v", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }, -- Same as split vertically in Neovim.
	{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "f", mods = "ALT", action = wezterm.action.ToggleFullScreen },
	{ key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
}

-- Creating passthrough key binds
-- Table for specifing which keybindings to passthrough
local passthrough_key_binds = {
	{ key = "7", mods = "CTRL" },
	{ key = "8", mods = "CTRL" },
	{ key = "9", mods = "CTRL" },
	{ key = "0", mods = "CTRL" },
	{ key = "/", mods = "CTRL" },
	{ key = "m", mods = "CTRL" },
	{ key = "h", mods = "ALT" },
	{ key = "j", mods = "ALT" },
	{ key = "k", mods = "ALT" },
	{ key = "l", mods = "ALT" },
}

-- Creating complete keybindings table
for _, key_bind in pairs(passthrough_key_binds) do
	table.insert(config.keys, {
		key = key_bind.key,
		mods = key_bind.mods,
		action = wezterm.action.SendKey({ key = key_bind.key, mods = key_bind.mods }),
	})
end

-- Returns the configuration to wezterm
return config
