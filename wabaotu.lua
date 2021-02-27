local wt = {}
wt.baotu = {}
wt.bt = {}
wt.things = {}
wt.page = 1
wt.record =  {
    ["魔兽要诀"] = 0,
    ["70铁"] = 0,
    ["60铁"] = 0,
    ["70环"] = 0,
    ["60环"] = 0,
    ["50环"] = 0,
    ["定魂珠"] = 0,
    ["金刚石"] = 0,
    ["夜光珠"] = 0,
    ["龙鳞"] = 0,
    ["避水珠"] = 0,
    ["金柳露"] = 0,
    ["召唤兽内丹"] = 0,
    ["宝石"] = 0,
    ["挖图数"] = 0
}

local 垃圾={'红罗伞','竹骨灯','铁胆弓','曲尖枪','铁齿剑','幻彩银纱','铁骨扇','镔铁锤','精钢日月圈','桃印铁刃','红木杖','水晶珠','开山斧','镔铁双剑','天狼爪','金丝魔棒','牛筋鞭',
            '苗刀','布帽','皮衣','牛皮靴','缎带','五色飞石','玉钗','丝绸长裙','紫竹伞','红灯笼','紫檀弓','锯齿矛','吴越剑','金丝彩带','精钢扇','八棱金瓜','离情环','赭石巨剑',
            '白椴杖','珍宝珠','双面斧','龙凤双剑','幽冥鬼爪','玉如意','乌龙鞭','夜麾弯刀','面具','梅花簪子','鳞甲','马靴','银腰带','珍珠链','五彩裙','锦绣帷','鲤鱼灯','宝雕长弓',
            '乌金三叉戟','青锋剑','无极丝','狼牙锤','金刺轮','璧玉长铗','墨铁拐','翡翠珠','双弦钺','竹节双剑','钢结鞭','金背大砍刀','纶巾','锁子甲','侠客履','水晶腰带','骷髅吊坠',
            '珍珠头带','龙鳞羽衣','幽兰帐','芙蓉花灯','宝雕錾金宝弓','火焰枪','龙泉剑','天蚕丝带','百折扇','烈焰锤','风火圈','青铜古剑','玄铁牛角杖','莲华珠','精钢禅钺','狼牙双剑',
            '勾魂爪','云龙棒','蛇骨鞭','雁翅刀','缨络丝带','紧身衣','神行靴','琥珀腰链','江湖夜雨','凤头钗','天香披肩'}

local 五十环 = {'琳琅盖','如意宫灯','玉腰弯弓','墨杆金钩','黄金剑','云龙绸带','劈水扇','破甲战锤','赤炎环','金错巨刃','鹰眼法杖','夜灵珠','黄金钺','鱼骨双剑','玄冰刺','幽路引魂','玉竹金铃','破天宝刀','羊角盔','钢甲','绿靴','乱牙咬','魔童大牙','荧光坠子','媚狐头饰','金缕羽衣','高速之星'}
local 六十环 = {'孔雀羽','玲珑盏','连珠神弓','玄铁矛','游龙剑','七彩罗刹','神火扇','震天锤','蛇形月','水晶帽','玉发女冠 ','夜魔披风','霓裳羽衣','追星踏月','攫魂铃','双魂引','风月宝链','八卦坠','惊涛雪','腾云杖','如意宝珠','乌金鬼头镰','赤焰双剑','青刚剌','满天星','青藤柳叶鞭','狼牙刀'}
local 七十环 = {'金刚伞','玉兔盏','游鱼戏珠','金蛇信','北斗七星剑','缚神绫','阴风扇','巨灵神锤','子母双月','醉浮生','引魂杖','沧海明珠','狂魔镰','墨玉双剑','华光刺','水晶棒','雷鸣嗜血鞭','龙鳞宝刀','乾坤帽','龙骨甲','九州履','兽王腰带','百窜云','碧水青龙','鬼牙攫魂','魔女发冠','流云素裙'}


