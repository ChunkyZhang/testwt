local ts = require('ts')
local map = require('map')
local wt = require('wabaotu')
-- local item_1792828 = require 'item_1792828'
local image = require('tsimg')  
local view_1792828 = require "view_1792828"
json = ts.json
local watu = require('wabaotu')
-- local dict = require('dict')
init(1)
FXQ = {} 
maxDelay = 5000
摄妖香时间 = 0
三花聚顶时间 = 0
local api_key = 'GBiYlKD5pgbSdYyzpDwF2CAA' --你的百度开发平台需要创建一个应用  然后把apikey 和 secret_key复制过来
local secret_key = 'YzeepAEKrYHnwRhQHj4hjpdwtoQh70Zz'
access_token = '24.4688ec03545918f2af9986ce43d1c088.2592000.1616742864.282335-15164114'
width, height = getScreenSize()
fullScreen = {0, 0, height, width}
if width == 828 and height == 1792 then
    item = require('item_1792828')
    view = require('view_1792828')
elseif width == 750 and height == 1334  then
    -- item = require('item_1334750')
    item = require('item_1334750')
    view = require('view_1334750')
    baotuDict = addTSOcrDict("baotuInfo.txt")
    currentMapDict = addTSOcrDict("currentMap_1334750.txt")
    itemInfoDict = addTSOcrDict("itemInfo.txt")
    coordsDict = addTSOcrDict("coords_1334750.txt")
end
rect = view.rect
point= view.point
背包格子 = {}
仓库格子 = {}
仓库背包格子 = {}
for i = 1, 20, 1 do
    local x1 = point['背包第一格'][1]+ (i - 1) % 5 * view['背包宽度']
    local y1 = point['背包第一格'][2] + math.floor((i - 1) / 5) * view['背包宽度']
    背包格子[i] = { x1,y1,x1+view['背包宽度'],y1+view['背包宽度']}

    local x1 = point['仓库第一格'][1]+ (i - 1) % 5 * view['背包宽度']
    local y1 = point['仓库第一格'][2] + math.floor((i - 1) / 5) * view['背包宽度']
    仓库格子[i] = { x1,y1,x1+view['背包宽度'],y1+view['背包宽度']}

    local x1 = point['仓库背包第一格'][1]+ (i - 1) % 5 * view['背包宽度']
    local y1 = point['仓库背包第一格'][2] + math.floor((i - 1) / 5) * view['背包宽度']
    仓库背包格子[i] = { x1,y1,x1+view['背包宽度'],y1+view['背包宽度']}
end 

if mColor({{554,159,0xa0c7d3},{553,168,0x88b4c1},{548,163,0x94becc}}) then
    TClick({528,138,558,190})
end

if mColor({{30,471,0x284f60},{29,460,0xb8e8f8},{43,471,0x284f60},{56,471,0x284f5f},{52,461,0xb3e8f8}}) then
    TClick({357,529,383,546})
end
Menpai = getMenpai()

wt:dig()

function beforeUserExit() 
    --结束前储存导标旗信息
    bool = writeFileString(userPath() .. '/res/FXQ.json', json.encode(FXQ), 'w')
end