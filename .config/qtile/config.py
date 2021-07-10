import os
import subprocess
from pathlib import Path
from time import time
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.command import lazy


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])


def screenshot(save=True, copy=True, selection=None, full=None):
    def file(qtile):
        if full:
            path = Path.home() / 'Pictures' / 'Screenshots'
            path /= f'{str(int(time() * 100))}.png'
            shot = subprocess.run(['maim'], stdout=subprocess.PIPE)
        if selection:
            path = Path.home() / 'Pictures' / 'Screenshots'
            path /= f'{str(int(time() * 100))}.png'
            shot = subprocess.run(['maim', '--select'], stdout=subprocess.PIPE)
        if save:
            with open(path, 'wb') as sc:
                sc.write(shot.stdout)
        if copy:
            subprocess.run(['xclip', '-selection', 'clipboard', '-t',
                            'image/png'], input=shot.stdout)
    return file


def brightness(state):
    def file(qtile):
        file = open("/sys/class/backlight/amdgpu_bl0/brightness", "r")
        value = int(file.read())
        if state == "up":
            if value > 250:
                pass
            else:
                value = (value + 5)
        elif state == "down":
            if value < 5:
                pass
            else:
                value = (value - 5)
        else:
            pass
        file = open("/sys/class/backlight/amdgpu_bl0/brightness", "w")
        file.write(str(value))
        file.close()
    return file


mod = "mod1"
terminal = "alacritty"
browser = "brave"
file_manager = "pcmanfm"

# background = "#282a36"
# current_line = "#44475a"
# selection = "#44475a"
# foreground = "#f8f8f2"
# comment = "#6272a4"
# cyan = "#8be9fd"
# green = "#50fa7b"
# orange = "#ffb86c"
# pink = "#ff79c6"
# purple = "#bd93f9"
# red = "#ff5555"
# yellow = "#f1fa8c"

keys = [
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "control"], "l", lazy.spawn("dm-tool switch-to-greeter")),
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "c", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod], "p", lazy.spawn("rofi -show drun")),
    Key([mod, "shift"], "q", lazy.spawn(
        "rofi -show power-menu -modi power-menu:rofi-power-menu")),
    Key([mod], "Right", lazy.function(brightness("up"))),
    Key([mod], "Left", lazy.function(brightness("down"))),
    Key([mod], "b", lazy.spawn(browser)),
    Key(['shift'], 'Print', lazy.function(
        screenshot(selection=False, full=True))),
    Key([], 'Print', lazy.function(screenshot(selection=True, full=False))),
]

groups = [Group(i) for i in "123456"]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])

layout_theme = {"border_width": 3,
                "margin": 10,
                "border_focus": "#ff79c6",
                "border_normal": "#8be9fd"}

layouts = [
    layout.Tile(**layout_theme),
    layout.Max(**layout_theme)
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    font="SF Pro Display",
                    fontsize=18,
                    highlight_method="block",
                    rounded=True,
                    padding_x=4,
                    padding_y=1,
                    active="#f8f8f2",
                    inactive="#44475a",
                    this_current_screen_border="#6272a4",
                    urgent_border="#ff79c6",
                    disable_drag=True,
                    margin_x=5,
                    spacing=10
                ),
                widget.Sep(
                    linewidth=0,
                    padding=10
                ),
                widget.WindowName(
                    font="SF Pro Display",
                    fontsize=18,
                    format="[ {name} ]",
                    max_chars=100,
                    foreground="#f8f8f2",
                    background="#6272a4"
                ),
                widget.Spacer(),
                widget.Systray(),
                widget.TextBox(
                    text="│",
                    fontsize=14,
                    padding=5,
                    foreground="#f8f8f2"
                ),
                widget.TextBox(
                    text="",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#ff5555"
                ),
                widget.CPU(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#f8f8f2",
                    format="CPU {load_percent}%"
                ),
                widget.TextBox(
                    text="  ",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#50fa7b"
                ),
                widget.Memory(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#f8f8f2",
                    format="{MemUsed: } /{MemTotal: } MB"
                ),
                widget.TextBox(
                    text="  ",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#8be9fd"
                ),
                widget.PulseVolume(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#f8f8f2"
                ),
                widget.Battery(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#f8f8f2",
                    unknown_char="    ",
                    charge_char="   ",
                    full_char="   ",
                    discharge_char="    ",
                    low_foreground="fd971f",
                    low_percentage=0.30,
                    format="{char} {percent:2.0%}"
                ),
                widget.TextBox(
                    text="  ",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="#ff79c6"
                ),
                widget.Clock(
                    font="SF Pro Display",
                    fontsize=18,
                    format="%d/%m/%Y    %I:%M:%S %p",
                    foreground="#f8f8f2"
                ),
                widget.Sep(
                    linewidth=0,
                    padding=10
                )
            ],
            30,
            background="#282a36",
            opacity=1,
            margin=[0, 0, 0, 0]
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
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"
