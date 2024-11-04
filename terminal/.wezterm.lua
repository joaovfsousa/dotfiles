-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { "/bin/zsh", "-lc", "tmux attach || tmux" }

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

config.keys = {
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
    }),
  },
  -- {
  --   key = "h",
  --   mods = "CTRL",
  --   action = act.EmitEvent("ActivatePaneDirection-left"),
  -- },
  -- {
  --   key = "j",
  --   mods = "CTRL",
  --   action = act.EmitEvent("ActivatePaneDirection-down"),
  -- },
  -- {
  --   key = "k",
  --   mods = "CTRL",
  --   action = act.EmitEvent("ActivatePaneDirection-up"),
  -- },
  -- {
  --   key = "l",
  --   mods = "CTRL",
  --   action = act.EmitEvent("ActivatePaneDirection-right"),
  -- },
  {
    key = "\\",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Right", size = { Percent = 30 } }),
  },
  {
    key = "|",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Down", size = { Percent = 30 } }),
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Right" }),
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Up" }),
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Down" }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Left" }),
  },
  {
    key = "c",
    mods = "LEADER",
    action = act.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "m",
    mods = "LEADER",
    action = act.PaneSelect({
      alphabet = "asdfghjkl;",
    }),
  },
  {
    key = "s",
    mods = "LEADER",
    action = act.PaneSelect({
      mode = "SwapWithActive",
    }),
  },
  {
    key = " ",
    mods = "LEADER",
    action = act.ShowLauncherArgs({
      flags = "FUZZY|WORKSPACES",
    }),
  },
  {
    key = "S",
    mods = "LEADER",
    action = act.ShowLauncher,
  },
  {
    key = "+",
    mods = "CMD",
    action = act.ResetFontSize,
  },
}

config.key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
  },
}

return config