function wt:getBaotu()
    goStorehouse()
    if self.page ~= 1 then
        TClick(point["仓库选择页"])
        click(point["仓库编号1"][1]+ (self.page - 1) % 5 * view["仓库页数字间距"], point["仓库编号1"][2] + math.floor((self.page - 1) / 5) * view["仓库页数字间距"])
    end
    --欠费交钱
    repeat
        local bx,by = fmcByTableInRect(view["藏宝图"],rect["仓库"],90)
        if bx ~=-1 then
            doubleClick(bx,by)
        elseif bx ==-1 and self.page <25  then
            TClick(point["仓库下一页"])
            self.page= self.page+1
        elseif self.page >=25 and bx == -1 then
            self.page = 1
            lua_exit()
        end
    until (isBagFull())
    openBox()
    self.bt = fmcAllByTableInRect(view["藏宝图"],rect["背包"],82,10)
    for index = 1, #self.bt, 1 do
        doubleClick(self.bt[index].x,self.bt[index].y,600)
        click( height/2 + math.random(-20, 20), width/2)
    end
end

function wt:recordBaotu()
    openBox()
    for index = 1, #self.bt, 1 do
        click(self.bt[index].x,self.bt[index].y,500)
        local ret = ocrByDict(btdict,rect["宝图信息"],"06C30A,063D0A#0EE810,0E2A10#08EA09,082009#09E10B,09270B", 90)
        nLog(ret)
        local targetmap = strSplit(ret, "(")[1]
        local targetx = tonumber(strSplit(strSplit(ret, "(")[2], ",")[1])
        local targety = tonumber(strSplit(strSplit(strSplit(ret, "(")[2], ",")[2], ")")[1])
        table.insert(self.baotu,{targetmap = targetmap, targetx = targetx, targety = targety, boxx = self.bt[index].x, boxy = self.bt[index].y})
    end
    table.sort(self.baotu,
    function(a, b)
            if a.targetmap ~= b.targetmap then
                return a.targetmap < b.targetmap
            elseif a.targetmap == b.targetmap  then
                local atx,aty = a.targetx,a.targety
                local btx,bty = b.targetx,b.targety
                local am,bm = a.targetmap,b.targetmap
                local ax,ay = (rect.mapRect[am][3] -rect.mapRect[am][1])/map_size[am][1] * atx +rect.mapRect[am][1], rect.mapRect[am][4]- (rect.mapRect[am][4] -rect.mapRect[am][2])/map_size[am][2]*aty
                local bx,by = (rect.mapRect[bm][3] -rect.mapRect[bm][1])/map_size[bm][1] * btx +rect.mapRect[am][1], rect.mapRect[bm][4]- (rect.mapRect[bm][4] -rect.mapRect[bm][2])/map_size[bm][2]*bty
                local ad,bd = (ax-rect.mapRect[am][5])^2 + (ay-rect.mapRect[am][6])^2, (bx-rect.mapRect[bm][5])^2 + (by-rect.mapRect[bm][6])^2
                return ad <bd
            end
        end)
    tapClose()
end


-- rect.mapRect[map][3] -rect.mapRect[map][1])/map_size[map][1]* x +rect.mapRect[map][1],
--           rect.mapRect[map][4]- (rect.mapRect[map][4] -rect.mapRect[map][2])/map_size[map][2]*y
function wt:dig()
    wt:initialize()
    while true do
        wt:getBaotu()
        wt:recordBaotu()
        wt:goDig()
        wt:storage()
        self.baotu = {}
    end
end

function wt:goDig()
    for i = 1, #self.baotu do
        nLog("第" .. i .. "张图" .. ", 目标:" .. self.baotu[i].targetmap .. self.baotu[i].targetx .. "," .. self.baotu[i].targety)
        go(self.baotu[i].targetmap, self.baotu[i].targetx, self.baotu[i].targety)
        openBox()
        --可能一次没挖成功
        repeat
            doubleClick(self.baotu[i].boxx, self.baotu[i].boxy)
            click( height/2 + math.random(-20, 20), width/2 )
            local x,_ = fmcByTableInRect(view["藏宝图"],背包格子[getIndexByPoint(self.baotu[i].boxx, self.baotu[i].boxy)],90)
        until  x == -1
        self.record["挖图数"] = self.record["挖图数"] +1
        mSleep(500)
        waitFight()
    end
