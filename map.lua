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
function go(tomap, x, y,cmap,...)
    if (os.time()-摄妖香时间) >1680 then
        useSYS()
    end
    if Menpai == '五庄观' and (os.time()- 三花聚顶时间)> 120 then
        fastSkill('三花聚顶')
        三花聚顶时间 = os.time()
    end
    local cmap = cmap or currentMap()
    if cmap ~= tomap  or isIn(tomap,{"长安城","傲来国","长寿村"}) then
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
        if select('#',...)>0 then
            inputCoords(x,y)
        else
            tapCoords(x,y)
        end
    end
    repeat
        local co1 = currentCoords()
        mSleep(1500)
        local co2 = currentCoords()
    until co1 == co2

end

function goQLS()
    useFXQ('朱紫国', 5, 110)
    waitDo(currentMap()=='朱紫国',1,point["左上空白"])
    waitArrival("麒麟山")
end
function goNEC()
    useFXQ('傲来国', 0, 125)
    waitDo(currentMap()=='傲来国',1,point["左上空白"])
    waitArrival("女儿村")
end
function goHGS()
    useFXQ('傲来国', 223, 135)
    waitDo(currentMap()=='傲来国',1,point["右上空白"])
    waitArrival("花果山")
end
function goDTGJ(x, y)
    if x > 180 then
        useFXQ('长安城', 5, 5)
        waitDo(currentMap()=='长安城',1,point["左下空白"])
    else
        useFXQ('长安城', 280, 40)
        PostTo('大唐国境')
    end 
    waitArrival("大唐国境")
end

function goDTJW(x, y)
    if x < 450 then
        useFXQ('朱紫国', 5, 5) 
        waitDo(currentMap()=='朱紫国',1,point["左下空白"])
        mSleep(1000)
    else
        go('大唐国境', 10, 76)
        TClick(point['左中空白'])
        mSleep(1000)
    end
   
    waitArrival("大唐境外")
end

function goJNYW()
    useFXQ('长安城', 550, 5)
    waitDo(currentMap()=='长安城',1,point["右下空白"])
    waitArrival("江南野外")
end

function goDHW()
    useFXQ('傲来国', 170, 20)
    PostTo('东海湾')
    waitArrival("东海湾")
end

function goSTL()
    useFXQ('朱紫国', 5, 5)
    waitDo(currentMap() == '朱紫国',1,TClick(point["左下空白"]))
    waitDo(currentMap() == '大唐境外',1,TClick(point["左下空白"]))
    TClick(point["左下空白"])
    waitArrival("狮驼岭")
end
function goCSJW()
    useFXQ('长寿村', 140, 5)
    waitDo(currentMap() == '长寿村',1,TClick(point["右下空白"]))
    waitArrival("长寿郊外")
end
function goPT()
    go('大唐国境',226+math.random(-1, 1), 62+math.random(-1, 1))
    PostTo('普陀山')
    waitArrival("普陀山")
end

function goWZ()
    if Menpai == '五庄观' then
        goMenpai()
    else
        go('大唐境外', 632, 76)
        TClick(point["右上空白"])
    end
    waitArrival("五庄观")
end

function goDF()
    go('大唐国境', 48, 326)
    TClick(point["中上空白"])
    waitArrival('地府')
end

function goHSS()
    useFXQ('长安城', 504, 272)
    TClick(point["右上空白"])
    waitArrival("化生寺")
end
function goBJLZ(x, y)
    if x < 75 then
        go('长寿郊外', 66+math.random(-1, 1), 69+math.random(-1, 1),1)
        PostTo('北俱芦洲csjw')
    else
        go('花果山', 34+math.random(-1, 1), 98+math.random(-1, 1),1)
        PostTo('北俱芦洲hgs')
    end
    waitArrival("北俱芦洲")
end

function goMJC()
    go('大唐境外', 235+math.random(-1, 1), 106+math.random(-1, 1),1)
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
   -- '552319,212018'  节日地图字体偏色
    return ocrByDict(currentMapDict,rect['当前地图'],'232529,222428', 90)
end

function currentCoords()
    --'FEE7DB,0B232E'  节日坐标字体偏色
    -- ocrByDict(coordsDict,rect["当前坐标"],'D3DCE0,3B322D',90)
    return  ocrText(rect["当前坐标"][1],rect["当前坐标"][2],rect["当前坐标"][3],rect["当前坐标"][4],0,'0123456789(),')
