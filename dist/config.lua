-- 窗口管理
-- 二分屏
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'H', 'Lefthalf of Screen',
 function() moveAndResize("halfleft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'L', 'Righthalf of Screen',
 function() moveAndResize("halfright") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'K', 'Uphalf of Screen',
 function() moveAndResize("halfup") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'J', 'Downhalf of Screen',
 function() moveAndResize("halfdown") end)

-- 三分屏
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Y', 'Lefttwothirds of Screen',
 function() moveAndResize("twothirdsleft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'U', 'Leftonethirds of Screen',
 function() moveAndResize("onethirdsleft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'I', 'Centeronethirds of Screen',
 function() moveAndResize("onethirdscenter") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'O', 'Rightonethirds of Screen',
 function() moveAndResize("onethirdsright") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'P', 'Righttwothirds of Screen',
 function() moveAndResize("twothirdsright") end)

-- 四分屏
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, '1', 'TopLeft of Screen',
 function() moveAndResize("cornerNW") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, '2', 'TopRight of Screen',
 function() moveAndResize("cornerNE") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, '3', 'BottomLeft of Screen',
 function() moveAndResize("cornerSW") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, '4', 'BottomRight of Screen',
 function() moveAndResize("cornerSE") end)

-- 缩放
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, '5', 'Expand Window',
 function() moveAndResize("expand") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, '6', 'Shrink Window',
 function() moveAndResize("shrink") end)

-- 全屏及最大化
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'G', 'Fullscreen',
 function() moveAndResize("fullscreen") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'F', 'Maximize',
 function() moveAndResize("maximize") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'C', 'Center Window',
 function() moveAndResize("center") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'space', 'Move to Next Monitor',
 function() moveToScreen("next") end)

 -- 聚焦其他窗口
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'E', 'Focus Top Window',
 function() focusWindow("top") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'X', 'Focus Bottom Window',
 function() focusWindow("bottom") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'Z', 'Focus Left Window',
 function() focusWindow("left") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'V', 'Focus Right Window',
 function() focusWindow("right") end)

 -- 移动光标
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'W', 'Move Cursor to TopLeft',
 function() moveCursor("topLeft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'E', 'Move Cursor to TopLeft',
 function() moveCursor("top") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'R', 'Move Cursor to TopLeft',
 function() moveCursor("topRight") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'S', 'Move Cursor to TopLeft',
 function() moveCursor("left") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'D', 'Move Cursor to Center',
 function()
    --[[ local mpos = hs.mouse.getAbsolutePosition()
    local cscreen = hs.mouse.getCurrentScreen()
    local cres = cscreen:fullFrame()
    local rect = hs.geometry.rect(cres.x + cres.w/2, cres.y + cres.h/2, 10, 10)
    if contains(rect, mpos) then
        moveCursorNextScreen()
    else ]]
        moveCursor("center")
    -- end
 end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'F', 'Move Cursor to TopLeft',
 function() moveCursor("right") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'X', 'Move Cursor to TopLeft',
 function() moveCursor("bottomLeft") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'C', 'Move Cursor to TopLeft',
 function() moveCursor("bottom") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'V', 'Move Cursor to TopLeft',
 function() moveCursor("bottomRight") end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'A', 'Move Cursor to Next Screen',
 function() moveCursorNextScreen() end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'B', 'Show Cursor',
 function() showMouse() end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Z', 'Center Cursor',
 function() centerCursor() end)

-- 显示键盘模式
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '1', 'Show Mode Icon 1', function() showMode(1) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '2', 'Show Mode Icon 1', function() showMode(2) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '3', 'Show Mode Icon 1', function() showMode(3) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '4', 'Show Mode Icon 1', function() showMode(4) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '5', 'Show Mode Icon 1', function() showMode(5) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '6', 'Show Mode Icon 1', function() showMode(6) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '7', 'Show Mode Icon 1', function() showMode(7) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '8', 'Show Mode Icon 1', function() showMode(8) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '9', 'Show Mode Icon 1', function() showMode(9) end)
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, '0', 'Show Mode Icon 1', function() showMode(0) end)

-- 切换深色模式
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'tab', 'Toggle Dark Mode',
 function() toggleTheme() end)

function toggleTheme()
    local success, darkMode = hs.osascript.applescript('tell application "System Events" to tell appearance preferences to get dark mode')
    if darkMode then
        hs.osascript.applescript('tell application "System Events" to tell appearance preferences to set dark mode to false')
    else
        hs.osascript.applescript('tell application "System Events" to tell appearance preferences to set dark mode to true')
    end
