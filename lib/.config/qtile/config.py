import os
from typing import List

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy

from includes import KeyProvider, WorkSpaceProvider, LayoutProvider, MouseProvider

# Required constants.
MOD_KEY = "mod4"
# MOD_KEY = os.environ["MOD_KEY"]
WORKSPACES = {"1": "Browser", "2": "Dev", "3": "Discord"}

# Providers.
workspace_provider = WorkSpaceProvider(WORKSPACES)  # Workspace definitions.
key_provider = KeyProvider(MOD_KEY, workspace_provider)  # Keyboard shortcuts.
layout_provider = LayoutProvider()  # Windiw layouts.
mouse_provider = MouseProvider(MOD_KEY)  # Windiw layouts.

# QTile assignments.
keys = key_provider.keys
layouts = layout_provider.layouts
mouse = mouse_provider.mouse

# widget_defaults = dict(
# font='FiraCode Nerd Font',
# fontsize=13,
# padding=3,
# )
# extension_defaults = widget_defaults.copy()

# screens = [
# Screen(bottom=bar.Bar(
# [
# widget.CurrentLayout(),
# widget.GroupBox(),
# widget.Prompt(),
# widget.WindowName(),
# widget.Chord(
# chords_colors={
# 'launch': ("#ff0000", "#ffffff"),
# },
# name_transform=lambda name: name.upper(),
# ),
# widget.TextBox("default config", name="default"),
# widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
# widget.Systray(),
# widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
# widget.QuickExit(),
# ],
# 24,
# ), ),
# ]

# # Drag floating layouts.
# mouse = [
# Drag([MOD_KEY],
# "Button1",
# lazy.window.set_position_floating(),
# start=lazy.window.get_position()),
# Drag([MOD_KEY],
# "Button3",
# lazy.window.set_size_floating(),
# start=lazy.window.get_size()),
# Click([MOD_KEY], "Button2", lazy.window.bring_to_front())
# ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {
        'wmclass': 'confirm'
    },
    {
        'wmclass': 'dialog'
    },
    {
        'wmclass': 'download'
    },
    {
        'wmclass': 'error'
    },
    {
        'wmclass': 'file_progress'
    },
    {
        'wmclass': 'notification'
    },
    {
        'wmclass': 'splash'
    },
    {
        'wmclass': 'toolbar'
    },
    {
        'wmclass': 'confirmreset'
    },  # gitk
    {
        'wmclass': 'makebranch'
    },  # gitk
    {
        'wmclass': 'maketag'
    },  # gitk
    {
        'wname': 'branchdialog'
    },  # gitk
    {
        'wname': 'pinentry'
    },  # GPG key password entry
    {
        'wmclass': 'ssh-askpass'
    },  # ssh-askpass
    {
        'wmclass': 'floatterm'
    }
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"
