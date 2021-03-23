local wt = {}
wt.baotu = {}
wt.bt = {}
wt.begintime= 0
wt.blank_tmp = {}
wt.page = 1
wt.cm = nil
wt.record =  {
    ["魔兽要诀"] = 0,
    ["70铁"] = 0,
    ["60铁"] = 0,
    ["70环"] = 0,
    ["60环"] = 0,
    ["50环"] = 0,
    ["60制造书"] = 0,
    ["定魂珠"] = 0,
    ["金刚石"] = 0,
    ["夜光珠"] = 0,
    ["龙鳞"] = 0,
    ["避水珠"] = 0,
    ["金柳露"] = 0,
    ["召唤兽内丹"] = 0,
    ["宝石"] = 0,
    ["挖图数"] = 0,
    ['耗时(分)'] = 0
}

local 垃圾={'红罗伞','竹骨灯','铁胆弓','曲尖枪','铁齿剑','幻彩银纱','铁骨扇','镔铁锤','精钢日月圈','桃印铁刃','红木杖','水晶珠','开山斧','镔铁双剑','天狼爪','金丝魔棒','牛筋鞭',
            '苗刀','布帽','皮衣','牛皮靴','缎带','五色飞石','玉钗','丝绸长裙','紫竹伞','红灯笼','紫檀弓','锯齿矛','吴越剑','金丝彩带','精钢扇','八棱金瓜','离情环','赭石巨剑',
            '白椴杖','珍宝珠','双面斧','龙凤双剑','幽冥鬼爪','玉如意','乌龙鞭','夜麾弯刀','面具','梅花簪子','鳞甲','马靴','银腰带','珍珠链','五彩裙','锦绣帷','鲤鱼灯','宝雕长弓',
            '乌金三叉戟','青锋剑','无极丝','狼牙锤','金刺轮','璧玉长铗','墨铁拐','翡翠珠','双弦钺','竹节双剑','钢结鞭','金背大砍刀','纶巾','锁子甲','侠客履','水晶腰带','骷髅吊坠',
            '珍珠头带','龙鳞羽衣','幽兰帐','芙蓉花灯','宝雕錾金宝弓','火焰枪','龙泉剑','天蚕丝带','百折扇','烈焰锤','风火圈','青铜古剑','玄铁牛角杖','莲华珠','精钢禅钺','狼牙双剑',
            '勾魂爪','云龙棒','蛇骨鞭','雁翅刀','缨络丝带','紧身衣','神行靴','琥珀腰链','江湖夜雨','凤头钗','天香披肩','点金棒','月'}
local 五十环 = {'琳琅盖','如意宫灯','玉腰弯弓','墨杆金钩','黄金剑','云龙绸带','劈水扇','破甲战锤','赤炎环','金错巨刃','鹰眼法杖','夜灵珠','黄金钺','鱼骨双剑','玄冰刺','幽路引魂','玉竹金铃','破天宝刀','羊角盔','钢甲','绿靴','乱牙咬','魔童大牙','荧光坠子','媚狐头饰','金缕羽衣','高速之星'}
local 六十环 = {'孔雀羽','玲珑盏','连珠神弓','玄铁矛','游龙剑','七彩罗刹','神火扇','震天锤','蛇形月','水晶帽','玉发女冠 ','夜魔披风','霓裳羽衣','追星踏月','攫魂铃','双魂引','风月宝链','八卦坠','惊涛雪','腾云杖','如意宝珠','乌金鬼头镰','赤焰双剑','青刚剌','满天星','青藤柳叶鞭','狼牙刀'}
local 七十环 = {'金刚伞','玉兔盏','游鱼戏珠','金蛇信','北斗七星剑','缚神绫','阴风扇','巨灵神锤','子母双月','醉浮生','引魂杖','沧海明珠','狂魔镰','墨玉双剑','华光刺','水晶棒','雷鸣嗜血鞭','龙鳞宝刀','乾坤帽','龙骨甲','九州履','兽王腰带','百窜云','碧水青龙','鬼牙攫魂','魔女发冠','流云素裙'}