end

--[[ 聚焦相对位置的窗口 ]]
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
    centerCursor()
end

--[[ 移动鼠标到下一个屏幕 ]]
function moveCursorNextScreen()
    local cscreen = hs.mouse.getCurrentScreen()
    local cres = cscreen:next():fullFrame()
    local x = cres.x
    local y = cres.y
    local w = cres.w
    local h = cres.h
    hs.mouse.setAbsolutePosition({x=x+w/2, y=y+h/2})
    focusWindowTop()
    showMouse()
end

--[[ 聚焦当前屏幕最前面的窗口 ]]
function focusWindowTop()
    local cscreen = hs.mouse.getCurrentScreen()
    local cpos = hs.mouse.getAbsolutePosition()
    local windows = hs.window.orderedWindows()
    local focused = true
    for i, window in ipairs(windows) do
        local wrect = window:frame()
        if contains(wrect, cpos) then
            window:focus()
            focused = false
            break
        end
    end
    if (focused) then
        hs.window.desktop():focus()
    end
end

function contains(rect, pos)
    return pos.x >= rect.x and pos.y >= rect.y and pos.x <= rect.x + rect.w and pos.y <= rect.y + rect.h
end

--[[ 显示鼠标当前位置 ]]
function showMouse()
    local cpos = hs.mouse.getAbsolutePosition()
    local show = hs.canvas.new{x=cpos.x-20,y=cpos.y-20,h=40,w=40}:appendElements({
            action = "fill",
            center = { x = "0.5", y = "0.5" },
            fillColor = { alpha = 0.5, red = 1.0  },
            radius = ".5",
            type = "circle",
        }):show()
    hs.timer.delayed.new(0.5, function()
        show:hide(0.5)
    end):start()
end

-- [[ 显示键盘模式 ]]
mode_tray = hs.canvas.new({x = 0, y = 0, w = 0, h = 0})
function showMode(mode)
    local cscreen = hs.mouse.getCurrentScreen()
    local cres = cscreen:fullFrame()
    mode_tray:frame(cscreen:localToAbsolute{
        x = cres.w - 80,
        y = cres.h - 80,
        w = 40,
        h = 40
    })
    mode_tray[1] = {
            action = "fill",
            center = { x = "0.5", y = "0.5" },
            fillColor = { alpha = 0.6, red = 1.0 },
            radius = ".5",
            type = "circle",
        }
    mode_tray[2] = {
        type = "text",
        text = mode,
        textFont = "Courier-Bold",
        textSize = 28,
        textColor = {hex = "#2390FF", alpha = 1},
        textAlignment = "center",
    }
    if mode == 0 then
        mode_tray:hide()
    else
        mode_tray:show()
    end
end

lpos = {x=0, y=0}
--[[ 移动鼠标到屏幕的相应位置 ]]
function moveCursor(option)
    -- local cwin = hs.window.focusedWindow()
    -- local wf = cwin:frame()
    -- local cscreen = cwin:screen()
    local cscreen = hs.mouse.getCurrentScreen()
    local cres = cscreen:fullFrame()
    local x = cres.x
    local y = cres.y
    local w = cres.w
    local h = cres.h
    -- if cwin then
        -- x = wf.x
        -- y = wf.y
        -- w = wf.w
        -- h = wf.h
    -- end
    local cpos = hs.mouse.getAbsolutePosition()
    npos = cpos
    if option == "top" then
        npos = {x=x+w/2, y=y+h/7}
    elseif option == "bottom" then
        npos = {x=x+w/2, y=y+h*6/7}
    elseif option == "left" then
        npos = {x=x+w/7, y=y+h/2}
    elseif option == "right" then
        npos = {x=x+w*6/7, y=y+h/2}
    elseif option == "topLeft" then
        npos = {x=x+w/7, y=y+h/7}
    elseif option == "topRight" then
        npos = {x=x+w*6/7, y=y+h/7}
    elseif option == "bottomLeft" then
        npos = {x=x+w/7, y=y+h*6/7}
    elseif option == "bottomRight" then
        npos = {x=x+w*6/7, y=y+h*6/7}
    elseif option == "center" then
        npos = {x=x+w/2, y=y+h/2}
    end
    -- hs.alert('cpos: ' .. cpos.x .. "," .. npos.y)
    -- hs.alert('npos: ' .. npos.x .. "," .. npos.y)
    if isSame(cpos, npos) then
        -- hs.alert('lpos: ' .. lpos.x .. "," .. lpos.y)
        npos = lpos
    else
        lpos = cpos
    end
    hs.mouse.setAbsolutePosition(npos)
    showMouse()
