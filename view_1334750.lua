local view = {}
view = {
    坐标键盘间距 = 108,
    仓库页数字间距 = 96,
    背包宽度 =  95,
    point = {
        底部按钮开关= {1244,682,1300,732},
        快捷法术 ={1086,695,1113,731},
        道具 ={1162,694,1195,731},
        好友 = {1249,590,1294,627},
        缩小消息= {523,596},
        小地图  ={50,33,218,73},
        宝象国仓库 = {502,174,553,272},
        西梁女国仓库 = {648,117,686,178},
        仓库操作 = {977,411,1280,481},
        仓库下一页 = {350,626,403,677},
        自动战斗 = {1250,681,1308,730},
        仓库编号1 = {392,184},
        仓库选择 = {234,638,326,670},
        背包第一格 = {620,178},
        仓库第一格 = {145,208},
        仓库背包第一格 = {650,208},
        丢弃确认 = {732,436,895,483},
        宠物 = {949,5,994,52},
        召唤兽头像 = {1011,1,1087,79},
        人物头像 = {1170,2,1252,86},
        ['人物状态'] ={1262,7,1331,49},
        巫医治疗 ={985,227,1274,297},
        临时道具_道具 ={1036,540,1203,604},
        临时道具 = {1034,455,1203,515},
        获得全部 = {442,575,639,621},
        清空临时道具 = {691,578,883,620},
        摄妖香时间 = {1519,207},
        查看任务详情 = {1642,207},
        显示任务 = {1704,307},
        隐藏 ={43,264},
        ['返回'] ={24,667,80,721},
        ['补充气血'] ={978,86,1114,136},
        ['补充魔法'] ={1156,87,1306,136},
        ['行囊'] ={795,121,923,159},

        我要去 = {978,319,1279,386},
        去墨家村 = {981,225,1273,294},
        全部摊位 = {242,662,306,724},

        左上空白 = {34,97,85,121},
        中上空白 = {535,7,708,53},
        右上空白 = {1289,69,1331,158},
        右下空白 = {1283,475,1332,575},
        左下空白 = {4,610,123,677},
        左中空白 ={7,307,37,390},
        ['仙灵店铺'] = {
            加 = {1258,558,1287,587},
            购买 = {1092,654,1254,699},
            摄妖香 = {1013,99,1082,169},
            洞冥草 = {918,273,987,344},
            天眼通符 = {1012,448,1084,520},
            飞行符 = {1108,449,1178,517},
            乾坤袋 = {1202,449,1271,519},
            血色茶花 = {1202,273,1272,344},
            绿色飞行旗 = {918,186,988,255},
        },
        ['飞行符'] = {
            ['长寿村']   ={512,185,553,239},
            ['宝象国']   = {492,392,529,434},
            ['朱紫国']   = {580,483,616,527},
            ['建邺城']   = {820,428,876,482},
            ['傲来国']   = {1028,507,1079,563},
            ['长安城']   = {772,303,866,382},
            ['西梁女国'] = {504,283,545,319},
            },
        ['关闭按钮'] = {
            ['背包'] ={1094,40,1134,80},
        }
        
    },
    rect = {
        宝图信息    ={304,352,518,386},
        背包      ={617,175,1099,565},
        飞行旗信息  = {265,336,532,385},
        当前坐标    = {99,59,222,86},
        当前地图    = {104,24,216,54},
        快捷技能    ={455,555,1239,685},
        底部按钮    = {411,669,1316,749},
        仙灵店铺    = {1224,103,1730,576},
        满提示   ={384,305,533,415},
        仓库       ={142,204,617,594},
        是否自动战斗  = {1261,693,1617,824},
        物品详情   ={296,197,519,248},
        删除 = {103,114,204,717},
        仓库选择页 = {167,120,644,591},
        背包道具名称 = {293,198,543,241},
        百炼精铁等级 = {204,368,312,407},
        制造指南书等级 ={306,341,447,382},
        摄妖香时间 = {1286,180,1413,220},
        仓库合成旗 ={650,371,983,419},
        宽商店第一格={207,214,285,292},
        ['人物状态'] ={1260,6,1325,46},
        ['召唤兽'] ={1095,5,1158,37},
        --#region
        mapRect = {
            长安城= {186,131,1147,618,209,601,1166,56},
            朱紫国= {265,123,1066,625,305,601,1085,49},
            傲来国= {300,128,1032,620,323,174,1051,50},
            建邺城= {175,129,1158,620,353,535,1176,55},
            普陀山= {421,156,1078,648,985,592,1096,82} ,
            五庄观= {421,155,1077,647,477,598,1096,81} ,
            狮驼岭= {418,152,1081,650,1026,194,1100,79},
            墨家村= {559,40,940,709,889,687,958,21},
            大唐国境={434,101,1065,704,1024,446,1085,29},
            大唐境外={133,275,1199,474,160,375,1218,201},
            女儿村= {472,62,1028,687,986,631,1046,43},
            花果山= {425,158,1073,646,464,605,1092,83},
            麒麟山= {415,158,1083,645,1019,625,1102,83},
            北俱芦洲= {422,154,1077,649,970,340,1096,79},
            江南野外={418,153,1080,650,504,195,1100,82,},
            长寿郊外={471,158,1027,645,927,191,1046,88},
            化生寺= {626,173,1348,714,664,669,1370,96},
            东海湾= {506,158,994,646,783,560,1019,87},
            宝象国= {466,92,1323,734,1085,353,1344,15},
        } ,
        ["飞行旗使用界面"] = {
            ['长寿村']  = {473,134,860,642},
            ['长安城']  = {186,145,1147,632},
            ['朱紫国']  = {265,137,1067,640},
            ['傲来国']  = {299,141,1032,634}
        } 

    },
    ['快捷技能'] = {
        使用飞行符  ={{999,611,0x0c0e00},{970,587,0xe68034},{1027,586,0xec7320},{970,641,0xb03c18},{1024,644,0xaa3916},{1029,624,0xdc6727},{972,605,0xe06d23}},
        仙灵店铺  = {{832,614,0x2197cc},{833,593,0x002031},{826,597,0x32aada},{819,614,0x2d8cbc},{806,612,0x000f0f},{845,641,0x00080f},{849,615,0x298dc1}},
        自动设置 = {{905,606,0x001820},{886,596,0x000805},{930,593,0x001820},{924,619,0x00171a},{937,609,0x1888c0},{918,599,0x30abd8},{916,627,0x147ab1},{908,643,0x00100d}},
        摆摊   = {{1096,604,0x001c20},{1068,599,0x001c20},{1086,638,0x002030},{1099,630,0x176fa7},{1071,631,0x136da8},{1084,592,0x3fb1dc},{1108,605,0x001515}},
        ['千里神行']={{545,600,0x001800},{548,591,0xaac475},{561,642,0x315c20},{575,636,0x082400},{541,613,0x528132}},
        ['三花聚顶']={{912,626,0x002410},{890,590,0x002510},{912,590,0x003c20},{933,590,0x002410},{885,640,0x426126},{889,609,0x879f48},{905,627,0xbfd878}},
        ['斗转星移']={{547,605,0x002f16},{562,638,0x002010},{550,624,0x003c20},{573,619,0x00371c},{585,600,0x002410},{589,634,0x002410},{566,611,0xadc373},{549,591,0xa0b860}},
    },

    ['合成旗'] = {
        红色合成旗 = {{760,226,0xebce23},{750,223,0xdb0f0a},{746,210,0xb70908},{760,208,0xe41210},{780,201,0xcf0a0e},{753,197,0xb8b0d5},{754,239,0xb8b0d8}},
        蓝色合成旗 = {{663,227,0xd5c93b},{658,218,0x000001},{654,202,0x003ca8},{654,211,0x0040b8},{684,201,0x003fb6},{679,206,0xcd8401},{659,223,0x004fe2}},
        白色合成旗 = {{754,223,0xf0f8ea},{760,219,0xc0b88d},{773,206,0xd28600},{758,205,0xdfc92f},{751,243,0x8f9287}},
        绿色合成旗 = {{851,213,0x010200},{845,224,0x38da00},{868,206,0xbd7e02},{848,224,0x38e900},{849,238,0xb8b0d8},{834,199,0xb8b0d8},{846,209,0x38e000}},
        黄色合成旗 = {{949,219,0xca9900},{939,224,0xf0e304},{956,206,0x5809ad},{968,201,0xf0e608},{944,238,0xb8b0d8},{934,239,0xb8b0d8}},
    },
    ['背包打开']={{1113,58,0x183850},{970,661,0x701428},{643,662,0x70142b},{432,657,0x701430},{192,657,0x701430},{1181,141,0x182428},{631,125,0x591020},{511,66,0x384488}},
    ['道具图标'] ={{1175,698,0xf8f767},{1170,682,0xf84040},{1162,692,0xe51214},{1193,709,0xa81008},{1183,714,0xa81008},{1175,714,0xf7c647},{1169,714,0xc80e10}},
    ['飞行符'] = {{1043,227,0x682cb0},{1034,235,0xa6632e},{1018,217,0xb8b0d8},{1036,208,0xb8b0d8},{1045,209,0x9e6028},{1071,223,0x8d5220}},
    ['摄妖香']={{764,391,0xdfda9f},{765,399,0xb0af74},{754,399,0x35333e},{764,411,0x9c96b8},{761,383,0xb8b0d8},{757,430,0xa1a07b}},
    ['背包满']={{409,349,0x405860},{436,351,0x3b5860},{422,353,0xf8fc38},{421,362,0xf0f424},{409,362,0xf0f42b},{433,362,0xf0f424},{422,372,0xeaed08},{408,372,0x304850},{437,375,0x304450}},
    ['战斗中-背包打开']={{56,181,0x4d5f64},{56,194,0x40515a},{77,187,0x101e24},{38,306,0x84715a},{73,297,0x7c4728}},
    ['补充状态'] ={{976,81,0x406470},{1050,91,0x385868},{1227,89,0x385868},{1228,135,0x305060},{1044,132,0x305066}},
    ['飞行符使用界面']={{1113,188,0x183850},{235,173,0x182428},{655,341,0xc8ba60},{996,523,0xf0f8c8},{748,382,0x98d868}},
    ['仙灵店铺']={{843,49,0x182c38},{1283,47,0x183450},{838,112,0xb8b4e0},{867,669,0x701830},{1115,673,0x701430},{1283,683,0x182c38}},
    
    
    ['自动小图标']={{579,209,0xf0f838},{602,208,0xf0f841},{591,235,0x304048},{644,366,0x385868},{780,365,0x385868},{911,363,0x385b6e}},
    ['战斗中']={{53,177,0x9cbac4},{53,190,0x80a0a9},{26,183,0x1e3843},{56,316,0xf8cc9d},{67,108,0x372f0f}},
    ['自动设置']={{740,403,0xf0f839},{763,403,0xf0f839},{741,427,0xe8ec00},{752,417,0x304850},{807,570,0x305060},{941,573,0x2f4c60},{937,593,0x305260},{900,571,0x304d60}},
    ['空白格子']={{852,516,0xb8b0d8},{851,545,0xb8b0d8},{945,514,0xb8b0d8},{893,591,0xb8b0d8},{873,538,0xb8b0d8},{905,571,0xb8b0d8},{943,549,0xb8b0d8},{888,542,0xb8b0d8},{903,565,0xb8b0d8}},
    ['删除']={{150,442,0x2a4148},{147,442,0xc8d0f8},{153,442,0xc8d0f8},{159,442,0xc8d0f8},{167,439,0x304850},{137,441,0x304850},{150,429,0xd8def0},{150,456,0x395859},{167,463,0x0a161a}},
    ['战斗选择']={{1278,707,0x809eac},{1293,256,0x39b1d1},{1180,708,0xe0910e},{869,689,0x4880cb}},
    ['等待战斗']={{117,176,0x1d3847},{123,203,0x8caab8},{116,239,0x203642},{128,345,0xf8ca9d},{91,334,0x9cda02}},
    ['格子有物品']= {{1309,406,0xf0e848},{1315,510,0xf0e848},{1263,481,0xf0e848},{1366,459,0xf0e848},{1297,406,0xf0e848},{1366,435,0xf0e848}},
    ['仓库欠费']={{1280,719,0x182c38},{785,717,0x182c38},{189,736,0x203440},{1606,489,0x385468},{243,391,0xf0c7a0}},
    ['临时道具']={{1478,600,0x406470},{1484,640,0x305468},{1502,510,0x385868},{1581,509,0x385868},{1563,633,0xf3f5f7}},
    ['底部按钮']={{1271,706,0x9ec3d0},{1171,697,0xee2824},{711,700,0xf8dc5a},{534,691,0xf8fcf0},{479,707,0xf8aa14}},
    ['界面关闭按钮']={{1093,62,0x285078},{1113,75,0x285c88},{1134,59,0x305c80},{1125,60,0x305880},{1112,59,0x183850},{1123,49,0x183b50},{1103,49,0x204058},{1122,78,0x306898}},
    ["飞行旗定位点"] ={{490,476,0xbc2c10},{480,473,0xc22d10},{498,474,0xb82810},{486,458,0xf8ebe1},{488,462,0xf59b66},{482,474,0xc02c10}},
    ['快捷法术栏开启']={{1099,603,0x002843},{1086,599,0x2194cb},{1197,642,0xb03c1e},{1148,638,0xba4a20},{1070,602,0x001820}},
    ['超级巫医']={{229,481,0x7ebdfb},{303,485,0x80c0ff},{276,480,0x7fbefb},{274,510,0xebd834},{192,502,0xe8d533},{229,516,0xead734},{253,511,0xebd834},{282,486,0x80c0ff}},
    ['巫医对话界面']={{189,738,0x203440},{487,743,0x182c38},{1561,535,0x305068},{1695,613,0xa0c0c8}},
    ['显示任务']={{1704,299,0xffdd52},{1703,310,0xffca26},{1704,315,0xffbe24}},
    ['隐藏任务']={{1451,303,0xffd336},{1540,203,0xf05e38}},
    ['全部摊位']={{281,662,0x365457},{256,669,0x355258},{274,673,0x88b4c0},{273,703,0x608da0},{290,690,0x78a4b0}},
    ['隐藏返回']={{33,668,0x304a50},{68,668,0x304a50},{31,717,0x304048},{50,717,0x385058},{82,708,0x304048}},
    ['世界']={{426,246,0xffffff},{393,249,0x701428},{381,252,0xffffff},{426,269,0x681128},{474,255,0x701428},{355,245,0x701830}},
    ['移动道具']={{279,510,0x304c60},{287,510,0xfdfdfd},{330,508,0x305060},{224,505,0x305368},{150,516,0xd8ddf0},{145,512,0x38545d}},

    ['火焰山土地']={{750,230,0x7bb8f5},{700,237,0x80c0ff},{728,239,0x80c0ff},{777,241,0x7fbffe},{794,239,0x7fbffd},{750,265,0xecd733},{775,255,0xebd834},{792,255,0xebd834}},
    ['普陀山接引仙女']={{662,426,0x80c0ff},{616,432,0x80c0ff},{645,434,0x80c0ff},{692,435,0x80c0ff},{726,436,0x7dbdfa},{731,460,0xebd834},{609,447,0xe7d433},{657,453,0xebd834},{707,464,0xe9d734}},
    ['驿站传送东海湾']={{551,456,0x804b12},{551,483,0x80c0fe},{505,488,0x7ebdfb},{589,490,0x80c0ff},{523,516,0xebd935},{547,509,0xe7d433},{567,507,0xebd834},{598,516,0xebd834}},
    ['驿站传送大唐国境']={{599,424,0x80c0fe},{577,434,0x80c0ff},{679,429,0x7dbbf9},{577,450,0xead734},{602,452,0xebd835},{623,452,0xebd833},{642,454,0xebd834},{648,433,0x80c0ff}},
    ['花果山土地']={{531,403,0x80c0ff},{464,404,0x80c0fe},{493,406,0x80c0ff},{478,429,0xebd834},{503,430,0xebd834},{575,423,0xe4d333},{597,406,0x70aade}},
    ['驿站传送北俱芦洲']={{560,425,0x7dbbf6},{492,432,0x80c0ff},{592,425,0x7fbefc},{627,432,0x7dbbf7},{523,460,0xead734},{547,453,0xebd834},{567,451,0xebd834},{586,454,0xebd834}},
    ['选择角色']={{780,232,0xfefefe},{916,237,0xffffff},{773,269,0x406470},{997,326,0x305068},{769,430,0x305060},{889,368,0x385868},{761,653,0x12191a},{1014,660,0x0c1619},{1010,237,0x141b1a}},
    ['对话']={{1300,555,0xa0c0c8},{28,668,0x203440},{117,670,0x203440},{1301,683,0x182c38},{723,695,0x182c38}},
    ['小地图按钮'] = {
        --- {x输入框x,x输入框y,   y输入框x,y输入框y,     数字键1 x,数字键1y,   前往x,前往y    关闭x,关闭y }
        ['花果山']={373,114,514,113,644,117,338,238,1094,87},
        ['大唐境外']={249,235,387,232,519,231,214,355,1218,204},
        ['长寿郊外']={419,113,559,115,690,113,385,241,1049,87},
        ['女儿村']={367,249,366,321,329,372,370,383,1046,48},
        ['江南野外']={367,113,507,110,331,237,643,109,1098,82},
        ['建邺城']={288,86,437,85,261,212,567,90,1175,58},
        ['麒麟山']={370,115,498,117,335,241,642,120,1104,87},
        ['北俱芦洲']={370,112,515,109,337,237,641,111,1098,79},
        ['墨家村']={370,112,515,109,337,237,641,111,1098,79},
        ['狮驼岭']={367,111,507,107,331,234,638,109,1103,84},
        ['朱紫国']={379,79,527,85,346,206,656,84,1083,52},
        ['东海湾']={457,115,596,115,419,238,732,119,1013,84},
        ['傲来国']={414,82,556,87,380,209,681,83,1053,54},
        ['五庄观']={368,111,508,112,336,238,645,111,1092,82},
        ['大唐国境']={382,58,523,58,347,184,657,58,1085,30},
    }
    -- box = {padding =104,box1x = 845,box1y= 196}
}


return view