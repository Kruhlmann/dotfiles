c_bg = "#282828"
c_fg = "#dbdbb2"
c_bg_hl = "#504945"
c_fg_hl = "#fbf1c7"
c_bg_red = "#cc241d"
c_fg_red = "#fb4934"
c_bg_green = "#98971a"
c_fg_green = "#b8bb26"
c_bg_yellow = "#d79921"
c_fg_yellow = "#fabd2f"
c_bg_blue = "#458588"
c_fg_blue = "#83a598"
c_bg_purple = "#b16286"
c_fg_purple = "#d3869b"

# UA
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')

# Flags
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# Bindings
config.bind("yp", "spawn mpv --force-window yes {url}")
config.bind("yh", "hint links spawn mpv --force-window yes {hint-url}")

# Layout
c.tabs.position = "top"

# Colors
c.colors.contextmenu.menu.bg = c_bg
c.colors.contextmenu.menu.fg = c_fg
c.colors.contextmenu.selected.bg = c_bg_hl
c.colors.contextmenu.selected.fg = c_fg_hl

c.colors.downloads.bar.bg = c_bg
c.colors.downloads.error.bg = c_bg
c.colors.downloads.error.fg = c_fg_red
c.colors.downloads.start.bg = c_bg
c.colors.downloads.start.fg = c_fg_blue
c.colors.downloads.stop.bg = c_bg
c.colors.downloads.stop.fg = c_fg_yellow

c.colors.hints.bg = c_bg
c.colors.hints.fg = c_fg
c.colors.hints.match.fg = c_bg

c.colors.messages.error.bg = c_bg
c.colors.messages.error.fg = c_fg_red
c.colors.messages.error.border = c_fg_red
c.colors.messages.info.bg = c_bg
c.colors.messages.info.fg = c_fg_blue
c.colors.messages.info.border = c_fg_blue
c.colors.messages.warning.bg = c_bg
c.colors.messages.warning.fg = c_fg_yellow
c.colors.messages.warning.border = c_fg_yellow

c.colors.prompts.bg = c_bg
c.colors.prompts.border = c_bg_hl
c.colors.prompts.fg = c_fg
c.colors.prompts.selected.bg = c_bg_hl
c.colors.statusbar.caret.bg = c_bg_purple
c.colors.statusbar.caret.fg = c_fg
c.colors.statusbar.caret.selection.bg = c_fg_purple
c.colors.statusbar.caret.selection.fg = c_fg
c.colors.statusbar.command.bg = c_bg_blue
c.colors.statusbar.command.fg = c_fg
c.colors.statusbar.command.private.bg = c_fg_blue
c.colors.statusbar.command.private.fg = c_fg
c.colors.statusbar.insert.bg = c_bg_green
c.colors.statusbar.insert.fg = c_fg

# Behavior
c.auto_save.session = True
