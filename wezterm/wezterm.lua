local wezterm = require 'wezterm'
local home = os.getenv("HOME")
return {
    hide_tab_bar_if_only_one_tab = true,
    color_scheme = "tokyonight",
    font = wezterm.font('JetBrainsMono Nerd Font', {weight = 'Bold'}),
    font_size = 14.0,
    leader = { key = "x", mods = "CTRL" },
    check_for_updates = false,

    -- background = {
    --   -- This is the deepest/back-most layer. It will be rendered first
    --   {
    --     source = {
    --       File = home .. '/wallpaper/OceanGirl.jpg',
    --     },
    --     -- The texture tiles vertically but not horizontally.
    --     -- When we repeat it, mirror it so that it appears "more seamless".
    --     -- An alternative to this is to set `width = "100%"` and have
    --     -- it stretch across the display
    --     repeat_x = 'NoRepeat',
    --     repeat_y = 'NoRepeat',
    --     hsb = {
    --         -- Darken the background image by reducing it to 1/3rd
    --         brightness = 0.05,
    --         -- You can adjust the hue by scaling its value.
    --         -- a multiplier of 1.0 leaves the value unchanged.
    --         hue = 1.0,
    --         -- You can adjust the saturation also.
    --         saturation = 1.0,
    --     },
    --     horizontal_align = 'Center',
    --   },
    -- },

    keys = {
        { key = "o",   mods = "LEADER",       action = wezterm.action.ToggleFullScreen },
        { key = "`",   mods = "LEADER|CTRL",  action = wezterm.action { SendString = "`" } },
        { key = "v",   mods = "CTRL",         action = wezterm.action { PasteFrom = "Clipboard" } },
        { key = "\"",   mods = "LEADER|SHIFT",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "%",   mods = "LEADER|SHIFT",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "c",   mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
        { key = "h",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "k",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "l",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = ",",   mods = "LEADER",       action = "ShowLauncher" },
        { key = "b",   mods = "LEADER",       action = "ShowTabNavigator" },
        { key = "f",   mods = "LEADER",       action = "QuickSelect" },
        { key = "\t",  mods = "LEADER",       action = "ActivateLastTab" },
        { key = "1",   mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
        { key = "2",   mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
        { key = "3",   mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
        { key = "4",   mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
        { key = "5",   mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
        { key = "6",   mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
        { key = "7",   mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
        { key = "8",   mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
        { key = "9",   mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
        -- { key = "l", mods = "LEADER",       action=wezterm.action{EmitEvent="toggle-ligature"}},
        { key = "n",   mods = "LEADER",       action = wezterm.action { ActivateTabRelative = 1 } },
        { key = "p",   mods = "LEADER",       action = wezterm.action { ActivateTabRelative = -1 } },
        { key = "&",   mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
        { key = "x",   mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
        { key = "w",   mods = "ALT",          action = wezterm.action({ CopyTo = "Clipboard" }) },
        { key = "y",   mods = "CTRL",         action = wezterm.action({ PasteFrom = "Clipboard" }) },
        { key = "Tab", mods = "LEADER",       action = wezterm.action({ ActivateTabRelative = 1 }) },
    },

}
