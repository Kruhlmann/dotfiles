# pylint: skip-file

def apply(config, c):
    config.set("content.images", True, "chrome-devtools://*")
    config.set("content.images", True, "devtools://*")
    config.set("content.javascript.enabled", True, "chrome-devtools://*")
    config.set("content.javascript.enabled", True, "devtools://*")
    config.set("content.javascript.enabled", True, "chrome://*/*")
    config.set("content.javascript.enabled", True, "qute://*/*")
    c.content.dns_prefetch = True
    c.content.headers.do_not_track = True
    c.content.local_content_can_access_file_urls = True
    c.content.local_content_can_access_remote_urls = False
    c.content.local_storage = True
    c.content.pdfjs = True
    c.content.default_encoding = "utf-8"
    c.content.geolocation = "ask" 
