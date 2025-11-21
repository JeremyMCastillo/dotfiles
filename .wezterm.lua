local wezterm = require("wezterm")
local act = wezterm.action
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

local config = wezterm.config_builder()

-- startup function
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Leader key
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

-- Font Settings
-- config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"FiraCode Nerd Font",
	"Symbols Nerd Font",
})
config.font_size = 12
config.line_height = 1.1

-- colors
config.color_scheme = "Everblush"
config.colors = {
	ansi = {
		"#232a2e", -- black
		"#e57474", -- red
		"#8ccf7e", -- green
		"#e5c76b", -- yellow
		"#67b0e8", -- blue
		"#c47fd5", -- magenta
		"#6cbfbf", -- cyan
		"#b3b9b8", -- white
	},
	brights = {
		"#68edcb", -- bright black (make this lighter for command params)
		"#ef7e7e", -- bright red
		"#93d493", -- bright green
		"#f4d67a", -- bright yellow
		"#71baf2", -- bright blue
		"#ce89df", -- bright magenta
		"#67cbe7", -- bright cyan
		"#c7c7c7", -- bright white
	},
	selection_fg = "#232a2e", -- readable foreground for selection
	selection_bg = "#f4d67a", -- bright yellow background for selection
}

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

-- Keybindings
config.keys = {
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
			resurrect.state_manager.save_window_action()
		end),
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action_callback(function(win, pane)
			resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
				local type = string.match(id, "^([^/]+)") -- match before '/'
				id = string.match(id, "([^/]+)$") -- match after '/'
				id = string.match(id, "(.+)%..+$") -- remove file extention
				local opts = {
					relative = true,
					restore_text = true,
					on_pane_restore = resurrect.tab_state.default_on_pane_restore,
				}
				if type == "workspace" then
					local state = resurrect.state_manager.load_state(id, "workspace")
					resurrect.workspace_state.restore_workspace(state, opts)
				elseif type == "window" then
					local state = resurrect.state_manager.load_state(id, "window")
					resurrect.window_state.restore_window(pane:window(), state, opts)
				elseif type == "tab" then
					local state = resurrect.state_manager.load_state(id, "tab")
					resurrect.tab_state.restore_tab(pane:tab(), state, opts)
				end
			end)
		end),
	},
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
