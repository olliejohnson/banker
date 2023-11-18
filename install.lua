fs.delete("/startup.lua")
fs.copy("disk/install_media/startup.lua", "/startup.lua")
fs.copy("disk/install_media/calls/", "/calls/")
os.reboot()