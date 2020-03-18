# pylint: skip-file
from imports import colors
from imports import binds
from imports import aliases
from imports import javascript
from imports import user_agent
from imports import content
from imports import fonts
from imports import layout

aliases.apply(c)
colors.apply(c)
javascript.apply(c)
fonts.apply(c)
layout.apply(c)
binds.apply(config)
user_agent.apply(config)
content.apply(config, c)

c.auto_save.session = True
c.search.ignore_case = "smart"
c.downloads.location.directory = "~/dl"
c.url.searchengines = {
    "DEFAULT": "https://google.com/search?q={}",
}
c.editor.command = ["kitty", "nvim", "{file}", "+norm {line}G{column}|"]
