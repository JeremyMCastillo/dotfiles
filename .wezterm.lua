local wezterm = require("wezterm")
local act = wezterm.action
local session_manager = require("wezterm-session-manager/session-manager")

local config = wezterm.config_builder()

-- startup function
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
	session_manager.load_state(window)
end)

-- Leader key
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Font Settings
config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.font_size = 12
config.line_height = 1.1

-- colors
config.color_scheme = "MaterialDarker"

-- Appearance
config.window_decorations = "RESIZE"
config.text_background_opacity = 1
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.window_padding = {
	left = 0,
	right = 0,
	top = 7,
	bottom = 0,
}

config.default_prog = { "pwsh.exe", "-NoLogo" }

-- Session manager
wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

-- Keybindings
config.keys = {
	{ key = "S", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },
	{ key = " ", mods = "CTRL", action = act.PaneSelect },
	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
	{ key = "K", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "W", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "V", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Right", size = { Percent = 30 } }) },
	{ key = "H", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Down", size = { Percent = 30 } }) },
	{ key = "X", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
}

return config
