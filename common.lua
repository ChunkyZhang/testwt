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
---@param x number
---@param y number
---@vararg  ... number
function click(x, y, ...)
    local ms = math.random(40, 120)
    tap(x + math.random(-2, 2), y + math.random(-2, 2), ms, 'click_point.png')
    if select('#',...)>0 then
        mSleep(select(1, ...))
    else
        mSleep(350+math.random(-30,30))
    end
end

---单击
---@param pointTable table
---@param nil ...
function TClick(pointTable, ...)
    click(pointTable[1],pointTable[2],...)
end

---双击
---@param x number
---@param y number
function doubleClick(x, y,...)
    math.randomseed(os.time())
    local ms = math.random(100, 140)
    click(x,y,ms)
    click(x,y,...)
end
---连续三次点击
---@param x any
---@param y any
---@param nil ...
function tripleClick(x,y, ...)
    math.randomseed(os.time())
    local ms = math.random(100, 140)
    local ms1 = math.random(100, 140)
    click(x,y,ms)
    click(x,y,ms1)
    click(x,y,...)
end

function quadriClick(x,y, ...)
    math.randomseed(os.time())
    click(x,y,math.random(100, 140))
    click(x,y,math.random(100, 140))
    click(x,y,math.random(100, 140))
    click(x,y,...)
end


---多点找色 返回单个 可选参数为{orient = 0,main =0x101010,list=0X101010, max_miss = 2}
--- orient	number	否	0 - 8 代表找色方向
--- main    number	否	基准点的偏色，  例如 main = 0x101010（十六进制）
--- list	number	否	周边参照点的偏色,例如 list = 0x202020（十六进制） 
--- max_miss	number	否	最大不匹配数，默认 0，代表所有参考点都匹配]]
---@param colorTable table 颜色表
---@param rect table 范围
---@param sim number 相似度
---@return   number x,number y
function fmcByTableInRect(colorTable, rect, sim,...)
    return findMultiColorInRegionFuzzyByTable(colorTable, sim, rect[1], rect[2], rect[3], rect[4],...)
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
---@param colorTable table
---@param rect table
---@param sim number
---@return table  table = {{x = 100,y = 110}, {x = 200,y = 210},{x = 300,y = 310}, ...}
function fmcAllByTableInRect(colorTable,rect,sim,miss)
    return findMultiColor(colorTable[1][3],toStringType(colorTable),sim, rect[1], rect[2], rect[3], rect[4],{miss = miss})
end

------------------------
function getIndexByPoint(x,y)
    return (math.ceil((x-point["背包第一格"][1])/view["背包宽度"]) + math.floor((y-point["背包第一格"][2])/view["背包宽度"])*5)
end


function isBagFull()
    local bx, by =  fmcByTableInRect(view["背包满"],rect["背包满提示"],90)
    if bx==-1 then
        return false
    else
        return true
    end
end
---是否某颜色特征
---@param name string
---@param rect table
---@param sim number
function is(name,rect,sim)
    local x ,_ = fmcByTableInRect(view[name],rect,sim)
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


function multiColor_Tap(colorTable,point)
    local i = multiColor(colorTable,90,0)
    if  i == true then
        TClick(point)
        return true
    else
        return false
    end
end

function baiduOCR(rect)
    local pic_name = userPath() .. "/res/baiduAI.jpg"
    snapshot(pic_name,rect[1],rect[2],rect[3],rect[4])
    mSleep(300)
    local code2, body =baiduAI(access_token,pic_name,{language_type = "CHN_ENG",detect_direction = "true",detect_language = "false",paragraph = "true",probability = "true",ocrType = 1})
    if code2 then
        return json.decode(body).words_result[1].words
    else
        return false
    end
end
---多点符合点击最后一个坐标
---@param colorTable table 颜色列表
---@param sim number 相似度
---@param flag boolean 是否保持静态图片
---@return boolean
function mulColTap(colorTable,sim,flag)
    return multiColTap(colorTable,sim,'click_point.png',flag)
end