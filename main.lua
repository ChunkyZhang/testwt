local ts = require("ts")
local map = require("map")
local wt = require("wabaotu")
local item_1792828 = require "item_1792828"
json = ts.json
local watu = require("wabaotu")
init(1)
FXQ = {} -- 飞行旗信息全局变量
Menpai = "五庄观"
maxDelay = 5000
摄妖香时间 = 0

local api_key = "GBiYlKD5pgbSdYyzpDwF2CAA"
local secret_key = "YzeepAEKrYHnwRhQHj4hjpdwtoQh70Zz"
access_token = "24.4688ec03545918f2af9986ce43d1c088.2592000.1616742864.282335-15164114"
btdict = addTSOcrDict("baotudict.txt")
fxqdict = addTSOcrDict("fxqdict.txt")
currentCoordsDict = addTSOcrDict("coords.txt")
currentMapDict = addTSOcrDict("currentMap.txt")
levelDict = addTSOcrDict("level.txt")
width, height = getScreenSize()
fullscreen = {0, 0, height, width}
if width == 828 and height == 1792 then
    item = require("item_1792828")
    view = require("view_1792828")
end

rect = view.rect
point= view.point


背包格子 = {}
仓库格子 = {}
仓库背包格子 = {}
for i = 1, 20, 1 do
    local x1 = point["背包第一格"][1]+ (i - 1) % 5 * view["背包宽度"]
    local y1 = point["背包第一格"][2] + math.floor((i - 1) / 5) * view["背包宽度"]
    背包格子[i] = { x1,y1,x1+view["背包宽度"],y1+view["背包宽度"]}

    local x1 = point["仓库第一格"][1]+ (i - 1) % 5 * view["背包宽度"]
    local y1 = point["仓库第一格"][2] + math.floor((i - 1) / 5) * view["背包宽度"]
    仓库格子[i] = { x1,y1,x1+view["背包宽度"],y1+view["背包宽度"]}

    local x1 = point["仓库背包第一格"][1]+ (i - 1) % 5 * view["背包宽度"]
    local y1 = point["仓库背包第一格"][2] + math.floor((i - 1) / 5) * view["背包宽度"]
    仓库背包格子[i] = { x1,y1,x1+view["背包宽度"],y1+view["背包宽度"]}
end

recordFXQ()
wt:dig()

function beforeUserExit()
    --结束前储存导标旗信息
    bool = writeFileString(userPath() .. "/res/FXQ.json", json.encode(FXQ), "w")
end
lua_exit()