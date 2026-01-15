-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Window size
config.initial_cols = 100
config.initial_rows = 30

-- Window appearance
config.window_padding = {
	left = 30,
	right = 30,
	top = 30,
	bottom = 30,
}

config.window_decorations = "RESIZE" -- closest to Buttonless on macOS
config.window_background_opacity = 0.75
config.macos_window_background_blur = 30

-- Cursor
config.default_cursor_style = "BlinkingBar"

-- Font
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
})
config.font_size = 12.0

-- Gruvbox colors (from your Alacritty config)
config.colors = {
	foreground = "#ebdbb2",
	background = "#1d2021",

	cursor_bg = "#ebdbb2",
	cursor_fg = "#282828",
	cursor_border = "#ebdbb2",

	ansi = {
		"#282828", -- black
		"#cc241d", -- red
		"#98971a", -- green
		"#d79921", -- yellow
		"#458588", -- blue
		"#b16286", -- magenta
		"#689d6a", -- cyan
		"#a89984", -- white
	},

	brights = {
		"#928374", -- bright black
		"#fb4934", -- bright red
		"#b8bb26", -- bright green
		"#fabd2f", -- bright yellow
		"#83a598", -- bright blue
		"#d3869b", -- bright magenta
		"#8ec07c", -- bright cyan
		"#ebdbb2", -- bright white
	},
}

-- Key Configs

config.keys = {
	-- Disable default Cmd shortcuts
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},

	-- Cmd + 1 → Split pane to the RIGHT
	{
		key = "1",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},

	-- Cmd + 2 → Split pane to the BOTTOM
	{
		key = "2",
		mods = "CMD",
		action = wezterm.action.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},

	-- Cmd + W → Close CURRENT pane
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},

	-- Resize panes with Cmd + Shift + Arrow keys
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "UpArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "DownArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},

	-- Cmd + F → Search (find in scrollback)
	{
		key = "f",
		mods = "CMD",
		action = wezterm.action.Search("CurrentSelectionOrEmptyString"),
	},

	-- Cmd + T → New tab (if you enable tabs later)
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},

	-- Use Cmd + Shift + [ and ] (like browsers)
	{
		key = "[",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
}

-- No tab bar (clean look)
config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"

return config
