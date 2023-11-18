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
    term.write("OliverJ Install System")

    term.setCursorPos(w-11, 1)
    if nOption == 1 then
        term.write("Install")
    elseif nOption == 2 then
        term.write("Remove")
    else
    end
end

term.clear()
local function drawFrontend()
    printCentered(math.floor(h/2) - 3, "")
    printCentered(math.floor(h/2) - 2, "Account Menu")
    printCentered(math.floor(h/2) - 1, "")
    printCentered(math.floor(h/2) + 0, ((nOption == 1) and "[ Install ]") or "Install")
    printCentered(math.floor(h/2) + 1, ((nOption == 2) and "[ Remove ]") or "Remove")
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
        if nOption < 2 then
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
    shell.run("install")
elseif nOption == 2 then
    shell.run("remove")
end