---开始挖图
---@param flag boolean  是否挖仓库图
function wt:dig()
    checkFXQ()
    wt:getCount()
    wt:storage(true)
    mSleep(1000)
    useSYS()
    while true do
        self.baotu = {}
        self.blank_tmp = {}
        wt:getBaotu()
        wt:recordBaotu()
        wt:goDig()
        wt:storage(true)        
        if self.page ==0 then
            playAudio('GameBJ.mp3')
            lua_exit()    
        end
        if os.time()%3 == 0 then
            mSleep(math.random(5000, 20000))
        end
    end
end
 
function wt:getBaotu()
    self.begintime = os.time()
    openDepot()
    --欠费交钱
    if self.page ~= 1 then
        TClick(point["仓库选择"])
        randomClick(point["仓库编号1"][1]+ (self.page - 1) % 5 * view["仓库页数字间距"], point["仓库编号1"][2] + math.floor((self.page - 1) / 5) * view["仓库页数字间距"],5)
    end

    repeat
        local bx,by = fmcByTableInRect(item["藏宝图"],rect["仓库"],85,{main=0x202020,list = 0x353535})
        if bx ~=-1 then
            dTClick(仓库格子[getIndexOfStorgeByPoint(bx,by)],math.random(200, 400))
        elseif bx ==-1 and self.page <25  then
            TClick(point["仓库下一页"])
            self.page= self.page+1
        elseif self.page >=25 and bx == -1 then
            self.page = 0
            break
        end
    until (isBagFull())
end


function wt:recordBaotu()
    openBox()
    mSleep(1500)
    local bt= fmcAllByTableInRect(item["藏宝图"],rect["背包"])
    for _, value in ipairs(bt) do
        dTClick(背包格子[getIndexByPoint(value.x, value.y)],normalRandom(70,100))
        dTClick(背包格子[getIndexByPoint(value.x, value.y)],math.random(200, 500))
    end
    for index, value in ipairs(bt) do
        local i = getIndexByPoint(value.x,value.y)
        TClick(背包格子[i],math.random(800, 2000))
        local ret =ocrByDict(baotuDict,rect["宝图信息"],"0BC510,0B4410", 95)
        nLog(ret)
        if ret =='右键使用后显示' then
            dTClick(背包格子[i])
            repeat
                mSleep(1000)
                TClick(背包格子[i])
                local bl = mColor({{247,234,0xec215c},{223,207,0xb8b4e0},{287,203,0xb8b4e0},{270,236,0xf0ef9f},{208,202,0x091519}},95)
            until bl == true
            ret =ocrByDict(baotuDict,rect["宝图信息"],"0BC510,0B4410", 95)
        end
        local targetmap = strSplit(ret, "(")[1]:gsub('[%p%c%s%d]', '')
        local targetx = tonumber(strSplit(strSplit(ret, "(")[2], ",")[1] )
        local targety = tonumber(strSplit(strSplit(strSplit(ret, "(")[2], ",")[2], ")")[1])
        table.insert(self.baotu,{index = getIndexByPoint(value.x,value.y),targetmap = targetmap, targetx = targetx, targety = targety})
    end
    table.sort(self.baotu,function(a, b)
            if a.targetmap ~= b.targetmap then
                if os.time()%2 ==0 then
                    return  a.targetmap<b.targetmap
                else
                    return  a.targetmap>b.targetmap
                end
            else
                local atx,aty = a.targetx,a.targety
                local btx,bty = b.targetx,b.targety
                local am,bm = a.targetmap,b.targetmap
                local ax,ay = (rect.mapRect[am][3] -rect.mapRect[am][1])/map_size[am][1] * atx +rect.mapRect[am][1], rect.mapRect[am][4]- (rect.mapRect[am][4] -rect.mapRect[am][2])/map_size[am][2]*aty
                local bx,by = (rect.mapRect[bm][3] -rect.mapRect[bm][1])/map_size[bm][1] * btx +rect.mapRect[am][1], rect.mapRect[bm][4]- (rect.mapRect[bm][4] -rect.mapRect[bm][2])/map_size[bm][2]*bty
                local ad,bd = (ax-rect.mapRect[am][5])^2 + (ay-rect.mapRect[am][6])^2, (bx-rect.mapRect[bm][5])^2 + (by-rect.mapRect[bm][6])^2
                return ad <bd
            end
        end)
        nLog(tableToStr(self.baotu))
    tapClose()
