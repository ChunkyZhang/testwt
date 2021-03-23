require("TSLib")

local api_key = "GBiYlKD5pgbSdYyzpDwF2CAA"
local secret_key = "YzeepAEKrYHnwRhQHj4hjpdwtoQh70Zz"

function tableToStr(t)
    if t == nil then
        return ''
    end
    local retstr = '{'

    local i = 1
    for key, value in pairs(t) do
        local signal = ','
        if i == 1 then
            signal = ''
        end
        if key == i then
            retstr = retstr .. signal .. ToStringEx(value)
        else
            if type(key) == 'number' or type(key) == 'string' then
                retstr = retstr .. signal .. '[' .. ToStringEx(key) .. ']=' .. ToStringEx(value)
            else
                if type(key) == 'userdata' then
                    retstr =
                        retstr .. signal .. '*s' .. TableToStr(getmetatable(key)) .. '*e' .. '=' .. ToStringEx(value)
                else
                    retstr = retstr .. signal .. key .. '=' .. ToStringEx(value)
                end
            end
        end

        i = i + 1
    end

    retstr = retstr .. '}'
    return retstr
end

function ToStringEx(value)
    if type(value) == 'table' then
        return tableToStr(value)
    elseif type(value) == 'string' then
        return "'" .. value .. "'"
    else
        return tostring(value)
    end
end

---单击
---@param x number or table
---@param y number
---@vararg  ... number
function click(x, y, ...)
    tap(x , y ,normalRandom(70,100), 'click_point.png')
    if select('#',...)>0 then
        mSleep(select(1, ...))
    else
        mSleep(math.random(800,1200))
    end
end

---偏移点击
---@param x number
---@param y number
---@param r number 默认10
function randomClick(x, y, r,...)
    local r = r or 5
    tap(x + math.random(-r, r), y + math.random(-r, r) , normalRandom(70,100), 'click_point.png')
    if select('#',...)>0 then
        mSleep(select(1, ...))
    else
        mSleep(math.random(500,700))
    end
end

---区域内单击
---@param pointTable table
---@param nil ...
function TClick(rectTable, ...)
    if #rectTable == 4 then
        local x = (rectTable[3]-rectTable[1])*normalRandom(50,70)/100 + rectTable[1]
        local y = (rectTable[4]-rectTable[2])*normalRandom(50,70)/100 + rectTable[2]
        click(x,y,...)
    elseif #rectTable == 2 then
        randomClick(rectTable[1],rectTable[2],...)
    end
end

---双击
---@param x number
---@param offset number
---@param y number
function doubleClick(x, y,offset,...)
  click(x + math.random(-offset,offset),y + math.random(-offset,offset),normalRandom(70,100))
  click(x + math.random(-offset,offset),y + math.random(-offset,offset),...)
end


---双击区域内
---@param x any
---@param y any
---@param nil ...

function dTClick(rectTable,...)
    TClick(rectTable,normalRandom(70,100))
    TClick(rectTable,...)
end

---三连击
---@param x any
---@param y any
---@param nil ...
function tripleClick(x,y, ...)
    click(x,y,normalRandom(70,100))
    click(x,y,normalRandom(70,100))
    click(x,y,...)
end

---三连击区域内
---@param rectTable any
---@param nil ...
function tripleClickInRect(rectTable,...)
    TClick(rectTable,math.random(600,1000))
    TClick(rectTable,normalRandom(70,100))
    TClick(rectTable,...)
end


---多点找色 返回单个 
---@param colorTable table 颜色列表
---@param rect table 查找范围
---@param sim number 相似度 默认90
---@param main number 第一个点的色差 16进制RGB
---@param list number  列表色差  16进制RGB
---@param max_miss number 最多几个点不符合
---@param orient number  0-8
---@return x,y
function fmcByTableInRect(colorTable, rect, sim,main,list,max_miss,orient)
    local rect = rect or {0,0,height,width}
    local sim  = sim or 90
    local main = main or 0x202020
    local list = list or 0x202020
    local max_miss = max_miss or 0
    local orient = orient or 0
    return findMultiColorInRegionFuzzyByTable(colorTable, sim, rect[1], rect[2], rect[3], rect[4],{max_miss = max_miss,orient =orient,list = list,main = main})
end


---字库文字识别
---@param dict any 字典
---@param rect table 范围
---@param color string 偏色 可以多组用#拼接如
---@param sim any 相似度
---@return string 识别结果
function ocrByDict(dict, rect, color, sim)
    return tsOcrText(dict, rect[1], rect[2], rect[3], rect[4], color, sim)
end

---寻找某字坐标
---@param dict any 字库
---@param word string
---@param rect table
---@param color string
---@param sim nil
---@return number
---@return number
function findWord(dict,word,rect,color,sim)
    local x,y =tsFindText(dict,word,rect[1],rect[2],rect[3],rect[4],color,sim)
    return x,y
end

---多点找色 返回所有 
---@param colorTable any
---@param rect table
---@param sim number 相似度
---@param main number 标准点 16进制偏色 
---@param list number 颜色列表 16进制偏色 
---@param orient number 0-8
---@param miss number  最小间距
---@return table     {{'x' = 1,'y' = 2},{'x' = 3 ,'y' = 4}}
function fmcAllByTableInRect(colorTable,rect,sim,main,list,miss,orient)
    local str1,str2 = toStringType(colorTable)
    local main = main or 0x202020
    local list = list or 0x202020
    local sim = sim or 90
    local miss = miss or 10
    local orient = orient or 0
    return findMultiColor(str1,str2,sim, rect[1], rect[2], rect[3], rect[4],{miss = miss , orient =orient,list = list,main = main})
end


