local wezterm = require('wezterm')
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font('JetBrainsMono Nerd Font')

config.keys = {
  {
    key = 'Space',
    mods = 'CTRL',
    action = wezterm.action.ActivateKeyTable {
      name = 'table_mode',
      one_shot = false,
      timeout_milliseconds = 1000,
    },
  },
}
config.key_tables = {
  table_mode = {
    -- New Tab/Pane
    { key = 'v', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'v', mods = 'SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 't', action = act.SpawnTab('CurrentPaneDomain') },

    -- Close Tab/Pane
    { key = 'w', action = act.CloseCurrentTab { confirm = true } },
    { key = 'd', action = act.CloseCurrentPane { confirm = true } },

    -- Select Pane
    { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },

    -- Resize
    { key = 'LeftArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', mods = 'SHIFT', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', mods = 'SHIFT', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', mods = 'SHIFT', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', mods = 'SHIFT', action = act.AdjustPaneSize { 'Down', 1 } },

    -- Move
    { key = 'r', action = act.RotatePanes 'Clockwise' },
    { key = 'r', mods = 'SHIFT', action = act.RotatePanes 'CounterClockwise' },

    -- Select Tab
    { key = 'LeftArrow', mods = 'ALT', action = act.ActivateTabRelative(-1) },
    { key = 'h', mods = 'ALT', action = act.ActivateTabRelative(-1) },

    { key = 'RightArrow', mods = 'ALT', action = act.ActivateTabRelative(1) },
    { key = 'l', mods = 'ALT', action = act.ActivateTabRelative(1) },
  }
}

return config