end

function useFXQ(to, x, y)
    --遍历飞行旗坐标点  选择距离最近的
    openBox()
    local redx = 0
    local redy = 0
    local close_in = 99999
    local index = 0
    for key, value in pairs(FXQ) do
        if value.to == to then
            for i, v in ipairs( value.coords) do            
            -- for i = 1, #FXQ[var].coords do
                local  dis = (v.x - x) ^ 2 + (v.y - y) ^ 2
                if  dis < close_in then
                    close_in = dis
                    redx = v.redx
                    redy = v.redy
                    index =tonumber(key)
                end
            end
        end
    end
    waitDo(mColor(view['背包打开']),2,背包格子[index])
    waitDo(is(view['飞行旗定位点']),1,{redx,redy})
    tapClose() 
    FXQ[tostring(index)].times = FXQ[tostring(index)].times - 1
    if FXQ[tostring(index)].times == 0  then
        FXQ[tostring(index)].times =  getFXQ(to)
    end
    bool = writeFileString(userPath() .. "/res/FXQ.json", json.encode(FXQ), "w")
end
function useFXF(tomap)
    openBox()
    --检查是否有飞行符
    local x, y = fmcByTableInRect(view['飞行符'],rect["背包"], 85,{main = 0x202020,list= 0x202020})
    if x == -1  then
        仙灵店铺购买('飞行符',math.random(15,30))
        useFXF(tomap)
    else
        dTClick(背包格子[getIndexByPoint(x,y)])
        -- TClick(point['飞行符'][tomap])
        waitDo(mColor(view['飞行符使用界面']),1,point['飞行符'][tomap])
        tapClose()
    end
end 