end

function isSame(cpos, npos)
    return (cpos.x - npos.x)^2 < 10 and (cpos.y - npos.y)^2 < 10
end

-- 居中鼠标到聚焦的窗口，或者到屏幕中心
function centerCursor()
    local cwin = hs.window.focusedWindow()
    local wf = cwin:frame()
    local cscreen = hs.mouse.getCurrentScreen()
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
    hs.mouse.setAbsolutePosition({x=x+w/2, y=y+h/2})
    showMouse()
end

function moveAndResize(option)
    local cwin = hs.window.focusedWindow()
    local gridparts = 30
    if cwin then
        local cscreen = cwin:screen()
        local cres = cscreen:fullFrame()
        local stepw = cres.w/gridparts
        local steph = cres.h/gridparts
        local wf = cwin:frame()
        if option == "halfleft" then
            cwin:setFrame({x=cres.x, y=cres.y, w=cres.w/2, h=cres.h})
        elseif option == "halfright" then
            cwin:setFrame({x=cres.x+cres.w/2, y=cres.y, w=cres.w/2, h=cres.h})
        elseif option == "halfup" then
            cwin:setFrame({x=cres.x, y=cres.y, w=cres.w, h=cres.h/2})
        elseif option == "halfdown" then
            cwin:setFrame({x=cres.x, y=cres.y+cres.h/2, w=cres.w, h=cres.h/2})
        elseif option == "cornerNW" then
            cwin:setFrame({x=cres.x, y=cres.y, w=cres.w/2, h=cres.h/2})
        elseif option == "cornerNE" then
            cwin:setFrame({x=cres.x+cres.w/2, y=cres.y, w=cres.w/2, h=cres.h/2})
        elseif option == "cornerSW" then
            cwin:setFrame({x=cres.x, y=cres.y+cres.h/2, w=cres.w/2, h=cres.h/2})
        elseif option == "cornerSE" then
            cwin:setFrame({x=cres.x+cres.w/2, y=cres.y+cres.h/2, w=cres.w/2, h=cres.h/2})
        elseif option == "maximize" then
            cwin:maximize()
        elseif option == "fullscreen" then
            cwin:toggleFullScreen()
        elseif option == "center" then
            cwin:centerOnScreen()
        elseif option == "expand" then
            cwin:setFrame({x=wf.x-stepw, y=wf.y-steph, w=wf.w+(stepw*2), h=wf.h+(steph*2)})
        elseif option == "shrink" then
            cwin:setFrame({x=wf.x+stepw, y=wf.y+steph, w=wf.w-(stepw*2), h=wf.h-(steph*2)})
        elseif option == "twothirdsleft" then
            cwin:setFrame({x=cres.x, y=cres.y, w=cres.w*2/3, h=cres.h})
        elseif option == "twothirdsright" then
            cwin:setFrame({x=cres.x+cres.w/3, y=cres.y, w=cres.w*2/3, h=cres.h})
        elseif option == "onethirdsleft" then
            cwin:setFrame({x=cres.x, y=cres.y, w=cres.w/3, h=cres.h})
        elseif option == "onethirdsright" then
            cwin:setFrame({x=cres.x+cres.w*2/3, y=cres.y, w=cres.w/3, h=cres.h})
        elseif option == "onethirdscenter" then
            cwin:setFrame({x=cres.x+cres.w/3, y=cres.y, w=cres.w/3, h=cres.h})
        end
        centerCursor()
    else
        hs.alert.show("No focused window!")
    end
end

function moveToScreen(direction)
    local cwin = hs.window.focusedWindow()
    local isFullscreen = cwin:isFullScreen()
    if isFullscreen then
        cwin = cwin:toggleFullScreen()
        sleep(1)
    end
    if cwin then
        local cscreen = cwin:screen()
        if direction == "up" then
            cwin = cwin:moveOneScreenNorth()
        elseif direction == "down" then
            cwin = cwin:moveOneScreenSouth()
        elseif direction == "left" then
            cwin = cwin:moveOneScreenWest()
        elseif direction == "right" then
            cwin = cwin:moveOneScreenEast()
        elseif direction == "next" then
            cwin = cwin:moveToScreen(cscreen:next())
        end
        if isFullscreen then
            cwin:toggleFullScreen()
        end
        centerCursor()
    else
        hs.alert.show("No focused window!")
    end
end

function sleep(n)
    if n > 0 then
        os.execute("ping -i 0.6 -c " .. tonumber(n+1) .. " localhost > NULL")
    end
end