end


function wt:goDig()
    -- for i = 1, #self.baotu do
    for i, v in ipairs(self.baotu) do
        nLog("第" .. i .. "张图" .. ", 目标:" .. v.targetmap .. v.targetx .. "," .. v.targety)
        go(v.targetmap, v.targetx, v.targety,self.cm)
        self.cm = v.targetmap
        openBox()    
        if os.time()%2 == 0 then
            local tmp =  fmcAllByTableInRect(item["藏宝图"],rect["背包"],85)
            if #tmp > 5  then
                for i = 1, math.random(1, 5), 1 do
                    TClick(背包格子[getIndexByPoint(tmp[i]['x'],tmp[i]['y'])])
                end
            end
        end
        --可能一次没挖成功 最多重复八次
        for t =  1, 4, 1 do
            -- waitDo(is(item["藏宝图"],背包格子[v.index]),2,背包格子[v.index])
            dTClick(背包格子[v.index])
            TClick(背包格子[v.index])
            if is(item["藏宝图"],背包格子[v.index],80) == false then
                nLog('挖图成功')
                self.record["挖图数"] = self.record["挖图数"] +1
                break
            end
            --输入坐标
            go(v.targetmap, v.targetx, v.targety,self.cm,1)
            openBox() 
            for t =  1, 3, 1 do
                -- waitDo(is(item["藏宝图"],背包格子[v.index]),2,背包格子[v.index])
                dTClick(背包格子[v.index])
                TClick(背包格子[v.index])
                if is(item["藏宝图"],背包格子[v.index]) == false then
                    nLog('挖图成功')
                    self.record["挖图数"] = self.record["挖图数"] +1
                    break
                end
                --输入坐标
                go(v.targetmap, v.targetx, v.targety,self.cm,1)
                local x,_ = fmcByTableInRect(item["藏宝图"],背包格子[v.index],85)
                if x ~=-1 then
                    nLog('可能坐标错误,请检查')
                    playAudio('GameBJ.mp3')
                    lua_exit()
                end
            end
        end  
        mSleep(1000)
        waitFight()
        checkHealth()
    end
