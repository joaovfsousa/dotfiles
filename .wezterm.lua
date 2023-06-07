-- Pull in the wezterm API
local wezterm = require('wezterm')
local act = wezterm.action

local function isViProcess(pane) 
    return pane:get_foreground_process_name():find('n?vim') ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    if isViProcess(pane) then
        window:perform_action(
            act.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditionalActivatePane(window, pane, 'Down', 'j')
end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.leader = { key = 'a', mods = 'CTRL' }

-- config.initial_rows = 36
-- config.initial_cols = 148

config.color_scheme = 'Dracula (Official)'
config.window_background_opacity = 0.92

config.font =
  wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' })
config.font_size = 14
config.line_height = 1
config.cell_width = 1.1

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
  { key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
  { key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
  { key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
  { key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },
  {
    key = '\\',
    mods = 'LEADER',
    action = act.SplitPane { direction = 'Right', size = {Percent = 30}},
  },
  {
    key = '|',
    mods = 'LEADER',
    action = act.SplitPane { direction = 'Down', size = {Percent = 30}},
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.SplitPane { direction = 'Right'},
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = act.SplitPane { direction = 'Up'},
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = act.SplitPane { direction = 'Down'},
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = act.SplitPane { direction = 'Left'},
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.CloseCurrentPane { confirm = true },
  },
  {
    key = 'm',
    mods = 'LEADER',
    action = act.PaneSelect {
      alphabet = 'asdfghjkl;',
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.PaneSelect {
      mode = 'SwapWithActive',
    },
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = act.ToggleFullScreen,
  },
  {
    key = ' ',
    mods = 'LEADER',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  {
    key = 'S',
    mods = 'LEADER',
    action = act.ShowLauncher
  },
  {
    key = '+',
    mods = 'CMD',
    action = act.ResetFontSize
  }
}

config.key_tables = {
  resize_pane = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'Escape', action = 'PopKeyTable' },
  },
}

return config

