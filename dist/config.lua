-- My hotkeys
-- 窗口管理
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'H', 'Lefthalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfleft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'L', 'Righthalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfright") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'K', 'Uphalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfup") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'J', 'Downhalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfdown") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Y', 'Lefttwothirds of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("twothirdsleft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'U', 'Leftonethirds of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("onethirdsleft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'I', 'Centeronethirds of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("onethirdscenter") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'O', 'Rightonethirds of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("onethirdsright") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'P', 'Righttwothirds of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("twothirdsright") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'F', 'Fullscreen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("fullscreen") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'G', 'Maximize', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("maximize") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'C', 'Center Window', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("center") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'space', 'Move to Next Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("next") end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'E', 'Focus Top Window', function() focusWindow("top") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'X', 'Focus Bottom Window', function() focusWindow("bottom") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'Z', 'Focus Left Window', function() focusWindow("left") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'V', 'Focus Right Window', function() focusWindow("right") end)
-- Move cursor
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'W', 'Move Cursor to TopLeft', function() moveCursor("topLeft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'E', 'Move Cursor to TopLeft', function() moveCursor("top") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'R', 'Move Cursor to TopLeft', function() moveCursor("topRight") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'S', 'Move Cursor to TopLeft', function() moveCursor("left") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'D', 'Move Cursor to Center', function() moveCursor("center") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'F', 'Move Cursor to TopLeft', function() moveCursor("right") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'X', 'Move Cursor to TopLeft', function() moveCursor("bottomLeft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'C', 'Move Cursor to TopLeft', function() moveCursor("bottom") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'V', 'Move Cursor to TopLeft', function() moveCursor("bottomRight") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'A', 'Move Cursor to Next Screen', function() moveCursorNextScreen() end)

function focusWindow(option)
    local cwin = hs.window.focusedWindow()
    if option == "top" then
        cwin:focusWindowNorth()
    elseif option == "bottom" then
        cwin:focusWindowSouth()
    elseif option == "left" then
        cwin:focusWindowWest()
    elseif option == "right" then
        cwin:focusWindowEast()
    end
end

function moveCursorNextScreen()
    local cscreen = hs.mouse.getCurrentScreen()
    local cres = cscreen:next():fullFrame()
    local x = cres.x
    local y = cres.y
    local w = cres.w
    local h = cres.h
    hs.mouse.setAbsolutePosition({x=x+w/2, y=y+h/2})
end

function moveCursor(option)
    local cwin = hs.window.focusedWindow()
    local wf = cwin:frame()
    local cscreen = cwin:screen()
    local cres = cscreen:fullFrame()
    local x = cres.x
    local y = cres.y
    local w = cres.w
    local h = cres.h
    if cwin then
        x = wf.x
        y = wf.y
        w = wf.w
        h = wf.h
    end
    if option == "top" then
        hs.mouse.setAbsolutePosition({x=x+w/2, y=y+h/6})
    elseif option == "bottom" then
        hs.mouse.setAbsolutePosition({x=x+w/2, y=y+h*5/6})
    elseif option == "left" then
        hs.mouse.setAbsolutePosition({x=x+w/6, y=y+h/2})
    elseif option == "right" then
        hs.mouse.setAbsolutePosition({x=x+w*5/6, y=y+h/2})
    elseif option == "topLeft" then
        hs.mouse.setAbsolutePosition({x=x+w/6, y=y+h/6})
    elseif option == "topRight" then
        hs.mouse.setAbsolutePosition({x=x+w*5/6, y=y+h/6})
    elseif option == "bottomLeft" then
        hs.mouse.setAbsolutePosition({x=x+w/6, y=y+h*5/6})
    elseif option == "bottomRight" then
        hs.mouse.setAbsolutePosition({x=x+w*5/6, y=y+h*5/6})
    elseif option == "center" then
        hs.mouse.setAbsolutePosition({x=x+w/2, y=y+h/2})
    end
end
