import os
import subprocess

from typing import List
from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import (
    Click,
    Drag,
    Group,
    Key,
    Match,
    Screen,
)
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key(
        [mod],
        "h",
        lazy.layout.left(),
        desc="Move focus to left",
    ),
    Key(
        [mod],
        "l",
        lazy.layout.right(),
        desc="Move focus to right",
    ),
    Key(
        [mod],
        "j",
        lazy.layout.down(),
        desc="Move focus down",
    ),
    Key(
        [mod],
        "k",
        lazy.layout.up(),
        desc="Move focus up"
        ),
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down",
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up",
    ),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        desc="Grow window down",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        desc="Grow window up",
    ),
    Key(
        [mod],
        "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes",
    ),

    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow(),
        desc="Grow window",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.shrink(),
        desc="Shrink window",
    ),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key(
        [mod],
        "Return",
        lazy.spawn(terminal),
        desc="Launch terminal",
    ),
    # Toggle between different layouts as defined below
    Key(
        [mod],
        "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts",
    ),
    Key(
        [mod],
        "q",
        lazy.window.kill(),
        desc="Kill focused window",
    ),
    Key(
        [mod, "control"],
        "r",
        lazy.restart(),
        desc="Restart Qtile",
    ),
    Key(
        [mod, "control"],
        "q",
        lazy.shutdown(),
        desc="Shutdown Qtile",
    ),
    Key(
        [mod],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget",
    ),
    # Applications
    Key(
        [mod],
        "p",
        lazy.spawn("rofi -show drun"),
        desc="run rofi",
    ),
    Key(
        [mod],
        "b",
        lazy.spawn("firefox"),
        desc="run firefox",
    ),
    Key(
        [mod], "d", lazy.spawn("deezer"), desc="run firefox"
    ),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="toggle fullscreen",
    ),
    Key(
        [mod],
        "m",
        lazy.window.toggle_maximize(),
        desc="toggle maximize",
    ),
    Key(
        [mod],
        "space",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout.",
    ),
    Key(
        [mod, "control"],
        "space",
        lazy.window.toggle_floating(),
        desc="Toggle floating mode.",
    ),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(
                    i.name, switch_group=True
                ),
                desc="Switch to & move focused window to group {}".format(
                    i.name
                ),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_options = {
    "margin": 16,
    "border_width": 3,
    "border_focus": "#d65d0e",
    "border_normal": "#4c566a",
    "border_on_single": True,
}

floating_options = {
    "border_width": 3,
    "border_focus": "#d65d0e",
    "border_normal": "#4c566a",
    "border_on_single": True,
}

layouts = [
    layout.MonadTall(**layout_options),
    # layout.Columns(**layout_options, num_columns=3),
    # layout.Floating(**floating_options),
    # layout.Tile(**layout_options),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(**layout_options),
    # layout.Matrix(**layout_options),
    # layout.MonadWide(),
    # layout.RatioTile(**layout_options),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Hack Nerd Font",
    fontsize=18,
    padding=8,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    padding=8,
                ),
                widget.Image(
                    filename="~/.config/qtile/icons/python.png",
                    scale="False",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            terminal
                        )
                    },
                    margin=4,
                ),
                widget.GroupBox(
                    inactive="#d8dee9",
                    active="#eceff4",
                    rounded=False,
                    highlight_method="block",
                    this_current_screen_border="#000000",
                ),
                widget.Prompt(),
                widget.WindowName(
                    max_chars = 60,
                ),
                widget.TextBox(
                        text = '',
                        fontsize = 18,
                ),
                widget.CheckUpdates(
                       update_interval = 1800,
                       distro = "Arch",
                       display_format = "{updates}",
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + '-e paru')},
                       font = "Hack Nerd Font",
                       no_update_string = 'N/A'
                ),
                widget.TextBox(
                        text = '',
                        fontsize = 16,
                ),
                widget.Memory(
                    format="{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}",
                    measure_mem="M",
                ),
                widget.KeyboardLayout(
                    configured_keyboards=["us", "ru"]
                ),
                widget.Clock(format="%a %b %d, %H:%M"),
                widget.Systray(padding = [0, 4, 0, 0]),
                # widget.CurrentLayout(),
                # widget.CurrentLayoutIcon(
                #     padding=4, scale=0.9
                # ),
            ],
            32,
            background="#282828",
            margin=[0, -4, 0, -4],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([mod], "Button5", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="Friends List"),
    ], **layout_options
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser(
        "~/.config/qtile/autostart.sh"
    )
    subprocess.call([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
