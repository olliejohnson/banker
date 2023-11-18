host = "http://localhost:8000"
term.clear()
term.setCursorPos(1,1)
term.write("Enter Account Name: ")
local name = read()
term.write("Enter Pin: ")
local pin = read("*")
local recv = http.get(host.."/account/"..name.."/money/get/", {pin=pin}).readAll()
term.clear()
term.setCursorPos(1,1)
term.write("Current Account Balance: "..recv)
term.setCursorPos(1,2)
term.write("Amount To Deposit: ")
local dep = read()
http.post(host.."/account/"..name.."/money/deposit/", string.format('{"pin":"%s","deposit":%d}', pin, tonumber(dep)), {["Content-Type"]="application/json"})
shell.run("startup")