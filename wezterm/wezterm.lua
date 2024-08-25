local wezterm = require 'wezterm'
local home = os.getenv("HOME")
return {
    hide_tab_bar_if_only_one_tab = true,
    -- color_scheme = 'One Half Black (Gogh)',
    color_scheme = 'tokyonight',
    -- color_scheme = 'Catppuccin Mocha',
    -- color_scheme = 'Flexoki Light',
    -- color_scheme = 'Ubuntu',
    -- color_scheme = 'Roya',
    -- color_scheme = 'Dracula+',
    -- color_scheme = 'Github Dark',
    -- color_scheme = 'hardhacker',
    -- font = wezterm.font('JetBrainsMono Nerd Font'),
    font = wezterm.font('JetBrainsMono Nerd Font', {weight = 'Bold'}),
    -- font = wezterm.font('FantasqueSansMNerdFontMono', {weight = 'Bold'}),
    -- font = wezterm.font('Monaspace Radon Var', {weight = 1600}),
    -- font = wezterm.font("Monaspace Krypton Var", {weight=1600}),
    -- font = wezterm.font("Monaspace Argon", {weight=800, stretch="Normal"}),
    -- font = wezterm.font("Monaspace Xenon", {weight="Black", stretch="Normal"}),
    -- font = wezterm.font("JetBrainsMono Nerd Font Mono", {weight='Black'}),
    -- font = wezterm.font("UbuntuMono Nerd Font Mono", {weight='Bold'}),
    -- font = wezterm.font("FiraCode Nerd Font", {weight="Bold"}),
    -- font = wezterm.font("SauceCodePro Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
    font_size = 16,
    colors = {
      cursor_bg = "white",
      cursor_fg = "Black",
    },
    default_cursor_style = 'SteadyUnderline',
    leader = { key = "e", mods = "CTRL" },
    check_for_updates = false,
    hide_mouse_cursor_when_typing = true,
    window_padding = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0,
    },
    mouse_bindings = {
        {
          event = { Down = { streak = 1, button = 'Right' } },
          mods = 'NONE',
          action =  wezterm.action.SendString 'woot',
        },

        -- Change the default click behavior so that it only selects
        -- text and doesn't open hyperlinks
        {
          event = { Up = { streak = 1, button = 'Left' } },
          mods = 'NONE',
          action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection',
        },

        -- and make CTRL-Click open hyperlinks
        {
          event = { Up = { streak = 1, button = 'Left' } },
          mods = 'CTRL',
          action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },

    -- window_background_opacity = 0.85,
    enable_wayland = true,
    front_end = "OpenGL",
    keys = {
        { key = "o",   mods = "LEADER",       action = wezterm.action.ToggleFullScreen },
        { key = "`",   mods = "LEADER|CTRL",  action = wezterm.action { SendString = "`" } },
        { key = "V",   mods = "CTRL",         action = wezterm.action { PasteFrom = "Clipboard" } },
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

        { key = "1",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '1'}),} },
        { key = "2",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '2'}),} },
        { key = "3",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '3'}),} },
        { key = "4",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '4'}),} },
        { key = "5",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '5'}),} },
        { key = "6",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '6'}),} },
        { key = "7",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '7'}),} },
        { key = "8",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '8'}),} },
        { key = "9",   mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = '9'}),} },
        { key = "Delete", mods = "CTRL",       action = wezterm.action.Multiple
                                            { wezterm.action.SendKey({ key = 'Space', mods = 'CTRL'}),
                                              wezterm.action.SendKey({ key = 'x'})} },
    },

}
