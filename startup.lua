fs.copy("disk/install.lua", "/install.lua")
fs.copy("disk/remove.lua", "/remove.lua")
fs.copy("disk/system.lua", "/startup.lua")
fs.copy("disk/system.lua", "/instmgr.lua")
disk.eject("top")
disk.eject("left")
disk.eject("right")
disk.eject("front")
disk.eject("back")
disk.eject("bottom")
os.reboot()