function getIndexByPoint(x,y)
    return  math.ceil((x-point["背包第一格"][1])/view["背包宽度"]) + math.floor((y-point["背包第一格"][2])/view["背包宽度"])*5
end

function getIndexOfStorgeByPoint(x,y)
    return  math.ceil((x-point["仓库第一格"][1])/view["背包宽度"]) + math.floor((y-point["仓库第一格"][2])/view["背包宽度"])*5
end

function isBagFull()
    local bx, by =  fmcByTableInRect(view["背包满"],rect["满提示"],90)
    if bx==-1 then
        return false
    else
        return true
    end
end
---判断范围内是否有
---@param colorTable table 颜色列表
---@param rect table 查找范围
---@param sim number 相似度 默认90
---@param main number 第一个点的色差 16进制RGB
---@param list number  列表色差  16进制RGB
---@param miss number 最小间距
---@param orient number  0-8
---@return boolean
function is(colorTable,rect,sim,main,list,miss,orient)
    local rect = rect or {0,0,height,width}
    local sim  = sim or 90
    local main = main or 0x202020
    local list = list or 0x202020
    local miss = miss or 10
    local orient = orient or 0
    local x ,_ = fmcByTableInRect(colorTable,rect,sim,main,list,orient,miss)
    if x~=-1 then
        return true
    else
        return false
    end
end

---comment
---@param e any
---@param t table
---@return boolean
function isIn(e,t)
    for _, value in ipairs(t) do
        if e == value then
        return  true
        end
    end
    return false
end

---删除字符串中的某个字符
---@param str string 原字符串
---@param remove string  需要删除的字符
---@return string
function strReomve(str,remove)
    local lcSubStrTab = {}
    while true do
        local lcPos = string.find(str,remove)
        if not lcPos then
            lcSubStrTab[#lcSubStrTab+1] =  str    
            break
        end
        local lcSubStr  = string.sub(str,1,lcPos-1)
        lcSubStrTab[#lcSubStrTab+1] = lcSubStr
        str = string.sub(str,lcPos+1,#str)
    end
    local lcMergeStr =""
    local lci = 1
    while true do
        if lcSubStrTab[lci] then
            lcMergeStr = lcMergeStr .. lcSubStrTab[lci] 
            lci = lci + 1
        else 
            break
        end
    end
    return lcMergeStr
end

function findColor_Tap(color,rect,sim)
    local x, y = findColorInRegionFuzzy(color,sim,rect[1],rect[2],rect[3],rect[4])
    if x ~=-1 then
    click(x,y)
    end
end


---百度ORC识别   需要先获得token
---@param rect table  传入你需要识别的位置信息 格式为table
---@param access_token  string  你的token
---@return any  返回识别到的字符串  
function baiduOCR(rect,access_token)
    local pic_name = userPath() .. "/res/baiduAI.jpg"
    --截图
    snapshot(pic_name,rect[1],rect[2],rect[3],rect[4])
    --由于百度免费限制一秒最多两次 所以加了延时
    mSleep(550)
    -- 给百度传图片信息
    local code2, body =baiduAI(access_token,pic_name,{language_type = "CHN_ENG",detect_direction = "true",detect_language = "false",paragraph = "true",probability = "true",ocrType = 1})
    --如果识别成功返回字符串  不成功返回false
    if code2 then
        --解析百度的返回结果
        return json.decode(body).words_result[1].words
    else
        return false
    end
end


---多点比色 符合就点击 找到返回true 否则返回false
---@param colorTable table
---@param point table
---@param sim number
---@param flag boolean
---@return boolean  
function mColorTap(colorTable,point,sim,flag)
    local sim = sim or 90
    local flag = flag or false
    if multiColor(colorTable,sim,flag) == true then
        TClick(point)
        return true 
    else
        return false
    end
end

---多点比色 找到返回true
---@param array table
---@param dim number
---@param flag boolean
---@return boolean
function mColor(colorTable,sim,flag)
    local sim = sim or 90
    local flag = flag or false
    return multiColor(colorTable,sim,flag)
end


---生成符合正态分布的随机数
---@param mean number 平均值
---@param variance number  方差
---@return number
function normalRandom(mean, variance)
	return  math.sqrt(-2 * variance * math.log(math.random())) * math.cos(2 * math.pi * math.random()) + mean
end


---知道出现某画面点击
---@param method bool  判断条件
---@param action function 点击方法 0不操作   1 点击  2双击
---@param point table   点击范围或者点
---@param dur any    持续时长(秒)  默认 5秒
---@param check boolean 是否检查
function waitDo(method,action,point,dur,check)
    local action = action or 1
    local point = point or {}
    local dur = dur or 5
    local check = check or true
    local t1 = os.time()
    while true do
        nLog('等待')
        mSleep(100)
        if method == true then
            break
        end
        if (os.time()-t1) >= dur then
            if check then
                nLog('需要检测')
                playAudio("GameBJ.mp3")
                lua_exit()
            else  
                nLog('不需要检测')
                playAudio("GameBJ.mp3")
                lua_exit()
            end
        end
    end

    if action == 1 then
        TClick(point)
    elseif action ==2 then
        dTClick(point)
    else
        return true
    end

end


function getEmptyBoxIndex()
    local tab = {}
    keepScreen(true)
    for i = 1, 20 do
        x, y, n = findImageInRegionFuzzy("empty1.png,empty2.png,empty3.png,empty4.png,empty5.png", 90, 背包格子[i][1], 背包格子[i][2], 背包格子[i][3], 背包格子[i][4], 0, 3);
        if x ~= -1 and y ~= -1 then        
            table.insert(tab,getIndexByPoint(x,y))
        end
    end
    keepScreen(false)
    return tab
end