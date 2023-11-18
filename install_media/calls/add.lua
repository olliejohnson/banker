host = "http://matrix.oliverj.io:8000"
term.clear()
term.setCursorPos(1,1)
term.write("Enter Account Name: ")
local name = read()
term.write("Enter Pin: ")
local pin = read("*")
http.post(host.."/accounts/add/", string.format('{"account":"%s","pin":"%s"}', name, pin), {["Content-Type"]="application/json"})
shell.run("startup")