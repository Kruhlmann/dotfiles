import os

from libqtile import layout
from libqtile.lazy import lazy
from libqtile.config import Key, Group, Click, Drag

TERMINAL = os.environ["TERMINAL"]
CMD_ROFI = "rofi -modi drun -show drun -display-drun 'Run'"
CMD_MAIM = "maim -sl -u -c 0.2,0.4,1.0,0.7 -b 0 | xclip -selection clipboard -t image/png"


class WorkSpaceProvider():
    """
    Initializes the qtile workspace list.
    """
    def __init__(self, workspace_dict: dict):
        self.workspace_dict = workspace_dict
        self.workspaces = self.__get_workspaces()

    def __get_workspaces(self) -> list:
        workspaces = []
        for label in self.workspace_dict.values():
            workspaces.append(Group(label))
        return workspaces


class KeyProvider:
    """
    Initializes the keyset for a qtile configuration.
    """
    def __init__(self, modifier: str, provider: WorkSpaceProvider):
        self.provider = provider
        self.modifier = modifier
        self.mod = [self.modifier]
        self.mod_shift = [self.modifier, "shift"]
        self.mod_ctrl = [self.modifier, "control"]
        self.mod_shift_ctrl = [self.modifier, "shift_control", "control"]

        window_keys = self.__get_window_keys()
        spawn_keys = self.__get_spawn_keys()
        meta_keys = self.__get_meta_keys()
        workspace_keys = self.__get_workspace_keys()

        self.keys = [*window_keys, *spawn_keys, *meta_keys, *workspace_keys]

    def __get_window_keys(self) -> list:
        """
        Creates a list of keys for navigating and manipulating windows.
        """
        KC_FOCUS_DOWN = Key(self.mod, "j", lazy.layout.down())
        KC_FOCUS_UP = Key(self.mod, "k", lazy.layout.up())
        KC_MOVE_DOWN = Key(self.mod, "j", lazy.layout.shuffle_up())
        KC_MOVE_UP = Key(self.mod, "k", lazy.layout.shuffle_down())
        KC_NEXT_LAYOUT = Key(self.mod, "Tab", lazy.next_layout())
        KC_PREV_LAYOUT = Key(self.mod_shift, "Tab", lazy.prev_layout())
        KC_KILL = Key(self.mod, "q", lazy.window.kill())

        return [
            KC_FOCUS_DOWN, KC_FOCUS_UP, KC_MOVE_DOWN, KC_MOVE_UP,
            KC_NEXT_LAYOUT, KC_PREV_LAYOUT, KC_KILL
        ]

    def __get_spawn_keys(self) -> list:
        KC_SPAWN_TERMINAL = Key(self.mod, "Return", lazy.spawn(TERMINAL))
        KC_SPAWN_ROFI = Key(self.mod, "d", lazy.spawn(CMD_ROFI))
        KC_SPAWN_MAIM = Key(self.mod_shift, "s", lazy.spawn(CMD_MAIM))

        return [KC_SPAWN_TERMINAL, KC_SPAWN_ROFI, KC_SPAWN_MAIM]

    def __get_meta_keys(self) -> list:
        KC_KILL_QTILE = Key(self.mod_shift, "q", lazy.shutdown())
        KC_RESTART_QTILE = Key(self.mod, "F2", lazy.restart())

        return [KC_KILL_QTILE, KC_RESTART_QTILE]

    def __get_workspace_keys(self) -> list:
        keys = []

        for key, label in self.provider.workspace_dict.items():
            key_goto = Key(self.mod, key, lazy.group[label].toscreen())
            key_move = Key(self.mod_shift, key, lazy.window.togroup(label))
            keys.append(key_goto)
            keys.append(key_move)

        return keys


class LayoutProvider():
    def __init__(self):
        self.layouts = [
            layout.MonadTall(),
            layout.Zoomy(),
        ]


class MouseProvider():
    MOUSE_LEFT = "Button1"
    MOUSE_MIDDLE = "Button2"
    MOUSE_RIGHT = "Button3"

    def __init__(self, modifier: str):
        self.mouse = [
            Drag([modifier],
                 self.MOUSE_LEFT,
                 lazy.window.set_position_floating(),
                 start=lazy.window.get_position()),
            Drag([modifier],
                 self.MOUSE_RIGHT,
                 lazy.window.set_size_floating(),
                 start=lazy.window.get_size()),
            Click([modifier], self.MOUSE_RIGHT, lazy.window.bring_to_front())
        ]
