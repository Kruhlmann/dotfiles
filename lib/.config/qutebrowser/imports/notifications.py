allowed = [
    "mo-gitlab.siemens.dk",
]

blocked = [
]

config.set("content.notifications", "ask")

for host in allowed:
    config.set("content.notifications", True, "*://%s")
    config.set("content.notifications", True, "*://*.%s")
