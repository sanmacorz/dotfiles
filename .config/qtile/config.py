#Background = "#282a36"
#Current Line = "#44475a"
#Selection = "#44475a"
#Foreground = "#f8f8f2"
#Comment = "#6272a4"
#Cyan = "#8be9fd"
#Green = "#50fa7b"
#Orange = "#ffb86c"
#Pink = "#ff79c6"
#Purple = "#bd93f9"
#Red = "#ff5555"
#Yellow = "#f1fa8c"

import os
import subprocess
from typing import List
from libqtile import bar, layout, widget, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

mod = "mod1"
terminal = "alacritty"

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "p", lazy.spawn("rofi -show run"), desc="Launch rofi in run mode"),
    Key([mod, "shift"], "q", lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu"), desc="Launch rofi in power menu mode"), 
    Key([mod], "Right", lazy.spawn("sudo echo $((VALUE + 5)) > /sys/class/backlight/amdgpu_bl0/brightness"), desc="Increase the backlight of the screen"),
    Key([mod], "Left", lazy.spawn("sudo echo $((VALUE - 5)) > /sys/class/backlight/amdgpu_bl0/brightness"), desc="Decrease the backlight of the screen")
    # XF86MonBrightnessUp
    # XF86MonBrightnessDown
]

group_names = '       響  '.split()
groups = [Group(name, layout='max') for name in group_names]

for i, name in enumerate(group_names):
    indx = str(i + 1)
    keys += [
        Key([mod], indx, lazy.group[name].toscreen()),
        Key([mod, 'shift'], indx, lazy.window.togroup(name))]

layouts = [
    layout.Tile(border_focus="#ffffff"),
    layout.Max()
]

widget_defaults = dict(
    font='UbuntuMono Nerd Font Mono',
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(fontsize=30),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(chords_colors={'launch': ("#ff0000", "#ffffff"),}, name_transform=lambda name:name.upper(),),
		        widget.CPU(format=" {load_percent}%"),
                widget.Memory(),
                widget.BatteryIcon(),
                widget.Systray(),
                widget.Clock(format="%d/%m/%Y %I:%M %p"),
            ],
            24,
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"
