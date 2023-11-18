repo = "https://raw.githubusercontent.com/olliejohnson/banker/main/"

function getFile(file)
    local data = http.get(repo..file).readAll()
    local file = fs.open(file, "w")
    file.write(data)
    file.close()
end

getFile("system.lua")
getFile("startup.lua")
getFile("remove.lua")
getFile("install.lua")
getFile("install_media/startup.lua")
getFile("install_media/calls/withdrawal.lua")
getFile("install_media/calls/deposit.lua")
getFile("install_media/calls/add.lua")
getFile("install_media/calls/remove.lua")