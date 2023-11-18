os.pullEvent = os.pullEventRaw

host = "http://localhost:8000"

local accounts = {}

local w,h = term.getSize()

function printCentered(y, s)
    local x = math.floor((w - string.len(s)) / 2)
    term.setCursorPos(x, y)
    term.clearLine()
    term.write(s)
end

local nOption = 1

local function drawMenu()
    term.clear()
    term.setCursorPos(1, 1)
    term.write("OliverJ Banking Systems")

    term.setCursorPos(w-13, 1)
    if nOption == 1 then
        term.write("Add Account")
    elseif nOption == 2 then
        term.write("Deposit Money")
    elseif nOption == 3 then
        term.write("Withdraw Money")
    elseif nOption == 4 then
        term.write("Remove Account")
    elseif nOption == 5 then
        term.write("Shutdown")
    elseif nOption == 6 then
        term.write("Remove")
    else
    end
end

term.clear()
local function drawFrontend()
    printCentered(math.floor(h/2) - 3, "")
    printCentered(math.floor(h/2) - 2, "Account Menu")
    printCentered(math.floor(h/2) - 1, "")
    printCentered(math.floor(h/2) + 0, ((nOption == 1) and "[ Add Account ]") or "Add Account")
    printCentered(math.floor(h/2) + 1, ((nOption == 2) and "[ Deposit Money ]") or "Deposit Money")
    printCentered(math.floor(h/2) + 2, ((nOption == 3) and "[ Withdraw Money ]") or "Withdraw Money")
    printCentered(math.floor(h/2) + 3, ((nOption == 4) and "[ Remove Account ]") or "Remove Account")
    printCentered(math.floor(h/2) + 4, ((nOption == 5) and "[ Shutdown ]") or "Shutdown")
    printCentered(math.floor(h/2) + 5, ((nOption == 6) and "[ Remove ]") or "Remove")
end

drawMenu()
drawFrontend()

while true do
    local e, key = os.pullEvent("key")
    if key == keys.w or key == keys.up then
        if nOption >  1 then
            nOption = nOption - 1
            drawMenu()
            drawFrontend()
        end
    elseif key == keys.s or key == keys.down then
        if nOption < 6 then
            nOption = nOption + 1
            drawMenu()
            drawFrontend()
        end
    elseif key == keys.enter then
        break
    end
end

term.clear()

if nOption == 1 then
    shell.run("calls/add")
elseif nOption == 2 then
    shell.run("calls/deposit")
elseif nOption == 3 then
    shell.run("calls/withdrawal")
elseif nOption == 4 then
    shell.run("calls/remove")
elseif nOption == 5 then
    os.shutdown()
elseif nOption == 6 then
    shell.run("/instmgr.lua")
end