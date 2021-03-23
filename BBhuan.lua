BBhuan = {loop, npc, item, BY, score}

--获取任务
function BBhuan:GetMisson()
    --检查是否有任务,没有就去马真人领取
    --识别任务
    local o = {
        --设定各个项的值
        loop = len or 0,
        npc = wid or 0,
        item = len * wid,
        BY = 0,
        score = 0
    }
    setmetatable(o, {__index = self})
    --将自身的表映射到新new出来的表中
    return o
end
--跑环
function BBhuan:pao()
    -- body
end




gridW = 185
gridH = 173
keepScreen(true)
local begin = os.clock()
local count = 0
for row = 1, 3 do
    for col = 1, 6 do
        for i, v in pairs(item) do
            local x, y =
                findMultiColorInRegionFuzzyByTable(
                item[i].colorTable,
                80,
                bx1 + gridW * (col - 1),
                by1 + gridH * (row - 1),
                bx1 + gridW * (col - 1) + 84,
                by1 + gridH * (row - 1) + 84,
                {orient = 1}
            )
            if x ~= -1 and y ~= -1 then
                nLog("识别到" .. "\r\n" .. row .. "," .. col .. "物品名称:" .. i)
                count = count + 1
                break
            end
        end
    end
end
nLog(string.format("total time:%.2fms\n", ((os.clock() - begin) * 1000)) .. "总共识别:" .. count)
keepScreen(false)

