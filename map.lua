require("common")
local map = {}
map_size = {
    ['东海湾'] = {120, 120},
    ['建邺城'] = {288, 144},
    ['江南野外'] = {160, 120},
    ['长安城'] = {550, 280},
    ['化生寺'] = {128, 96},
    ['大唐国境'] = {352, 336},
    ['长寿村'] = {160, 210},
    ['长寿郊外'] = {190, 168},
    ['傲来国'] = {224, 151},
    ['女儿村'] = {128, 144},
    ['花果山'] = {160, 120},
    ['西凉女国'] = {163, 123},
    ['宝象国'] = {160, 120},
    ['朱紫国'] = {192, 120},
    ['大唐境外'] = {636, 120},
    ['狮驼岭'] = {130, 97},
    ['普陀山'] = {96, 72},
    ["五庄观"] = {100,75},
    ['麒麟山']= {191,143},
    ['墨家村'] = {96,168},
    ['北俱芦洲'] = {228,170}
}
function go(tomap, x, y)
    if (os.time()-摄妖香时间) >1680 then
        useSYS()
    end
    if currentMap() ~= tomap  or isIn(tomap,{"长安城","朱紫国","傲来国","长寿村"}) then
        if Menpai ~= tomap then
            if tomap == '长安城' or tomap == '长寿村' or tomap == '傲来国' or tomap == '朱紫国' then
                useFXQ(tomap, x, y)
            elseif tomap == '建邺城' or tomap == '宝象国' or tomap == '西凉女国' then
                useFXF(tomap)
            elseif tomap == '普陀山' then
                goPT()
            elseif tomap == '地府' then
                goDF()
            elseif tomap == '狮驼岭' then
                goSTL()
            elseif tomap == '东海湾' then
                goDHW()
            elseif tomap == '长寿郊外' then
                goCSJW()
            elseif tomap == '江南野外' then
                goJNYW()
            elseif tomap == '大唐国境' then
                goDTGJ(x, y)
            elseif tomap == '大唐境外' then
                goDTJW(x, y)
            elseif tomap == '女儿村' then
                goNEC()
            elseif tomap == '花果山' then
                goHGS()
            elseif tomap == '化生寺' then
                goHSS()
            elseif tomap == '麒麟山' then
                goQLS()
            elseif tomap == '北俱芦洲' then
                goBJLZ(x, y)
            elseif tomap == '墨家村' then
                goMJC()
            elseif tomap == '五庄观' then
                goWZ()
            end
        else
            goMenpai()
        end 
    end
    mSleep(500)
    if currentMap() == tomap then
        toCoords(x,y)
    end
end

function goQLS()
    useFXQ('朱紫国', 5, 110)
    click(30 / 1790 * height, 85 / 828 * width)
    waitArrival("麒麟山")
end
function goNEC()
    useFXQ('傲来国', 0, 125)
    click(30 / 1790 * height, 85 / 828 * width)
    waitArrival("女儿村")
end
function goHGS()
    useFXQ('傲来国', 223, 135)
    click(1742 / 1790 * height, 103 / 828 * width)
    waitArrival("花果山")
end
function goDTGJ(x, y)
    if x > 180 then
        useFXQ('长安城', 5, 5)
        click(45 / 1790 * height, 700 / 828 * width)
    else
        useFXQ('长安城', 280, 40)
        PostTo('大唐国境')
    end 
    waitArrival("大唐国境")
end

function goDTJW(x, y)
    if x < 450 then
        useFXQ('朱紫国', 5, 5)
        click(35 / 1790 * height, 735 / 828 * width)

    else
        go('大唐国境', 10, 76)
        click(35 / 1790 * height, 370 / 828 * width)
    end
    waitArrival("大唐境外")
end

function goJNYW()
    useFXQ('长安城', 550, 5)
    click(1740 / 1790 * height, 625 / 828 * width)
    waitArrival("江南野外")
end

function goDHW()
    useFXQ('傲来国', 170, 20)
    PostTo('东海湾')
    waitArrival("东海湾")
end

function goSTL()
    useFXQ('朱紫国', 5, 5)
    click(35 / 1790 * height, 735 / 828 * width)
    mSleep(1500)
    click(35 / 1790 * height, 735 / 828 * width)
    waitArrival("狮驼岭")
end
function goCSJW()
    useFXQ('长寿村', 140, 5)
    click(1740 / 1790 * height, 625 / 828 * width)
    waitArrival("长寿郊外")
end
function goPT()
    go('大唐国境',226, 62)
    PostTo('普陀山')
    waitArrival("普陀山")
end

function goWZ()
    if Menpai == '五庄观' then
        goMenpai()
    else
        go('大唐境外', 632, 76)
        click(1769 / 1790 * height, 196 / 828 * width)
    end
    waitArrival("五庄观")