function recordFXQ()
    openBox()
    local tb = findFXQ()
    -- nLog(#tb)
    for indexKey, value in pairs(tb) do
        TClick(背包格子[tonumber(indexKey)],math.random(1000, 1200))
        local ocrstr  = ocrByDict(itemInfoDict,rect["飞行旗信息"],'D8DB12,2F2E11', 94)
        nLog(ocrstr)
        local times, _ = ocrstr:gsub('%D+', '')
        local to = string.sub(ocrstr, 1, 9)
        -- nLog(to)
        dTClick(背包格子[tonumber(indexKey)],math.random(2000, 2400))
        local mx1, my1, mx2, my2 =
            rect["飞行旗使用界面"][to][1],
            rect["飞行旗使用界面"][to][2],
            rect["飞行旗使用界面"][to][3],
            rect["飞行旗使用界面"][to][4]
        local redpointTable = fmcAllByTableInRect(view["飞行旗定位点"],{mx1-20, my1-20, mx2+20, my2+20})
        local coords = {}
        if #redpointTable ~= nil then --如返回的table不为空（至少找到一个符合条件的点）
            for var = 1, #redpointTable do
                local coordx = (redpointTable[var].x - mx1) / (mx2 - mx1) * (map_size[to][1])
                local coordy = (my2 - redpointTable[var].y) / (my2 - my1) * (map_size[to][2])
                -- nLog('定位点:' ..coordx ..',' ..coordy .. '--' .. redpointTable[var].x .. ',' .. redpointTable[var].y)
                table.insert(coords,{x = coordx, y = coordy, redx = redpointTable[var].x, redy = redpointTable[var].y})             
            end
        end
        FXQ[indexKey]={name =value, to=to,coords = coords,times = tonumber(times)}
        tapClose()
    end
    nLog(tableToStr(FXQ))
    writeFileString(userPath() .. '/res/FXQ.json', json.encode(FXQ), 'w')
end

function checkFXQ()
    openBox()
    local jsonstr = readFileString(userPath() .. '/res/FXQ.json')
    local tb = json.decode(jsonstr)
    nLog(tableToStr(tb))
    local fxqt = findFXQ()
    for index, value in pairs(fxqt) do
        TClick(背包格子[tonumber(index)])
        local ocrstr = ocrByDict(itemInfoDict,rect["飞行旗信息"],'D8DB12,2F2E11', 94)
        nLog(ocrstr)
        local ctimes, _ = ocrstr:gsub('%D+', '')
        local cto = string.sub(ocrstr, 1, 9)
        if cto ~= tb[index].to or tonumber(ctimes) ~= tb[index].times or value ~= tb[index].name then
            recordFXQ()
            return
        end
    end
    FXQ = tb
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
    if NPC(n)== true then
        if to == '墨家村' then
            TClick(point["去墨家村"])
        else
            TClick(point["我要去"])
        end
    else
        lua_exit()
    end
    mColorTap(view["隐藏返回"],point['返回'])
end



---查找飞行旗
---@return table 飞行旗在背包的序号
function findFXQ()
    keepScreen(true)
    local FXQTable = {}
    for colorKey, value in pairs(view["合成旗"]) do
        local tb =  fmcAllByTableInRect(value,rect["背包"],85)
        for _, value in ipairs(tb) do   
            local index = getIndexByPoint(value['x'],value['y'])  
            -- table.insert(FXQTable,index)
            FXQTable[tostring(index)] = colorKey
        end
    end
    keepScreen(false)
    return FXQTable
end 

function tapClose()
    local closeX, closeY = fmcByTableInRect(view["界面关闭按钮"])
    if closeX ~= -1 and closeY ~= -1 then
        randomClick(closeX,closeY,5)
    end
end

function allClose()
    repeat
        tapClose()
    until (is(view["界面关闭按钮"]) == false)
end

function openBox()
    local x, y = fmcByTableInRect(view["背包打开"])
    if x ~= -1 then
        return true
    else
        allClose()
    end

    local x, _ =  fmcByTableInRect(view["底部按钮"],rect["底部按钮"])
    if x  == -1 then
        TClick(point["底部按钮开关"])
    end
    TClick(point["道具"],500)
end


---快捷技能
---@param skill string
function fastSkill(skill)
    allClose()
    mSleep(500)
    if mColor(view['快捷法术栏开启']) == false then
        if mColor(view['底部按钮']) == false then
            TClick(point['底部按钮开关'])
        end
        TClick(point["快捷法术"])
    end
    local sx,sy = fmcByTableInRect(view['快捷技能'][skill],rect["快捷技能"],85,{main = 0x202020,list= 0x202020})
    if sx ~= -1 then
        randomClick(sx,sy)
    else
        playAudio("GameBJ.mp3")
    end
 end


---仙灵店铺购买道具
---@param buy table 买什么
---@param n number  数量
function 仙灵店铺购买(buy,n)
    fastSkill('仙灵店铺')
    -- TClick(point["仙灵店铺"][buy],500)
    waitDo(mColor(view['仙灵店铺']),1,point["仙灵店铺"][buy])
    if n>1 then
        for i = 1, n-1, 1 do
            TClick(point["仙灵店铺"]["加"],math.random(50, 150))
        end  
    end
    mSleep(500)
    TClick(point["仙灵店铺"]["购买"])
    tapClose()
end

---打开仓库 西凉
function openDepot()
    if currentMap()~= '西梁女国' or currentCoords() ~= '(101,28)' then
        useFXF('西梁女国')
    end
    TClick(point["西梁女国仓库"])
    waitDo(mColor(view['对话']),1,point["仓库操作"])
end
---等待抵达
---@param map string
function waitArrival(map)
    local t = 0
    repeat
        mSleep(100)
        t = t+100
        if t> maxDelay  then
            playAudio('GameBJ.mp3')
            lua_exit()
        end
    until currentMap() == map
    mSleep(500)
end

function useSYS()
    nLog("useSYS")
    openBox()
    local x,y  = fmcByTableInRect(view["摄妖香"],rect["背包"],85)
    local blank= getBlankIndex(背包格子)
    if x~= -1   then
        dTClick(背包格子[getIndexByPoint(x,y)])
        return
    else
        if #blank == 0 then
            local bx,by = fmcByTableInRect(item["藏宝图"],rect["背包"])
            if bx ~= -1 then
                TClick(背包格子[getIndexByPoint(bx,by)])
                --点击移动
                click(fmcByTableInRect(view['移动道具'],{94,86,587,711}))
                TClick(point['行囊'])
            end
        end
        仙灵店铺购买("摄妖香",1)
        openBox()
        dTClick( 背包格子[getIndexByPoint(fmcByTableInRect(view["摄妖香"],rect["背包"],85))])
        摄妖香时间 = os.time()
    end 
end

---点击小地图坐标点
---@param map string
---@param x any
---@param y any
function tapCoords(x,y)
    local m= currentMap()
    nLog(m)
    TClick(point["小地图"])
    waitDo(is(view['世界']),0)
    local min_x = rect.mapRect[m][1]
    local min_y = rect.mapRect[m][2]
    local max_x = rect.mapRect[m][3]
    local max_y = rect.mapRect[m][4]
    local sx = (max_x - min_x )/ map_size[m][1]* x +min_x
    local sy = max_y- (max_y - min_y)/ map_size[m][2] * y
    for i = 1, math.random(1, 5), 1 do    
        local random_x , random_y = sx +math.random(-35, 35) ,  sy +math.random(-35, 35)
        if random_x > min_x and random_x < max_x  and  random_y > min_y and random_y < max_y then
            click(random_x,random_y)
        end
    end
    click(sx,sy )
    click(rect.mapRect[m][7] + math.random(-10, 10),rect.mapRect[m][8]+ math.random(-10, 10))
    mSleep(500)
end

function inputCoords(x,y)
    local cm = currentMap()
    TClick(point["小地图"])
    local t = view['小地图按钮'][cm]
    local Y1x, Y1y = t[5] + t[3] - t[1], t[6] + t[4] - t[2]
    local xstr = tostring(x)
    local ystr = tostring(y)
    -- 按序输入x坐标
    randomClick(t[1], t[2],20)
    for i = 1, #xstr do
        local num = xstr:sub(i, i)
        if num == '0' then
            randomClick(t[5] + 300, t[6] + 100,20)
        else
            randomClick(t[5] + (num - 1) % 3 * 100, t[6] + math.floor((num - 1) / 3) * 100,20)
        end
    end
    --点击确定
    randomClick(t[5] + 300, t[6] + 200,20)
    randomClick(t[3],t[4],20)
    -- 按序输入Y坐标
    for i = 1, #ystr do
        local num = ystr:sub(i, i)
        if num == '0' then
            randomClick(Y1x + 300, Y1y + 100,20)
        else
            randomClick(Y1x + (num - 1) % 3 * 100, Y1y + math.floor((num - 1) / 3) * 100,20)
        end
    end
    randomClick(Y1x + 300, Y1y + 200,20)
    randomClick(t[7], t[8],20)
    randomClick(t[9], t[10],20)
end


---对话NPC
---@param npc any
function NPC(npc)
    for i = 1, 20, 1 do
        if i ==5  then
            TClick(point['隐藏'],500)
            mColorTap(view["全部摊位"],point["全部摊位"],95)
        end
        local x,y = fmcByTableInRect(npc,{171,98,1195,651},80,{main = 0x303030,list = 0x505050,max_miss = 2})
        if x ~=-1 then
            click(x,y-30,500)
           --检查是否正确弹出选择角色
            if is(view['选择角色'],{0,0,height,width},80) then
                nLog('选择角色')
                playAudio("GameBJ.mp3")
                -- chooseNPC()
                return true
            elseif is(view["对话"],{0,width/2,height,width},95) then
                nLog('对话')
                return true      
            end
        end
        mSleep(1000)
    end
    nLog('找不到')
    playAudio("GameBJ.mp3")
    return false
end


function getFXQ(where)
    openDepot()
    for i = 1, 20, 1 do
        TClick(仓库格子[i])
        local ocrstr  = ocrByDict(itemInfoDict,rect["仓库合成旗"],'D8DB12,2F2E11', 94)
        nLog(ocrstr)
        local times, _ = ocrstr:gsub('%D+', '')
        nLog(ocrstr)
        if  to == where then
            doubleClick(仓库格子[i][1]+view["背包宽度"]/2,仓库格子[i][2]+view["背包宽度"]/2,20)
            return times
        end
    end
    tapClose()
   return false
end

---通过第一个回门派快捷技能识别门派  
---@return string
function getMenpai()
    allClose()
    if mColor(view['快捷法术栏开启']) == false then
        if mColor(view['底部按钮']) == false then
            TClick(point['底部按钮开关'])
        end
        TClick(point["快捷法术"])
    end
    --检查第一个技能是什么
    for key, value in pairs(view.快捷技能) do
        if is(value,{523,569,613,657}) == true then
            if key == '斗转星移' then
                return '五庄观'
            elseif key == '千里神行' then
                return '大唐官府'
            end
        end
    end
end

function chooseNPC()

end

return map