end
---统计背包物品,丢弃垃圾
function wt:count()
    openBox()
    local th = {}
    local tmp = {}
    keepScreen(true)
    for i = 1, 20, 1 do
        for k, v in pairs(item) do
            local x,y = fmcByTableInRect(v,背包格子[i],85,{main = 0x202020,list = 0x353535})
            if x~=-1 then
                table.insert(tmp,i)
                th[tostring(i)] = k
                break
            end
        end
    end
    keepScreen(false)
    -- 统计有价值道具
    for key, value in pairs(th) do
        nLog(key..':'..value)
        if  isIn(value,{'黄色合成旗','白色合成旗','蓝色合成旗','红色合成旗','绿色合成旗','飞行符','摄妖香','藏宝图','红罗羹'}) == false then
            if isIn(value,{'魔兽要诀','金刚石','定魂珠','夜光珠','龙鳞','避水珠','金柳露','召唤兽内丹'}) then
                self.record[value] = self.record[value] +1
            elseif isIn(value,五十环) then 
                self.record['50环'] = self.record['50环'] +1
            elseif isIn(value,六十环) then 
                self.record['60环'] =   self.record['60环'] +1
            elseif isIn(value,七十环) then 
                self.record['70环'] =   self.record['70环'] +1
            elseif isIn(value,{'黑宝石','红玛瑙','月亮石','舍利子','太阳石','光芒石','神秘石'}) then 
                self.record['宝石'] =   self.record['宝石'] +1
            -- elseif value == '制造指南书'  then
            --     end
            -- elseif value == '百炼精铁'  then 
            --     TClick(背包格子[tonumber(key)])
            --     local lv = ocrByDict(itemInfoDict,rect["百炼精铁等级"],"D8DB12,2F2E11",94):gsub('%D+', '')
            --     if tonumber(lv) <= 30 then
            --         -- drop()
            --     elseif tonumber(lv) == 70 then
            --         self.record['70铁'] =   self.record['70铁'] +1
            --     elseif tonumber(lv) == 60 then
            --         self.record['60铁'] =   self.record['60铁'] +1
                -- end
            end
        else
            table.insert(self.blank_tmp,tonumber(key))
        end
    end

    local blankIndex = getBlankIndex(背包格子)
    for _, value in ipairs(blankIndex) do
        table.insert(self.blank_tmp,value)
    end
    nLog(#self.blank_tmp..':'.. tableToStr(self.blank_tmp))
end
---丢弃物品
function drop()
    click(fmcByTableInRect(view["删除"],rect["删除"],90))
    TClick(point["丢弃确认"])
    TClick(point["丢弃确认"])
end

function wt:storage()
    wt:count()
    if #self.blank_tmp ~=20 then
        openDepot()
        self.cm='西凉女国'
        chooseBlank()
        for i = 1, 20, 1 do
            if isIn(i,self.blank_tmp)== false then
                dTClick(仓库背包格子[i])
                local x,y = fmcByTableInRect(view["背包满"],rect["满提示"],90)
                nLog(x)
                if x~= -1 then
                    chooseBlank()
                    dTClick(仓库背包格子[i])
                end
            end
        end
    end
end



function wt:getCount()
    local jsonstr = readFileString(userPath() .. '/res/wtcount.json')
    if type(jsonstr) =="string"  then
        self.record = json.decode(jsonstr)
    end
    
end

function getBlankIndex(which)
    local t = {}
    for i = 1, 20, 1 do
        local x, y, n = findImageInRegionFuzzy("empty1.png,empty2.png,empty3.png,empty4.png,empty5.png", 85,which[i][1],which[i][2],which[i][3],which[i][4], 0, 3);
        n = n or -1
        if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
            table.insert(t,i)
        end 
    end
    return t
end

function chooseBlank()
    TClick(point['仓库选择'])
    keepScreen(true)
    local x, y = findColorInRegionFuzzy(0xffffff, 90,163,113,642,599)
    if x ~= -1 and y ~= -1 then 
        click(x+math.random(-25, 25),y+math.random(-25, 25))
    else
        playAudio('GameBJ.mp3')
        lua_exit()
    end
    keepScreen(false)
end


function checkHealth(blood,mana)
    mColorTap(view['背包打开'],point['关闭按钮']["背包"])
    local blood = blood or true
    local mana = mana or false
    if blood == true then
        if isColor(1290,9,0xee3203) == false then
            TClick(point["人物状态"])
            mColorTap(view['补充状态'],point['补充气血'])
        end
    end

    if mana == true then
        if isColor(1271,22,0x1d8af2)== false then
            TClick(point["人物状态"])
            mColorTap(view['补充状态'],point['补充魔法'])
        end 
    end
    mSleep(1000)
end

function waitFight()
    if mColorTap(view['战斗中-背包打开'],point['关闭按钮']["背包"],90) then
        repeat
            nLog('战斗中')
            mSleep(800)
            mColorTap(view['战斗选择'],point["自动战斗"],90,false)
            mSleep(2000)
            local x,y = fmcByTableInRect(view['自动小图标'],{0,0,height,width},90)
            if x ~= -1 then
                randomClick(x,y,3)
            end
            mSleep(1000)
        until (mColor(view['战斗中']) == false and mColor({{30,277,0xd8a655},{55,277,0xd8a655},{55,252,0xf0d698},{30,252,0xf0d698}}) == true)
    end
    nLog('战斗结束')
    local a =  getColor(979,26)
    mSleep(60)
    local b =  getColor(979,26)
    mSleep(60)
    local c =  getColor(979,26)
    if a==b and b==c then
        return true
    else
        nLog('宠物需治疗')
        go('朱紫国',12,91)
        if NPC(view['超级巫医']) then
            TClick(point['巫医治疗'])
            click(math.random(100, height),math.random(100, width))
        end
    end
end

return wt