end

function goDF()
    go('大唐国境', 48, 326)
    click(867 / 1790 * height, 99 / 828 * width)
end

function goHSS()
    useFXQ('长安城', 504, 272)
    click(1237 / 1790 * height, 21 / 828 * width)
    waitArrival("化生寺")
end
function goBJLZ(x, y)
    if x < 75 then
        go('长寿郊外', 66, 69)
        PostTo('北俱芦洲csjw')
    else
        go('花果山', 34, 98)
        PostTo('北俱芦洲hgs')
    end
    waitArrival("北俱芦洲")
end

function goMJC()
    go('大唐境外', 235, 109)
    PostTo('墨家村')
    waitArrival("墨家村")
end

function goMenpai()
    if Menpai == '五庄观' then
        fastSkill('斗转星移')
    end
end

function currentMap()
    allClose()
    return ocrByDict(currentMapDict,rect['当前地图'],'4C1B15,181814#4B1A14,161713#501E17,1B1A15', 88)
end

function currentCoords()
    return ocrByDict(currentCoordsDict,rect['当前坐标'],'87E388,873188', 88)

end

function useFXQ(to, x, y)
    --遍历飞行旗坐标点  选择距离最近的
    openBox()
    local redx = 0
    local redy = 0
    local bx = 0
    local by = 0
    local shortest = 99999
    local index = 0
    for var = 1, #FXQ do
        if FXQ[var].to == to then
            for i = 1, #FXQ[var].coords do
                dis = (FXQ[var].coords[i].x - x) ^ 2 + (FXQ[var].coords[i].y - y) ^ 2
                if dis < shortest then
                    shortest = dis
                    redx = FXQ[var].coords[i].redx
                    redy = FXQ[var].coords[i].redy
                    bx = FXQ[var].boxx
                    by = FXQ[var].boxy
                    index = var
                end
            end
        end
    end
    doubleClick(bx, by,600)
    click(redx,redy - 10)
    tapClose() 
    FXQ[index].times = FXQ[index].times - 1

    if FXQ[index].times == 0  then
        FXQ[index].times =  getFXQ(FXQ[index].to)
    end
end
function useFXF(tomap)
    openBox()
    --检查是否有飞行符
    local x, y = fmcByTableInRect(view['飞行符'],rect["背包"], 85)
    if x == -1  then
        仙灵店铺购买('飞行符',30)
        useFXF()
    else
        doubleClick(x, y,500)
        TClick(point['飞行符'][tomap],600)
        tapClose()
    end
end 


