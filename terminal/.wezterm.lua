-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.default_prog = { "/bin/zsh", "-lc", "tmux attach || tmux" }
config.default_prog = { "/bin/zsh", "-lc", "zellij a || zellij" }

config.leader = { key = "b", mods = "CTRL" }

-- config.initial_rows = 36
-- config.initial_cols = 148

config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.95

config.font_size = 15
config.line_height = 1
config.cell_width = 1
config.underline_position = -2.

config.font = wezterm.font_with_fallback({
  {
    family = "Monaspace Neon",
    weight = 700,
    harfbuzz_features = {
      "ss01",
      "ss02",
      "ss03",
      "ss04",
      "ss05",
      "ss06",
      "ss07",
      "ss08",
      "calt",
      "dlig",
    },
  },
  {
    family = "JetBrainsMono Nerd Font",
    weight = "Bold",
  },
})

config.hide_tab_bar_if_only_one_tab = true

config.disable_default_key_bindings = true

config.keys = {
  {
    key = "q",
    mods = "CTRL",
    action = act.Nop,
  },
  {
    key = "q",
    mods = "SUPER",
    action = act.QuitApplication,
  },
  {
    key = "c",
    mods = "SUPER",
    action = act.CopyTo("Clipboard"),
  },
  {
    key = "v",
    mods = "SUPER",
    action = act.PasteFrom("Clipboard"),
  },
  {
    key = "+",
    mods = "SUPER",
    action = act.IncreaseFontSize,
  },
  {
    key = "-",
    mods = "SUPER",
    action = act.DecreaseFontSize,
  },
  {
    key = "=",
    mods = "SUPER",
    action = act.ResetFontSize,
  },
}

return config
