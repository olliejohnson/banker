fs.copy("disk/install.lua", "/install.lua")
fs.copy("disk/remove.lua", "/remove.lua")
fs.copy("disk/system.lua", "/startup.lua")
fs.copy("disk/system.lua", "/instmgr.lua")
fs.move("disk/startup.lua", "disk/disabled.startup.lua")
os.reboot()