function recordFXQ()
    openBox()
    local tb = 查找背包飞行旗()
    -- nLog(#tb)
    for index, value in ipairs(tb) do
        -- nLog(tableToStr(value))
        click(value['x'], value['y'],500)
        local ocrstr  = ocrByDict(fxqdict,rect["飞行旗信息"],'E6E810,2D2C14#DCDE05,232205', 92)
        -- nLog(ocrstr)
        local times, _ = ocrstr:gsub('%D+', '')
        local to = string.sub(ocrstr, 1, 9)
        nLog(to)
        doubleClick(value['x'], value['y'],800)
        local mx1, my1, mx2, my2 =
            view["飞行旗使用界面"][to].upleft[1],
            view["飞行旗使用界面"][to].upleft[2],
            view["飞行旗使用界面"][to].lowright[1],
            view["飞行旗使用界面"][to].lowright[2]
        local redpointTable = fmcAllByTableInRect(view["飞行旗定位点"],{mx1-20, my1-20, mx2+20, my2+20},95, 30)
        local coords = {}
        if #redpointTable ~= nil then --如返回的table不为空（至少找到一个符合条件的点）
            for var = 1, #redpointTable do
                local coordx = (redpointTable[var].x - mx1) / (mx2 - mx1) * (map_size[to][1])
                local coordy = (my2 - redpointTable[var].y) / (my2 - my1) * (map_size[to][2])
                -- nLog('定位点:' ..coordx ..',' ..coordy .. '--' .. redpointTable[var].x .. ',' .. redpointTable[var].y)
                table.insert(coords,{x = coordx, y = coordy, redx = redpointTable[var].x, redy = redpointTable[var].y})
            end
        end
        table.insert(FXQ, {to = to, times = tonumber(times), coords = coords, boxx = value['x'], boxy = value['y']})
        tapClose()
    end
end

function checkFXQ()
    openBox()
    local jsonstr = readFileString(userPath() .. '/res/FXQ.json')
    local tmpFXQ = json.decode(jsonstr)
    -- nLog(#tmpFXQ)
    if #tmpFXQ == 0 then
        recordFXQ()
        return
    else
    local 飞行旗坐标表 = 查找背包飞行旗()
        for index, value in ipairs(飞行旗坐标表) do
            click(value['x'], value['y'],500)
            local ocrstr =  ocrByDict(fxqdict,rect["飞行旗信息"],'E6E810,2D2C14#DCDE05,232205', 92)
            local ctimes, _ = ocrstr:gsub('%D+', '')
            local cto = string.sub(ocrstr, 1, 9)
            if cto ~= tmpFXQ[var].to or tonumber(ctimes) ~= tmpFXQ[var].times then
                recordFXQ()
                return
            end
        end
    end
    FXQ = tmpFXQ
end

--传送
function PostTo(to)
    local n  = {}
    if to == '东海湾' then
        n = view["驿站传送东海湾"]
    elseif to == '普陀山' then
        n = view["普陀山接引仙女"]
    elseif to == '大唐国境' then
        n = view["驿站传送大唐国境"]
    elseif to == '墨家村' then
        n = view["火焰山土地"]
    elseif to == '北俱芦洲hgs' then
        n = view["花果山土地"]
    elseif to == '北俱芦洲csjw' then
        n = view["驿站传送北俱芦洲"]
    end
    if NPC(n) then
        if to == '墨家村' then
            click(1584, 291)
        else
            click(1500, 400)
        end
    else
        lua_exit()
    end
    mulColTap(view["隐藏返回"],90,false)
end
---查找背包飞行旗
---@return table {{['x']=1308,['y']=256},{['x']=885,['y']=257}}
function 查找背包飞行旗()
    keepScreen(true)
    local fxqt = {}
    for key, value in pairs(view["合成旗"]) do
        local tb =  fmcAllByTableInRect(value,rect["背包"],92,100)
        for index, value in ipairs(tb) do
            table.insert(fxqt,value)
        end
    end
    keepScreen(false)
    return fxqt
end 

function tapClose()
    local closeX, closeY = findMultiColorInRegionFuzzyByTable(view["界面关闭按钮"], 90, 0, 0, height, width)
    if closeX ~= -1 and closeY ~= -1 then
        click(closeX, closeY)
    end
end

function allClose()
    repeat
        tapClose()
        mSleep(200)
        local closeX, _ = findMultiColorInRegionFuzzyByTable(view["界面关闭按钮"], 90, 0, 0, height, width)
    until (closeX == -1)
end

function openBox()
    local x, y = findMultiColorInRegionFuzzyByTable(view["背包打开"], 90, 0, 0, height, width)
    if x ~= -1 then
        return true
    else
        allClose()
    end
    -- local itemiconx, itemicony =findMultiColorInRegionFuzzyByTable(view['道具图标'], 90, height * 0.2, width * 0.2, height, width)
    local x, _ =  fmcByTableInRect(view["底部按钮"],rect["底部按钮"],90)
    if x  == -1 then
        TClick(point["底部按钮开关"])
    end
    TClick(point["道具"],500)
    -- if multiColor_Tap(view["临时道具"],point["临时道具"]) then
    --     TClick(point["获得全部"])
    --     tapClose()
    --     TClick(point["道具"])
    --     multiColor_Tap(view["临时道具"],point["临时道具_道具"])
    -- end
end


---快捷技能
---@param skill string
function fastSkill(skill)
    allClose()
    local x,_ =  fmcByTableInRect(view["底部按钮"],rect["底部按钮"],90)
    if x  == -1 then
        TClick(point["底部按钮开关"])
    end

    local fx, _ = fmcByTableInRect(view.fastSkill["使用飞行符"],rect["快捷技能"],90)
    if fx == -1 then
        TClick(point["快捷法术"])
    end

    local sx,sy = fmcByTableInRect(view.fastSkill[skill],rect["快捷技能"],90)
    if sx ~= -1 then
        click(sx,sy)
    end
 end


---仙灵店铺购买道具
---@param buy table 买什么
---@param n number  数量
function 仙灵店铺购买(buy,n)
    fastSkill('仙灵店铺')
    TClick(point["仙灵店铺"][buy],500)
    if n>1 then
        for i = 1, n-1, 1 do
            TClick(point["仙灵店铺"]["加"])
        end  
    end
    TClick(point["仙灵店铺"]["购买"])
    tapClose()
end


function goStorehouse ()
    if currentMap() ~= "宝象国" and currentCoords() ~= "(115,70)" then
        useFXF("宝象国")
    end
    TClick(point["宝象国仓库"])

    TClick(point["仓库操作"],800)
end
---等待抵达
---@param map string
function waitArrival(map)
    local t = 0
    repeat
        mSleep(100)
        t = t+100
        if t> maxDelay  then
            lua_exit()
        end
    until currentMap() == map
end

function useSYS()
    allClose()
    openBox()
    local x,y  = fmcByTableInRect(view["摄妖香"],rect["背包"],85)
    local kx,_ = fmcByTableInRect(view["空白格子"],rect["背包"],90)
    if x~= -1  then
        doubleClick(x,y)
    elseif kx ~=-1 then
        仙灵店铺购买("摄妖香",1)
        openBox()
        doubleClick(fmcByTableInRect(view["摄妖香"],rect["背包"],85))
        摄妖香时间 = os.time()
    else
        lua_exit()
    end 
end

---点击小地图坐标点
---@param map string
---@param x any
---@param y any
function tapCoords(x,y)
    local map= currentMap()
    TClick(point["小地图"],500)

    -- for i = 1, math.random(1, 3), 1 do
    --     click((rect.mapRect[map][3] -rect.mapRect[map][1])/map_size[map][1]* x +rect.mapRect[map][1]+math.random(-20, 25),
    --     rect.mapRect[map][4]- (rect.mapRect[map][4] -rect.mapRect[map][2])/map_size[map][2]*y +math.random(-20, 25),math.random(400,1000))
    -- end
    click((rect.mapRect[map][3] -rect.mapRect[map][1])/map_size[map][1]* x +rect.mapRect[map][1],
          rect.mapRect[map][4]- (rect.mapRect[map][4] -rect.mapRect[map][2])/map_size[map][2]*y )
    click(rect.mapRect[map][7],rect.mapRect[map][8])
end


function inputCoords(x,y)
    allClose()
    local cm = currentMap()
    TClick(point["小地图"])
    local tab = view.miniMapBtns[cm]
    local xx, xy, yx, yy, go_x, go_y, X1x, X1y =
        tab.X_input_x,
        tab.X_input_y,
        tab.Y_input_x,
        tab.Y_input_y,
        tab.go_x,
        tab.go_y,
        tab.X_one_x,
        tab.X_one_y
    local Y1x, Y1y = X1x + yx - xx, X1y + yy - xy
    local xstr = tostring(x)
    local ystr = tostring(y)
    -- 按序输入x坐标
    click(xx, xy)
    for i = 1, #xstr do
        local num = xstr:sub(i, i)
        if num == '0' then
            click(X1x + 360, X1y + 120)
        else
            click(X1x + (num - 1) % 3 * 120, X1y + math.floor((num - 1) / 3) * 120)
        end
    end
    click(X1x + 360, X1y + 240)
    click(yx, yy)
    -- 按序输入Y坐标
    for i = 1, #ystr do
        local num = ystr:sub(i, i)
        if num == '0' then
            click(Y1x + 360, Y1y + 120)
        else
            click(Y1x + (num - 1) % 3 * 120, Y1y + math.floor((num - 1) / 3) * 120)
        end
    end
    click(Y1x + 360, Y1y + 240)
    click(go_x, go_y)
end

function toCoords(x, y)
    if isIn(currentMap(),{'大唐境外','花果山'}) then
        inputCoords(x,y)
        tapClose()
    else
        tapCoords(x,y)
    end

    repeat
        local coord1 = currentCoords()
        mSleep(700) -- body
        local coord2 = currentCoords()
    until (coord1 == coord2)

end
---对话NPC
---@param npc any
function NPC(npc)
    for i = 1, 200, 1 do
        if i == 40 then
            TClick(point['隐藏'],500)
            mulColTap(view['全部摊位'],90,false)
        end
        local x,y = fmcByTableInRect(npc,{0,0,height,width},80,{main = 0x202020,list = 0x202020,max_miss = 2})
        if x ~=-1 then
           click(x,y-40,500)
           --检查是否正确弹出对话  还是选择NPC
            if is("选择NPC",{0,0,height,width},90) then
                playAudio("GameBJ.mp3")
                -- chooseNPC()
                return true
            elseif multiColor(view['对话'],90,true) then
                return true
            else
                playAudio("GameBJ.mp3")
                return false
            end
        end
        mSleep(100)
    end
    playAudio("GameBJ.mp3")
    return false
end


function getFXQ(where)
    goStorehouse()
    for i = 1, 20, 1 do
        click(仓库格子[i][1]+view["背包宽度"]/2,仓库格子[i][2]+view["背包宽度"]/2,600)
        -- local ocr = ocrByDict(fxqdict,rect['仓库合成旗'],'E6E810,2D2C14#DCDE05,232205', 92)
        local ocr = baiduOCR(rect['仓库合成旗'])
        local to =  string.sub(ocr, 1, 9)
        local times, _ = ocr:gsub('%D+', '')
        nLog(to)
        if  to == where then
            doubleClick(仓库格子[i][1]+view["背包宽度"]/2,仓库格子[i][2]+view["背包宽度"]/2,600)
            return times
        end
    end
    tapClose()
   return false
end


function chooseNPC()

end

return map