end
---comment
function wt:count(writeFlag)
    openBox()
    for i = 1, 20, 1 do
        click(背包格子[i][1]+view["背包宽度"]/2,背包格子[i][2]+view["背包宽度"]/2,600)
        nLog(i)
        local a , _  =  fmcByTableInRect(view["格子有物品"],rect["背包"],90)
        if a~=-1  then           
            local name =baiduOCR(rect["背包道具名称"])
            nLog(name)
            if  isIn(name,垃圾) then
               drop()
            elseif isIn(name,五十环) then
                self.record['50环'] = self.record['50环']+1
                table.insert(self.things,i)
            elseif isIn(name,六十环) then
                self.record['60环'] = self.record['60环']+1
                table.insert(self.things,i)
            elseif isIn(name,七十环) then
                self.record['70环'] = self.record['70环']+1
                table.insert(self.things,i)
            elseif isIn(name,{'魔兽要诀','金刚石','定魂珠','夜光珠','龙鳞','避水珠','召唤兽内丹','金柳露'}) then
                self.record[name] = self.record[name]+1
                table.insert(self.things,i)
            elseif isIn(name,{'月亮石','光芒石','黑宝石','舍利子','红玛瑙','太阳石'}) then
                self.record['宝石'] = self.record['宝石']+1
                table.insert(self.things,i)
            elseif name =='百炼精铁' then
                local tlevel = strReomve(ocrByDict(levelDict,rect["百炼精铁等级"], 'ECED0F,28260F',88),'\\')
                if isIn(tlevel,{'等级10','等级20','等级30'}) then
                    drop()
                elseif tlevel == "等级40" then
                    table.insert(self.things,i)
                elseif tlevel == "等级50" then 
                    table.insert(self.things,i)
                elseif tlevel == "等级60" then 
                    self.record['等级60铁'] = self.record['60铁']+1
                    table.insert(self.things,i)
                elseif tlevel == "等级70" then 
                    self.record['70铁'] = self.record['70铁']+1
                    table.insert(self.things,i)
                end
            elseif name =='制造指南书' then
                local sleave, _=baiduOCR(rect["制造指南书等级"]):gsub('%D+', '')
                if isIn(sleave,{'10','20','30','40'}) then
                    drop()
            elseif isIn(name,{"白色合成旗","蓝色合成旗","黄色合成旗","红色合成旗","绿色合成旗","导标旗","飞行符","摄妖香"}) then
               
            else
                table.insert(self.things,i)
            end
        end
    end
end
    if writeFlag  then
            nLog(tableToStr(self.record))
            bool = writeFileString(userPath() .. "/res/wtcount.json", json.encode(self.record), "w")
    end
    allClose()
end


function drop()
    click(fmcByTableInRect(view["删除"],rect["删除"],90))
    TClick(point["丢弃确认"])
    TClick(point["丢弃确认"])
end

function wt:storage(writeFlag)
    wt:count(writeFlag)
    goStorehouse()
    for index, value in ipairs(self.things) do
        repeat
            doubleClick(背包格子[value][1]+view["背包宽度"]/2,背包格子[value][2]+view["背包宽度"]/2,500)
            if isBagFull() then
                TClick(point["仓库选择页"])
                local empty  = findColor_Tap(0xffffff,rect["仓库选择页"],95)
                if empty == false then
                    lua_exit()
                end
            end
        until (isBagFull() == false)
    end
end


function waitFight()
    if multiColor(view["战斗中"]) then
        tapClose()
        multiColor_Tap(view["战斗选择"],point["自动战斗"])
        local x,y = fmcByTableInRect(view["自动小图标"],{0,0,height,width},90)
        if x ~= -1 then
            click(x,y)
        end
        repeat
        mSleep(2000)
        until (multiColor(view["等待战斗"])==false)
    end
    local a =  getColor(point["宠物"][1],point["宠物"][2])
    mSleep(50)
    local b =  getColor(point["宠物"][1],point["宠物"][2])
    if a ~=b then
        useFXQ("傲来国",50,25)
        if NPC(view['超级巫医']) then
            TClick(point['巫医治疗'])
            click(math.random(100, height),math.random(100, width))
        end
    end
end





function wt:getCount()
    local jsonstr = readFileString(userPath() .. '/res/wtcount.json')
    self.things = json.decode(jsonstr)
end



function wt:initialize()
    useSYS()
    wt:storage(false)
end
return wt