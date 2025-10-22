BaseChapter = {
  [50000101] = {
    id = 50000101,
    name = function()
      return T(80200000, 1)
    end,
    chapter_english = function()
      return T(80200001)
    end,
    name_detail = function()
      return T(80200101)
    end,
    name_english = function()
      return T(80200201)
    end,
    des = function()
      return T(80200301)
    end,
    icon = "HomePlot:PlotMain_1000",
    type = 1,
    stages = {
      50110101,
      50110102,
      50110103,
      50110104,
      50110105,
      50110106,
      50110107,
      50110108,
      50110109
    },
    pre = 0,
    next = 50000102,
    open_condition = "70020100:1",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:20000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110109,
    map_path = "PlotDungeon:ChapterMap_01",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1000",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000102] = {
    id = 50000102,
    name = function()
      return T(80200000, 2)
    end,
    chapter_english = function()
      return T(80200002)
    end,
    name_detail = function()
      return T(80200102)
    end,
    name_english = function()
      return T(80200202)
    end,
    des = function()
      return T(80200302)
    end,
    icon = "HomePlot:PlotMain_1001",
    type = 1,
    stages = {
      50110201,
      50110202,
      50110203,
      50110204,
      50110205,
      50110206,
      50110207,
      50110208,
      50110209,
      50110210
    },
    pre = 50000101,
    next = 50000103,
    open_condition = "70020100:1|70020200:50110109",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:20000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110210,
    map_path = "PlotDungeon:ChapterMap_02",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1001",
    next_show = 2,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000103] = {
    id = 50000103,
    name = function()
      return T(80200000, 3)
    end,
    chapter_english = function()
      return T(80200003)
    end,
    name_detail = function()
      return T(80200103)
    end,
    name_english = function()
      return T(80200203)
    end,
    des = function()
      return T(80200303)
    end,
    icon = "HomePlot:PlotMain_1002",
    type = 1,
    stages = {
      50110301,
      50110302,
      50110303,
      50110304,
      50110305,
      50110306,
      50110307,
      50110308,
      50110309,
      50110310
    },
    pre = 50000102,
    next = 50000104,
    open_condition = "70020100:7|70020200:50110210",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:20000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110310,
    map_path = "PlotDungeon:ChapterMap_03",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1002",
    next_show = 3,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000104] = {
    id = 50000104,
    name = function()
      return T(80200000, 4)
    end,
    chapter_english = function()
      return T(80200004)
    end,
    name_detail = function()
      return T(80200104)
    end,
    name_english = function()
      return T(80200204)
    end,
    des = function()
      return T(80200304)
    end,
    icon = "HomePlot:PlotMain_1003",
    type = 1,
    stages = {
      50110401,
      50110402,
      50110403,
      50110404,
      50110405,
      50110406,
      50110407,
      50110408,
      50110409,
      50110410,
      50110411,
      50110412,
      50110413,
      50110414,
      50110415,
      50110416,
      50110417,
      50110418
    },
    pre = 50000103,
    next = 50000105,
    open_condition = "70020100:12|70020200:50110310",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110418,
    map_path = "PlotDungeon:ChapterMap_04",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1003",
    next_show = 4,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000105] = {
    id = 50000105,
    name = function()
      return T(80200000, 5)
    end,
    chapter_english = function()
      return T(80200005)
    end,
    name_detail = function()
      return T(80200105)
    end,
    name_english = function()
      return T(80200205)
    end,
    des = function()
      return T(80200305)
    end,
    icon = "HomePlot:PlotMain_1004",
    type = 1,
    stages = {
      50110501,
      50110502,
      50110503,
      50110504,
      50110505,
      50110506,
      50110507,
      50110508,
      50110509,
      50110510,
      50110511,
      50110512
    },
    pre = 50000104,
    next = 50000106,
    open_condition = "70020100:17|70020200:50110418",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110512,
    map_path = "PlotDungeon:ChapterMap_05",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1004",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000106] = {
    id = 50000106,
    name = function()
      return T(80200000, 6)
    end,
    chapter_english = function()
      return T(80200006)
    end,
    name_detail = function()
      return T(80200106)
    end,
    name_english = function()
      return T(80200206)
    end,
    des = function()
      return T(80200306)
    end,
    icon = "HomePlot:PlotMain_1005",
    type = 1,
    stages = {
      50110601,
      50110602,
      50110603,
      50110604,
      50110605,
      50110606,
      50110607,
      50110608,
      50110609,
      50110610,
      50110611,
      50110612,
      50110613
    },
    pre = 50000105,
    next = 50000107,
    open_condition = "70020100:22|70020200:50110512",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110613,
    map_path = "PlotDungeon:ChapterMap_06",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1005",
    next_show = 2,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000107] = {
    id = 50000107,
    name = function()
      return T(80200000, 7)
    end,
    chapter_english = function()
      return T(80200007)
    end,
    name_detail = function()
      return T(80200107)
    end,
    name_english = function()
      return T(80200207)
    end,
    des = function()
      return T(80200307)
    end,
    icon = "HomePlot:PlotMain_1006",
    type = 1,
    stages = {
      50110701,
      50110702,
      50110703,
      50110704,
      50110705,
      50110706,
      50110707,
      50110708,
      50110709,
      50110710
    },
    pre = 50000106,
    next = 50000108,
    open_condition = "70020100:27|70020200:50110613",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110710,
    map_path = "PlotDungeon:ChapterMap_07",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1006",
    next_show = 3,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000108] = {
    id = 50000108,
    name = function()
      return T(80200000, 8)
    end,
    chapter_english = function()
      return T(80200008)
    end,
    name_detail = function()
      return T(80200108)
    end,
    name_english = function()
      return T(80200208)
    end,
    des = function()
      return T(80200308)
    end,
    icon = "HomePlot:PlotMain_1007",
    type = 1,
    stages = {
      50110801,
      50110802,
      50110803,
      50110804,
      50110805,
      50110806,
      50110807,
      50110808,
      50110809,
      50110810,
      50110811,
      50110812,
      50110813
    },
    pre = 50000107,
    next = 50000109,
    open_condition = "70020100:31|70020200:50110710",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110813,
    map_path = "PlotDungeon:ChapterMap_08",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1007",
    next_show = 4,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000109] = {
    id = 50000109,
    name = function()
      return T(80200000, 9)
    end,
    chapter_english = function()
      return T(80200009)
    end,
    name_detail = function()
      return T(80200109)
    end,
    name_english = function()
      return T(80200209)
    end,
    des = function()
      return T(80200309)
    end,
    icon = "HomePlot:PlotMain_1008",
    type = 1,
    stages = {
      50110901,
      50110902,
      50110903,
      50110904,
      50110905,
      50110906,
      50110907,
      50110908,
      50110909,
      50110910,
      50110911,
      50110912,
      50110913,
      50110914,
      50110915,
      50110916,
      50110917,
      50110918,
      50110919,
      50110920,
      50110921
    },
    pre = 50000108,
    next = 50000110,
    open_condition = "70020100:35|70020200:50110813",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50110921,
    map_path = "PlotDungeon:ChapterMap_09",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1008",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000110] = {
    id = 50000110,
    name = function()
      return T(80200000, 10)
    end,
    chapter_english = function()
      return T(80200010)
    end,
    name_detail = function()
      return T(80200110)
    end,
    name_english = function()
      return T(80200210)
    end,
    des = function()
      return T(80200310)
    end,
    icon = "HomePlot:PlotMain_1009",
    type = 1,
    stages = {
      50111001,
      50111002,
      50111003,
      50111004,
      50111005,
      50111006,
      50111007,
      50111008,
      50111009,
      50111010,
      50111011,
      50111012,
      50111013,
      50111014,
      50111015,
      50111016,
      50111017
    },
    pre = 50000109,
    next = 50000111,
    open_condition = "70020100:39|70020200:50110921",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111017,
    map_path = "PlotDungeon:ChapterMap_10",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1009",
    next_show = 2,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000111] = {
    id = 50000111,
    name = function()
      return T(80200000, 11)
    end,
    chapter_english = function()
      return T(80200011)
    end,
    name_detail = function()
      return T(80200111)
    end,
    name_english = function()
      return T(80200211)
    end,
    des = function()
      return T(80200311)
    end,
    icon = "HomePlot:PlotMain_1010",
    type = 1,
    stages = {
      50111101,
      50111102,
      50111103,
      50111104,
      50111105,
      50111106,
      50111107,
      50111108,
      50111109,
      50111110,
      50111111,
      50111112,
      50111113,
      50111114
    },
    pre = 50000110,
    next = 50000112,
    open_condition = "70020100:42|70020200:50111017",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111114,
    map_path = "PlotDungeon:ChapterMap_11",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1010",
    next_show = 3,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000112] = {
    id = 50000112,
    name = function()
      return T(80200000, 12)
    end,
    chapter_english = function()
      return T(80200012)
    end,
    name_detail = function()
      return T(80200112)
    end,
    name_english = function()
      return T(80200212)
    end,
    des = function()
      return T(80200312)
    end,
    icon = "HomePlot:PlotMain_1011",
    type = 1,
    stages = {
      50111201,
      50111202,
      50111203,
      50111204,
      50111205,
      50111206,
      50111207,
      50111208,
      50111209,
      50111210
    },
    pre = 50000111,
    next = 50000113,
    open_condition = "70020100:45|70020200:50111114",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111210,
    map_path = "PlotDungeon:ChapterMap_12",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1011",
    next_show = 4,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000113] = {
    id = 50000113,
    name = function()
      return T(80200000, 13)
    end,
    chapter_english = function()
      return T(80200013)
    end,
    name_detail = function()
      return T(80200113)
    end,
    name_english = function()
      return T(80200213)
    end,
    des = function()
      return T(80200313)
    end,
    icon = "HomePlot:PlotMain_1012",
    type = 1,
    stages = {
      50111301,
      50111302,
      50111303,
      50111304,
      50111305,
      50111306,
      50111307,
      50111308,
      50111309,
      50111310
    },
    pre = 50000112,
    next = 50000114,
    open_condition = "70020100:45|70020200:50111210",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111310,
    map_path = "PlotDungeon:ChapterMap_13",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1012",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000114] = {
    id = 50000114,
    name = function()
      return T(80200000, 14)
    end,
    chapter_english = function()
      return T(80200014)
    end,
    name_detail = function()
      return T(80200114)
    end,
    name_english = function()
      return T(80200214)
    end,
    des = function()
      return T(80200314)
    end,
    icon = "HomePlot:PlotMain_1013",
    type = 1,
    stages = {
      50111401,
      50111402,
      50111403,
      50111404,
      50111405,
      50111406,
      50111407,
      50111408,
      50111409,
      50111410
    },
    pre = 50000113,
    next = 50000115,
    open_condition = "70020100:45|70020200:50111310",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111410,
    map_path = "PlotDungeon:ChapterMap_14",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1013",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000115] = {
    id = 50000115,
    name = function()
      return T(80200000, 15)
    end,
    chapter_english = function()
      return T(80200015)
    end,
    name_detail = function()
      return T(80200115)
    end,
    name_english = function()
      return T(80200215)
    end,
    des = function()
      return T(80200315)
    end,
    icon = "HomePlot:PlotMain_1014",
    type = 1,
    stages = {
      50111501,
      50111502,
      50111503,
      50111504,
      50111505,
      50111506,
      50111507,
      50111508,
      50111509,
      50111510
    },
    pre = 50000114,
    next = 50000116,
    open_condition = "70020100:45|70020200:50111410",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111510,
    map_path = "PlotDungeon:ChapterMap_15",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1014",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000116] = {
    id = 50000116,
    name = function()
      return T(80200000, 16)
    end,
    chapter_english = function()
      return T(80200016)
    end,
    name_detail = function()
      return T(80200116)
    end,
    name_english = function()
      return T(80200216)
    end,
    des = function()
      return T(80200316)
    end,
    icon = "HomePlot:PlotMain_1015",
    type = 1,
    stages = {
      50111601,
      50111602,
      50111603,
      50111604,
      50111605,
      50111606,
      50111607,
      50111608,
      50111609,
      50111610
    },
    pre = 50000115,
    next = 50000117,
    open_condition = "70020100:45|70020200:50111510",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111610,
    map_path = "PlotDungeon:ChapterMap_16",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1015",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000117] = {
    id = 50000117,
    name = function()
      return T(80200000, 17)
    end,
    chapter_english = function()
      return T(80200017)
    end,
    name_detail = function()
      return T(80200117)
    end,
    name_english = function()
      return T(80200217)
    end,
    des = function()
      return T(80200317)
    end,
    icon = "HomePlot:PlotMain_1016",
    type = 1,
    stages = {
      50111701,
      50111702,
      50111703,
      50111704,
      50111705,
      50111706,
      50111707,
      50111708,
      50111709,
      50111710
    },
    pre = 50000116,
    next = 50000118,
    open_condition = "70020100:45|70020200:50111610",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111710,
    map_path = "PlotDungeon:ChapterMap_17",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1016",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000118] = {
    id = 50000118,
    name = function()
      return T(80200000, 18)
    end,
    chapter_english = function()
      return T(80200018)
    end,
    name_detail = function()
      return T(80200118)
    end,
    name_english = function()
      return T(80200218)
    end,
    des = function()
      return T(80200318)
    end,
    icon = "HomePlot:PlotMain_1017",
    type = 1,
    stages = {
      50111801,
      50111802,
      50111803,
      50111804,
      50111805,
      50111806,
      50111807,
      50111808,
      50111809,
      50111810
    },
    pre = 50000117,
    next = 50000119,
    open_condition = "70020100:45|70020200:50111710",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111810,
    map_path = "PlotDungeon:ChapterMap_18",
    open_show = 1,
    back_ground = "PlotDungeonPic:PlotBuild_1017",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000119] = {
    id = 50000119,
    name = function()
      return T(80200000, 19)
    end,
    chapter_english = function()
      return T(80200019)
    end,
    name_detail = function()
      return T(80200119)
    end,
    name_english = function()
      return T(80200219)
    end,
    des = function()
      return T(80200319)
    end,
    icon = "HomePlot:PlotMain_1018",
    type = 1,
    stages = {
      50111901,
      50111902,
      50111903,
      50111904,
      50111905,
      50111906,
      50111907,
      50111908,
      50111909,
      50111910
    },
    pre = 50000118,
    next = 0,
    open_condition = "70020100:45|70020200:50111810",
    chapter_reward = {
      "1:21000001:500",
      "1:21000003:10000",
      "1:21010001:10000"
    },
    chapter_reward_stage = 50111910,
    map_path = "PlotDungeon:ChapterMap_19",
    back_ground = "PlotDungeonPic:PlotBuild_1018",
    next_show = 1,
    biography_id = 70610001,
    chapter_reward_icon = "PlotDungeon:PlotChapter_1"
  },
  [50000201] = {
    id = 50000201,
    name = function()
      return T(80251001)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120101,
      50120102,
      50120103,
      50120104,
      50120105
    },
    pre = 0,
    next = 50000202,
    open_condition = "70020100:7",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250001)
    end
  },
  [50000202] = {
    id = 50000202,
    name = function()
      return T(80251002)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120201,
      50120202,
      50120203,
      50120204,
      50120205
    },
    pre = 50000201,
    next = 50000203,
    open_condition = "70020100:8|70020200:50120105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250002)
    end
  },
  [50000203] = {
    id = 50000203,
    name = function()
      return T(80251003)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120301,
      50120302,
      50120303,
      50120304,
      50120305
    },
    pre = 50000202,
    next = 50000204,
    open_condition = "70020100:10|70020200:50120205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250003)
    end
  },
  [50000204] = {
    id = 50000204,
    name = function()
      return T(80251004)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120401,
      50120402,
      50120403,
      50120404,
      50120405
    },
    pre = 50000203,
    next = 50000205,
    open_condition = "70020100:12|70020200:50120305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250004)
    end
  },
  [50000205] = {
    id = 50000205,
    name = function()
      return T(80251005)
    end,
    icon = "Tower:LayersDot_001",
    type = 2,
    stages = {
      50120501,
      50120502,
      50120503,
      50120504,
      50120505
    },
    pre = 50000204,
    next = 50000206,
    open_condition = "70020100:14|70020200:50120405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_001.prefab",
    rate_name = function()
      return T(80250005)
    end
  },
  [50000206] = {
    id = 50000206,
    name = function()
      return T(80251006)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120601,
      50120602,
      50120603,
      50120604,
      50120605
    },
    pre = 50000205,
    next = 50000207,
    open_condition = "70020100:16|70020200:50120505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250006)
    end
  },
  [50000207] = {
    id = 50000207,
    name = function()
      return T(80251007)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120701,
      50120702,
      50120703,
      50120704,
      50120705
    },
    pre = 50000206,
    next = 50000208,
    open_condition = "70020100:18|70020200:50120605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250007)
    end
  },
  [50000208] = {
    id = 50000208,
    name = function()
      return T(80251008)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120801,
      50120802,
      50120803,
      50120804,
      50120805
    },
    pre = 50000207,
    next = 50000209,
    open_condition = "70020100:20|70020200:50120705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250008)
    end
  },
  [50000209] = {
    id = 50000209,
    name = function()
      return T(80251009)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50120901,
      50120902,
      50120903,
      50120904,
      50120905
    },
    pre = 50000208,
    next = 50000210,
    open_condition = "70020100:22|70020200:50120805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50120905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250009)
    end
  },
  [50000210] = {
    id = 50000210,
    name = function()
      return T(80251010)
    end,
    icon = "Tower:LayersDot_002",
    type = 2,
    stages = {
      50121001,
      50121002,
      50121003,
      50121004,
      50121005
    },
    pre = 50000209,
    next = 50000211,
    open_condition = "70020100:24|70020200:50120905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_003.prefab",
    rate_name = function()
      return T(80250010)
    end
  },
  [50000211] = {
    id = 50000211,
    name = function()
      return T(80251011)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121101,
      50121102,
      50121103,
      50121104,
      50121105
    },
    pre = 50000210,
    next = 50000212,
    open_condition = "70020100:26|70020200:50121005",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250011)
    end
  },
  [50000212] = {
    id = 50000212,
    name = function()
      return T(80251012)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121201,
      50121202,
      50121203,
      50121204,
      50121205
    },
    pre = 50000211,
    next = 50000213,
    open_condition = "70020100:28|70020200:50121105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250012)
    end
  },
  [50000213] = {
    id = 50000213,
    name = function()
      return T(80251013)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121301,
      50121302,
      50121303,
      50121304,
      50121305
    },
    pre = 50000212,
    next = 50000214,
    open_condition = "70020100:30|70020200:50121205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250013)
    end
  },
  [50000214] = {
    id = 50000214,
    name = function()
      return T(80251014)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121401,
      50121402,
      50121403,
      50121404,
      50121405
    },
    pre = 50000213,
    next = 50000215,
    open_condition = "70020100:32|70020200:50121305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250014)
    end
  },
  [50000215] = {
    id = 50000215,
    name = function()
      return T(80251015)
    end,
    icon = "Tower:LayersDot_003",
    type = 2,
    stages = {
      50121501,
      50121502,
      50121503,
      50121504,
      50121505
    },
    pre = 50000214,
    next = 50000216,
    open_condition = "70020100:34|70020200:50121405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_008.prefab",
    rate_name = function()
      return T(80250015)
    end
  },
  [50000216] = {
    id = 50000216,
    name = function()
      return T(80251016)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121601,
      50121602,
      50121603,
      50121604,
      50121605
    },
    pre = 50000215,
    next = 50000217,
    open_condition = "70020100:36|70020200:50121505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250016)
    end
  },
  [50000217] = {
    id = 50000217,
    name = function()
      return T(80251017)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121701,
      50121702,
      50121703,
      50121704,
      50121705
    },
    pre = 50000216,
    next = 50000218,
    open_condition = "70020100:37|70020200:50121605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250017)
    end
  },
  [50000218] = {
    id = 50000218,
    name = function()
      return T(80251018)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121801,
      50121802,
      50121803,
      50121804,
      50121805
    },
    pre = 50000217,
    next = 50000219,
    open_condition = "70020100:38|70020200:50121705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250018)
    end
  },
  [50000219] = {
    id = 50000219,
    name = function()
      return T(80251019)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50121901,
      50121902,
      50121903,
      50121904,
      50121905
    },
    pre = 50000218,
    next = 50000220,
    open_condition = "70020100:39|70020200:50121805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50121905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250019)
    end
  },
  [50000220] = {
    id = 50000220,
    name = function()
      return T(80251020)
    end,
    icon = "Tower:LayersDot_004",
    type = 2,
    stages = {
      50122001,
      50122002,
      50122003,
      50122004,
      50122005
    },
    pre = 50000219,
    next = 50000221,
    open_condition = "70020100:40|70020200:50121905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_006.prefab",
    rate_name = function()
      return T(80250020)
    end
  },
  [50000221] = {
    id = 50000221,
    name = function()
      return T(80251021)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122101,
      50122102,
      50122103,
      50122104,
      50122105
    },
    pre = 50000220,
    next = 50000222,
    open_condition = "70020100:41|70020200:50122005",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250021)
    end
  },
  [50000222] = {
    id = 50000222,
    name = function()
      return T(80251022)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122201,
      50122202,
      50122203,
      50122204,
      50122205
    },
    pre = 50000221,
    next = 50000223,
    open_condition = "70020100:42|70020200:50122105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250022)
    end
  },
  [50000223] = {
    id = 50000223,
    name = function()
      return T(80251023)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122301,
      50122302,
      50122303,
      50122304,
      50122305
    },
    pre = 50000222,
    next = 50000224,
    open_condition = "70020100:43|70020200:50122205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250023)
    end
  },
  [50000224] = {
    id = 50000224,
    name = function()
      return T(80251024)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122401,
      50122402,
      50122403,
      50122404,
      50122405
    },
    pre = 50000223,
    next = 50000225,
    open_condition = "70020100:44|70020200:50122305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250024)
    end
  },
  [50000225] = {
    id = 50000225,
    name = function()
      return T(80251025)
    end,
    icon = "Tower:LayersDot_005",
    type = 2,
    stages = {
      50122501,
      50122502,
      50122503,
      50122504,
      50122505
    },
    pre = 50000224,
    next = 50000226,
    open_condition = "70020100:45|70020200:50122405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_002.prefab",
    rate_name = function()
      return T(80250025)
    end
  },
  [50000226] = {
    id = 50000226,
    name = function()
      return T(80251026)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122601,
      50122602,
      50122603,
      50122604,
      50122605
    },
    pre = 50000225,
    next = 50000227,
    open_condition = "70020100:46|70020200:50122505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250026)
    end
  },
  [50000227] = {
    id = 50000227,
    name = function()
      return T(80251027)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122701,
      50122702,
      50122703,
      50122704,
      50122705
    },
    pre = 50000226,
    next = 50000228,
    open_condition = "70020100:47|70020200:50122605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250027)
    end
  },
  [50000228] = {
    id = 50000228,
    name = function()
      return T(80251028)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122801,
      50122802,
      50122803,
      50122804,
      50122805
    },
    pre = 50000227,
    next = 50000229,
    open_condition = "70020100:48|70020200:50122705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250028)
    end
  },
  [50000229] = {
    id = 50000229,
    name = function()
      return T(80251029)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50122901,
      50122902,
      50122903,
      50122904,
      50122905
    },
    pre = 50000228,
    next = 50000230,
    open_condition = "70020100:49|70020200:50122805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50122905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250029)
    end
  },
  [50000230] = {
    id = 50000230,
    name = function()
      return T(80251030)
    end,
    icon = "Tower:LayersDot_006",
    type = 2,
    stages = {
      50123001,
      50123002,
      50123003,
      50123004,
      50123005
    },
    pre = 50000229,
    next = 50000231,
    open_condition = "70020100:50|70020200:50122905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_004.prefab",
    rate_name = function()
      return T(80250030)
    end
  },
  [50000231] = {
    id = 50000231,
    name = function()
      return T(80251031)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123101,
      50123102,
      50123103,
      50123104,
      50123105
    },
    pre = 50000230,
    next = 50000232,
    open_condition = "70020100:51|70020200:50123005",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123105,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250031)
    end
  },
  [50000232] = {
    id = 50000232,
    name = function()
      return T(80251032)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123201,
      50123202,
      50123203,
      50123204,
      50123205
    },
    pre = 50000231,
    next = 50000233,
    open_condition = "70020100:52|70020200:50123105",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123205,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250032)
    end
  },
  [50000233] = {
    id = 50000233,
    name = function()
      return T(80251033)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123301,
      50123302,
      50123303,
      50123304,
      50123305
    },
    pre = 50000232,
    next = 50000234,
    open_condition = "70020100:53|70020200:50123205",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123305,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250033)
    end
  },
  [50000234] = {
    id = 50000234,
    name = function()
      return T(80251034)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123401,
      50123402,
      50123403,
      50123404,
      50123405
    },
    pre = 50000233,
    next = 50000235,
    open_condition = "70020100:54|70020200:50123305",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123405,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250034)
    end
  },
  [50000235] = {
    id = 50000235,
    name = function()
      return T(80251035)
    end,
    icon = "Tower:LayersDot_007",
    type = 2,
    stages = {
      50123501,
      50123502,
      50123503,
      50123504,
      50123505
    },
    pre = 50000234,
    next = 50000236,
    open_condition = "70020100:55|70020200:50123405",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123505,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_009.prefab",
    rate_name = function()
      return T(80250035)
    end
  },
  [50000236] = {
    id = 50000236,
    name = function()
      return T(80251036)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123601,
      50123602,
      50123603,
      50123604,
      50123605
    },
    pre = 50000235,
    next = 50000237,
    open_condition = "70020100:56|70020200:50123505",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123605,
    map_path = "Tower:Map_001_1",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250036)
    end
  },
  [50000237] = {
    id = 50000237,
    name = function()
      return T(80251037)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123701,
      50123702,
      50123703,
      50123704,
      50123705
    },
    pre = 50000236,
    next = 50000238,
    open_condition = "70020100:57|70020200:50123605",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123705,
    map_path = "Tower:Map_001_2",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250037)
    end
  },
  [50000238] = {
    id = 50000238,
    name = function()
      return T(80251038)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123801,
      50123802,
      50123803,
      50123804,
      50123805
    },
    pre = 50000237,
    next = 50000239,
    open_condition = "70020100:58|70020200:50123705",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123805,
    map_path = "Tower:Map_001_3",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250038)
    end
  },
  [50000239] = {
    id = 50000239,
    name = function()
      return T(80251039)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50123901,
      50123902,
      50123903,
      50123904,
      50123905
    },
    pre = 50000238,
    next = 50000240,
    open_condition = "70020100:59|70020200:50123805",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50123905,
    map_path = "Tower:Map_001_4",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250039)
    end
  },
  [50000240] = {
    id = 50000240,
    name = function()
      return T(80251040)
    end,
    icon = "Tower:LayersDot_008",
    type = 2,
    stages = {
      50124001,
      50124002,
      50124003,
      50124004,
      50124005
    },
    pre = 50000239,
    next = 0,
    open_condition = "70020100:60|70020200:50123905",
    chapter_reward = {
      "1:21000001:600",
      "1:21000003:10000",
      "1:21010001:5000"
    },
    chapter_reward_stage = 50124005,
    map_path = "Tower:Map_001_5",
    back_ground = "FX_ui_pata_007.prefab",
    rate_name = function()
      return T(80250040)
    end
  },
  [50000301] = {
    id = 50000301,
    name = function()
      return T(80202100)
    end,
    type = 11,
    stages = {
      50130101,
      50130102,
      50130103,
      50130104,
      50130105
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map1",
    back_ground = "UIBackGround:Daily_1003",
    back_effect = "FX_ui_dailyadventure_jinbi.prefab"
  },
  [50000401] = {
    id = 50000401,
    name = function()
      return T(80202200)
    end,
    type = 12,
    stages = {
      50130201,
      50130202,
      50130203,
      50130204
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map2",
    back_ground = "UIBackGround:Daily_1002",
    back_effect = "FX_ui_dailyadventure_jinyan.prefab"
  },
  [50000501] = {
    id = 50000501,
    name = function()
      return T(80202300)
    end,
    type = 13,
    stages = {
      50130301,
      50130302,
      50130303,
      50130304
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:9",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map3",
    back_ground = "UIBackGround:Daily_1001",
    back_effect = "FX_ui_dailyadventure_jineng.prefab"
  },
  [50000601] = {
    id = 50000601,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 0,
    stages = {
      50130401,
      50130402,
      50130403,
      50130404,
      50130405
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_1",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_fangyu2.prefab"
  },
  [50000602] = {
    id = 50000602,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 1,
    stages = {
      50130411,
      50130412,
      50130413,
      50130414,
      50130415
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_2",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_jinzhan2.prefab"
  },
  [50000604] = {
    id = 50000604,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 2,
    stages = {
      50130431,
      50130432,
      50130433,
      50130434,
      50130435
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_4",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_gongjian2.prefab"
  },
  [50000605] = {
    id = 50000605,
    name = function()
      return T(80202400)
    end,
    type = 14,
    show_type = 3,
    stages = {
      50130441,
      50130442,
      50130443,
      50130444,
      50130445
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map4_5",
    back_ground = "UIBackGround:Daily_1005",
    back_effect = "FX_ui_dailyadventure_fashi2.prefab"
  },
  [50000701] = {
    id = 50000701,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 0,
    stages = {
      50130501,
      50130502,
      50130503,
      50130504,
      50130505,
      50130506
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_1",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_fangyu.prefab"
  },
  [50000702] = {
    id = 50000702,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 1,
    stages = {
      50130511,
      50130512,
      50130513,
      50130514,
      50130515,
      50130516
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_2",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_jinzhan.prefab"
  },
  [50000704] = {
    id = 50000704,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 2,
    stages = {
      50130531,
      50130532,
      50130533,
      50130534,
      50130535,
      50130536
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_4",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_gongjian.prefab"
  },
  [50000705] = {
    id = 50000705,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 3,
    stages = {
      50130541,
      50130542,
      50130543,
      50130544,
      50130545,
      50130546
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_5",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_fashi.prefab"
  },
  [50000706] = {
    id = 50000706,
    name = function()
      return T(80202500)
    end,
    type = 15,
    show_type = 4,
    stages = {
      50130551,
      50130552,
      50130553,
      50130554
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:5",
    open_time = "2:1|2|3|4|5|6|0",
    map_path = "DailyDungeon:Map5_6",
    back_ground = "UIBackGround:Daily_1004",
    back_effect = "FX_ui_dailyadventure_tupo.prefab"
  },
  [50000801] = {
    id = 50000801,
    type = 51,
    show_type = 0,
    stages = {50160011, 50160012},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000802] = {
    id = 50000802,
    type = 52,
    show_type = 1,
    stages = {50160021, 50160022},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000803] = {
    id = 50000803,
    type = 53,
    show_type = 2,
    stages = {50160031, 50160032},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000804] = {
    id = 50000804,
    type = 54,
    show_type = 3,
    stages = {50160041, 50160042},
    pre = 0,
    next = 0,
    open_condition = "70020100:1"
  },
  [50000901] = {
    id = 50000901,
    name = function()
      return T(80204001)
    end,
    icon = "AbyssActivityPic:ActivityBossWater_1",
    type = 41,
    stages = {
      50140011,
      50140012,
      50140013,
      50140014,
      50140015
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWater_1000"
  },
  [50000902] = {
    id = 50000902,
    name = function()
      return T(80204004)
    end,
    icon = "AbyssActivityPic:ActivityBossWater_2",
    type = 41,
    stages = {
      50140021,
      50140022,
      50140023,
      50140024,
      50140025
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWater_1001"
  },
  [50000911] = {
    id = 50000911,
    name = function()
      return T(80204002)
    end,
    icon = "AbyssActivityPic:ActivityBossFire_1",
    type = 42,
    stages = {
      50140111,
      50140112,
      50140113,
      50140114,
      50140115
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonFire_1000"
  },
  [50000912] = {
    id = 50000912,
    name = function()
      return T(80204005)
    end,
    icon = "AbyssActivityPic:ActivityBossFire_2",
    type = 42,
    stages = {
      50140121,
      50140122,
      50140123,
      50140124,
      50140125
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonFire_1001"
  },
  [50000921] = {
    id = 50000921,
    name = function()
      return T(80204003)
    end,
    icon = "AbyssActivityPic:ActivityBossWood_1",
    type = 43,
    stages = {
      50140211,
      50140212,
      50140213,
      50140214,
      50140215
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWood_1000"
  },
  [50000922] = {
    id = 50000922,
    name = function()
      return T(80204006)
    end,
    icon = "AbyssActivityPic:ActivityBossWood_2",
    type = 43,
    stages = {
      50140221,
      50140222,
      50140223,
      50140224,
      50140225
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:BossDungeonWood_1001"
  },
  [50001001] = {
    id = 50001001,
    name = function()
      return T(80205001)
    end,
    icon = "AbyssActivityPic:ActivityTide_1",
    type = 61,
    stages = {
      50180001,
      50180002,
      50180003
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    open_time = "2:1|2|3|4|5|6|0",
    back_ground = "UIBackGround:Tide_1000",
    reward_back_ground = "UIBackGround:Tide_2000"
  },
  [50001002] = {
    id = 50001002,
    name = function()
      return T(80205002)
    end,
    icon = "AbyssActivityPic:ActivityTide_2",
    type = 62,
    stages = {
      50180011,
      50180012,
      50180013
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    open_time = "2:3|4|5|6|0",
    back_ground = "UIBackGround:Tide_1001",
    reward_back_ground = "UIBackGround:Tide_2001"
  },
  [50001003] = {
    id = 50001003,
    name = function()
      return T(80205003)
    end,
    icon = "AbyssActivityPic:ActivityTide_3",
    type = 63,
    stages = {
      50180021,
      50180022,
      50180023
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    open_time = "2:5|6|0",
    back_ground = "UIBackGround:Tide_1002",
    reward_back_ground = "UIBackGround:Tide_2002"
  },
  [50001101] = {
    id = 50001101,
    name = function()
      return T(50001101)
    end,
    des = function()
      return T(50001401)
    end,
    icon = "ExploreDungeon:Tab_01",
    type = 71,
    stages = {
      50150011,
      50150012,
      50150013
    },
    pre = 0,
    next = 50001102,
    open_condition = "70020400:1",
    map_path = "ExploreDungeon:LevelUpMap01"
  },
  [50001102] = {
    id = 50001102,
    name = function()
      return T(50001102)
    end,
    des = function()
      return T(50001402)
    end,
    icon = "ExploreDungeon:Tab_02",
    type = 71,
    stages = {
      50150021,
      50150022,
      50150023
    },
    pre = 50001101,
    next = 50001103,
    open_condition = "70020400:4",
    map_path = "ExploreDungeon:LevelUpMap02"
  },
  [50001103] = {
    id = 50001103,
    name = function()
      return T(50001103)
    end,
    des = function()
      return T(50001403)
    end,
    icon = "ExploreDungeon:Tab_03",
    type = 71,
    stages = {
      50150031,
      50150032,
      50150033
    },
    pre = 50001102,
    next = 50001104,
    open_condition = "70020400:7",
    map_path = "ExploreDungeon:LevelUpMap03"
  },
  [50001104] = {
    id = 50001104,
    name = function()
      return T(50001104)
    end,
    des = function()
      return T(50001404)
    end,
    icon = "ExploreDungeon:Tab_04",
    type = 71,
    stages = {
      50150041,
      50150042,
      50150043
    },
    pre = 50001103,
    next = 50001105,
    open_condition = "70020400:10",
    map_path = "ExploreDungeon:LevelUpMap04"
  },
  [50001105] = {
    id = 50001105,
    name = function()
      return T(50001105)
    end,
    des = function()
      return T(50001405)
    end,
    icon = "ExploreDungeon:Tab_05",
    type = 71,
    stages = {
      50150051,
      50150052,
      50150053
    },
    pre = 50001104,
    next = 50001106,
    open_condition = "70020400:13",
    map_path = "ExploreDungeon:LevelUpMap05"
  },
  [50001106] = {
    id = 50001106,
    name = function()
      return T(50001106)
    end,
    des = function()
      return T(50001406)
    end,
    icon = "ExploreDungeon:Tab_06",
    type = 71,
    stages = {
      50150061,
      50150062,
      50150063
    },
    pre = 50001105,
    next = 50001107,
    open_condition = "70020400:16",
    map_path = "ExploreDungeon:LevelUpMap06"
  },
  [50001107] = {
    id = 50001107,
    name = function()
      return T(50001107)
    end,
    des = function()
      return T(50001407)
    end,
    icon = "ExploreDungeon:Tab_07",
    type = 71,
    stages = {
      50150071,
      50150072,
      50150073
    },
    pre = 50001106,
    next = 50001108,
    open_condition = "70020400:19",
    map_path = "ExploreDungeon:LevelUpMap07"
  },
  [50001108] = {
    id = 50001108,
    name = function()
      return T(50001108)
    end,
    des = function()
      return T(50001408)
    end,
    icon = "ExploreDungeon:Tab_08",
    type = 71,
    stages = {
      50150081,
      50150082,
      50150083
    },
    pre = 50001107,
    next = 50001109,
    open_condition = "70020400:22",
    map_path = "ExploreDungeon:LevelUpMap08"
  },
  [50001109] = {
    id = 50001109,
    name = function()
      return T(50001109)
    end,
    des = function()
      return T(50001409)
    end,
    icon = "ExploreDungeon:Tab_09",
    type = 71,
    stages = {
      50150091,
      50150092,
      50150093
    },
    pre = 50001108,
    next = 0,
    open_condition = "70020400:25",
    map_path = "ExploreDungeon:LevelUpMap09"
  },
  [50001201] = {
    id = 50001201,
    type = 72,
    stages = {
      50151001,
      50151002,
      50151003,
      50151004
    },
    pre = 0,
    next = 0,
    open_condition = "70020400:1"
  },
  [50003001] = {
    id = 50003001,
    type = 7,
    show_type = 2,
    stages = {
      50170021,
      50170022,
      50170023,
      50170024,
      50170025,
      50170026,
      50170027,
      50170028,
      50170029
    },
    pre = 0,
    next = 50003002,
    open_condition = "70020100:1"
  },
  [50003002] = {
    id = 50003002,
    type = 7,
    show_type = 1,
    stages = {
      50170011,
      50170012,
      50170013,
      50170014,
      50170015,
      50170016,
      50170017,
      50170018,
      50170019
    },
    pre = 50003001,
    next = 50003003,
    open_condition = "70020100:1"
  },
  [50003003] = {
    id = 50003003,
    type = 7,
    show_type = 2,
    stages = {
      50170031,
      50170032,
      50170033,
      50170034,
      50170035,
      50170036,
      50170037,
      50170038,
      50170039
    },
    pre = 50003002,
    next = 50003004,
    open_condition = "70020100:1"
  },
  [50003004] = {
    id = 50003004,
    type = 7,
    show_type = 1,
    stages = {
      50170041,
      50170042,
      50170043,
      50170044,
      50170045,
      50170046,
      50170047,
      50170048,
      50170049
    },
    pre = 50003003,
    next = 50003005,
    open_condition = "70020100:1"
  },
  [50003005] = {
    id = 50003005,
    type = 7,
    show_type = 3,
    stages = {
      50170051,
      50170052,
      50170053,
      50170054,
      50170055,
      50170056,
      50170057,
      50170058,
      50170059
    },
    pre = 50003004,
    next = 50003006,
    open_condition = "70020100:1"
  },
  [50003006] = {
    id = 50003006,
    type = 7,
    show_type = 2,
    stages = {
      50170061,
      50170062,
      50170063,
      50170064,
      50170065,
      50170066,
      50170067,
      50170068,
      50170069
    },
    pre = 50003005,
    next = 50003007,
    open_condition = "70020100:1"
  },
  [50003007] = {
    id = 50003007,
    type = 7,
    show_type = 1,
    stages = {
      50170071,
      50170072,
      50170073,
      50170074,
      50170075,
      50170076,
      50170077,
      50170078,
      50170079
    },
    pre = 50003006,
    next = 50003008,
    open_condition = "70020100:1"
  },
  [50003008] = {
    id = 50003008,
    type = 7,
    show_type = 4,
    stages = {
      50170081,
      50170082,
      50170083,
      50170084,
      50170085,
      50170086,
      50170087,
      50170088,
      50170089
    },
    pre = 50003007,
    next = 50003009,
    open_condition = "70020100:1"
  },
  [50003009] = {
    id = 50003009,
    type = 7,
    show_type = 3,
    stages = {
      50170091,
      50170092,
      50170093,
      50170094,
      50170095,
      50170096,
      50170097,
      50170098,
      50170099
    },
    pre = 50003008,
    next = 50003010,
    open_condition = "70020100:1"
  },
  [50003010] = {
    id = 50003010,
    type = 7,
    show_type = 2,
    stages = {
      50170101,
      50170102,
      50170103,
      50170104,
      50170105,
      50170106,
      50170107,
      50170108,
      50170109
    },
    pre = 50003009,
    next = 50003011,
    open_condition = "70020100:1"
  },
  [50003011] = {
    id = 50003011,
    type = 7,
    show_type = 1,
    stages = {
      50170111,
      50170112,
      50170113,
      50170114,
      50170115,
      50170116,
      50170117,
      50170118,
      50170119
    },
    pre = 50003010,
    next = 50003012,
    open_condition = "70020100:1"
  },
  [50003012] = {
    id = 50003012,
    type = 7,
    show_type = 4,
    stages = {
      50170121,
      50170122,
      50170123,
      50170124,
      50170125,
      50170126,
      50170127,
      50170128,
      50170129
    },
    pre = 50003011,
    next = 50003013,
    open_condition = "70020100:1"
  },
  [50003013] = {
    id = 50003013,
    type = 7,
    show_type = 3,
    stages = {
      50170131,
      50170132,
      50170133,
      50170134,
      50170135,
      50170136,
      50170137,
      50170138,
      50170139
    },
    pre = 50003012,
    next = 50003014,
    open_condition = "70020100:1"
  },
  [50003014] = {
    id = 50003014,
    type = 7,
    show_type = 2,
    stages = {
      50170141,
      50170142,
      50170143,
      50170144,
      50170145,
      50170146,
      50170147,
      50170148,
      50170149
    },
    pre = 50003013,
    next = 50003015,
    open_condition = "70020100:1"
  },
  [50003015] = {
    id = 50003015,
    type = 7,
    show_type = 1,
    stages = {
      50170151,
      50170152,
      50170153,
      50170154,
      50170155,
      50170156,
      50170157,
      50170158,
      50170159
    },
    pre = 50003014,
    next = 50003016,
    open_condition = "70020100:1"
  },
  [50003016] = {
    id = 50003016,
    type = 7,
    show_type = 4,
    stages = {
      50170161,
      50170162,
      50170163,
      50170164,
      50170165,
      50170166,
      50170167,
      50170168,
      50170169
    },
    pre = 50003015,
    next = 50003017,
    open_condition = "70020100:1"
  },
  [50003017] = {
    id = 50003017,
    type = 7,
    show_type = 3,
    stages = {
      50170171,
      50170172,
      50170173,
      50170174,
      50170175,
      50170176,
      50170177,
      50170178,
      50170179
    },
    pre = 50003016,
    next = 50003018,
    open_condition = "70020100:1"
  },
  [50003018] = {
    id = 50003018,
    type = 7,
    show_type = 2,
    stages = {
      50170181,
      50170182,
      50170183,
      50170184,
      50170185,
      50170186,
      50170187,
      50170188,
      50170189
    },
    pre = 50003017,
    next = 50003019,
    open_condition = "70020100:1"
  },
  [50003019] = {
    id = 50003019,
    type = 7,
    show_type = 1,
    stages = {
      50170191,
      50170192,
      50170193,
      50170194,
      50170195,
      50170196,
      50170197,
      50170198,
      50170199
    },
    pre = 50003018,
    next = 50003020,
    open_condition = "70020100:1"
  },
  [50003020] = {
    id = 50003020,
    type = 7,
    show_type = 4,
    stages = {
      50170201,
      50170202,
      50170203,
      50170204,
      50170205,
      50170206,
      50170207,
      50170208,
      50170209
    },
    pre = 50003019,
    next = 50003021,
    open_condition = "70020100:1"
  },
  [50003021] = {
    id = 50003021,
    type = 7,
    show_type = 3,
    stages = {
      50170211,
      50170212,
      50170213,
      50170214,
      50170215,
      50170216,
      50170217,
      50170218,
      50170219
    },
    pre = 50003020,
    next = 50003022,
    open_condition = "70020100:1"
  },
  [50003022] = {
    id = 50003022,
    type = 7,
    show_type = 2,
    stages = {
      50170221,
      50170222,
      50170223,
      50170224,
      50170225,
      50170226,
      50170227,
      50170228,
      50170229
    },
    pre = 50003021,
    next = 50003023,
    open_condition = "70020100:1"
  },
  [50003023] = {
    id = 50003023,
    type = 7,
    show_type = 5,
    stages = {
      50170231,
      50170232,
      50170233,
      50170234,
      50170235,
      50170236,
      50170237,
      50170238,
      50170239
    },
    pre = 50003022,
    next = 50003024,
    open_condition = "70020100:1"
  },
  [50003024] = {
    id = 50003024,
    type = 7,
    show_type = 1,
    stages = {
      50170241,
      50170242,
      50170243,
      50170244,
      50170245,
      50170246,
      50170247,
      50170248,
      50170249
    },
    pre = 50003023,
    next = 50003025,
    open_condition = "70020100:1"
  },
  [50003025] = {
    id = 50003025,
    type = 7,
    show_type = 4,
    stages = {
      50170251,
      50170252,
      50170253,
      50170254,
      50170255,
      50170256,
      50170257,
      50170258,
      50170259
    },
    pre = 50003024,
    next = 50003026,
    open_condition = "70020100:1"
  },
  [50003026] = {
    id = 50003026,
    type = 7,
    show_type = 3,
    stages = {
      50170261,
      50170262,
      50170263,
      50170264,
      50170265,
      50170266,
      50170267,
      50170268,
      50170269
    },
    pre = 50003025,
    next = 50003027,
    open_condition = "70020100:1"
  },
  [50003027] = {
    id = 50003027,
    type = 7,
    show_type = 2,
    stages = {
      50170271,
      50170272,
      50170273,
      50170274,
      50170275,
      50170276,
      50170277,
      50170278,
      50170279
    },
    pre = 50003026,
    next = 50003028,
    open_condition = "70020100:1"
  },
  [50003028] = {
    id = 50003028,
    type = 7,
    show_type = 5,
    stages = {
      50170281,
      50170282,
      50170283,
      50170284,
      50170285,
      50170286,
      50170287,
      50170288,
      50170289
    },
    pre = 50003027,
    next = 50003029,
    open_condition = "70020100:1"
  },
  [50003029] = {
    id = 50003029,
    type = 7,
    show_type = 1,
    stages = {
      50170291,
      50170292,
      50170293,
      50170294,
      50170295,
      50170296,
      50170297,
      50170298,
      50170299
    },
    pre = 50003028,
    next = 50003030,
    open_condition = "70020100:1"
  },
  [50003030] = {
    id = 50003030,
    type = 7,
    show_type = 4,
    stages = {
      50170301,
      50170302,
      50170303,
      50170304,
      50170305,
      50170306,
      50170307,
      50170308,
      50170309
    },
    pre = 50003029,
    next = 50003031,
    open_condition = "70020100:1"
  },
  [50003031] = {
    id = 50003031,
    type = 7,
    show_type = 3,
    stages = {
      50170311,
      50170312,
      50170313,
      50170314,
      50170315,
      50170316,
      50170317,
      50170318,
      50170319
    },
    pre = 50003030,
    next = 50003032,
    open_condition = "70020100:1"
  },
  [50003032] = {
    id = 50003032,
    type = 7,
    show_type = 2,
    stages = {
      50170321,
      50170322,
      50170323,
      50170324,
      50170325,
      50170326,
      50170327,
      50170328,
      50170329
    },
    pre = 50003031,
    next = 50003033,
    open_condition = "70020100:1"
  },
  [50003033] = {
    id = 50003033,
    type = 7,
    show_type = 5,
    stages = {
      50170331,
      50170332,
      50170333,
      50170334,
      50170335,
      50170336,
      50170337,
      50170338,
      50170339
    },
    pre = 50003032,
    next = 50003034,
    open_condition = "70020100:1"
  },
  [50003034] = {
    id = 50003034,
    type = 7,
    show_type = 1,
    stages = {
      50170341,
      50170342,
      50170343,
      50170344,
      50170345,
      50170346,
      50170347,
      50170348,
      50170349
    },
    pre = 50003033,
    next = 50003035,
    open_condition = "70020100:1"
  },
  [50003035] = {
    id = 50003035,
    type = 7,
    show_type = 4,
    stages = {
      50170351,
      50170352,
      50170353,
      50170354,
      50170355,
      50170356,
      50170357,
      50170358,
      50170359
    },
    pre = 50003034,
    next = 50003036,
    open_condition = "70020100:1"
  },
  [50003036] = {
    id = 50003036,
    type = 7,
    show_type = 3,
    stages = {
      50170361,
      50170362,
      50170363,
      50170364,
      50170365,
      50170366,
      50170367,
      50170368,
      50170369
    },
    pre = 50003035,
    next = 0,
    open_condition = "70020100:1"
  },
  [50004001] = {
    id = 50004001,
    name = function()
      return T(80204001)
    end,
    type = 8,
    stages = {
      50190001,
      50190002,
      50190003,
      50190004,
      50190005
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "UIBackGround:SuperDungeon_1000",
    reward_back_ground = "UIBackGround:SuperDungeon_1000",
    challenge_condition = 1201
  },
  [50005001] = {
    id = 50005001,
    type = 10,
    stages = {
      51170101,
      51170102,
      51170103,
      51170104,
      51170105,
      51170106,
      51170107,
      51170108,
      51170109,
      51170110
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005002] = {
    id = 50005002,
    type = 10,
    stages = {
      51170201,
      51170202,
      51170203,
      51170204,
      51170205,
      51170206,
      51170207,
      51170208,
      51170209,
      51170210
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005003] = {
    id = 50005003,
    type = 10,
    stages = {
      51170301,
      51170302,
      51170303,
      51170304,
      51170305,
      51170306,
      51170307,
      51170308,
      51170309,
      51170310
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005004] = {
    id = 50005004,
    type = 10,
    stages = {
      51170401,
      51170402,
      51170403,
      51170404,
      51170405,
      51170406,
      51170407,
      51170408,
      51170409,
      51170410
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005005] = {
    id = 50005005,
    type = 10,
    stages = {
      51170501,
      51170502,
      51170503,
      51170504,
      51170505,
      51170506,
      51170507,
      51170508,
      51170509,
      51170510
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005006] = {
    id = 50005006,
    type = 10,
    stages = {
      51170601,
      51170602,
      51170603,
      51170604,
      51170605,
      51170606,
      51170607,
      51170608,
      51170609,
      51170610
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005007] = {
    id = 50005007,
    type = 10,
    stages = {
      51170701,
      51170702,
      51170703,
      51170704,
      51170705,
      51170706,
      51170707,
      51170708,
      51170709,
      51170710
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005008] = {
    id = 50005008,
    type = 10,
    stages = {
      51170801,
      51170802,
      51170803,
      51170804,
      51170805,
      51170806,
      51170807,
      51170808,
      51170809,
      51170810
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005009] = {
    id = 50005009,
    type = 10,
    stages = {
      51170901,
      51170902,
      51170903,
      51170904,
      51170905,
      51170906,
      51170907,
      51170908,
      51170909,
      51170910
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005010] = {
    id = 50005010,
    type = 10,
    stages = {
      51171001,
      51171002,
      51171003,
      51171004,
      51171005,
      51171006,
      51171007,
      51171008,
      51171009,
      51171010
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005011] = {
    id = 50005011,
    type = 10,
    stages = {
      51171101,
      51171102,
      51171103,
      51171104,
      51171105,
      51171106,
      51171107,
      51171108,
      51171109,
      51171110
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50005012] = {
    id = 50005012,
    type = 10,
    stages = {
      51171201,
      51171202,
      51171203,
      51171204,
      51171205,
      51171206,
      51171207,
      51171208,
      51171209,
      51171210
    },
    pre = 0,
    next = 0,
    open_condition = "70020200:50120505",
    back_ground = "UIBackGround:SuperDungeon_1000"
  },
  [50010101] = {
    id = 50010101,
    name = function()
      return T(80206001)
    end,
    type = 21,
    stages = {
      50501101,
      50501102,
      50501103,
      50501104,
      50501105,
      50501106,
      50501107,
      50501108,
      50501109,
      50501110,
      50501111,
      50501112,
      50501113,
      50501114,
      50501115
    },
    pre = 0,
    next = 50010102,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1:Map_1",
    back_ground = "ActivityDungeon1:MapBottom_1"
  },
  [50010102] = {
    id = 50010102,
    name = function()
      return T(80206002)
    end,
    type = 21,
    stages = {
      50501201,
      50501202,
      50501203,
      50501204,
      50501205,
      50501206,
      50501207,
      50501208,
      50501209,
      50501210,
      50501211,
      50501212,
      50501213,
      50501214,
      50501215
    },
    pre = 50010101,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1:Map_2",
    back_ground = "ActivityDungeon1:MapBottom_2"
  },
  [50010104] = {
    id = 50010104,
    name = function()
      return T(80206004)
    end,
    type = 22,
    stages = {
      50501401,
      50501402,
      50501403,
      50501404
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1:Material_1000"
  },
  [50010105] = {
    id = 50010105,
    name = function()
      return T(80206005)
    end,
    type = 23,
    stages = {
      50501501,
      50501502,
      50501503,
      50501504,
      50501505,
      50501506,
      50501507,
      50501508,
      50501509,
      50501510
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1:Boss_1000"
  },
  [50010106] = {
    id = 50010106,
    name = function()
      return T(80206006)
    end,
    type = 21,
    stages = {
      50501601,
      50501602,
      50501603,
      50501604,
      50501605,
      50501606,
      50501607,
      50501608,
      50501609,
      50501610
    },
    pre = 0,
    next = 50010107,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1001:Map_1",
    back_ground = "ActivityDungeon1001:MapBottom_1"
  },
  [50010107] = {
    id = 50010107,
    name = function()
      return T(80206007)
    end,
    type = 21,
    stages = {
      50501701,
      50501702,
      50501703,
      50501704,
      50501705,
      50501706,
      50501707,
      50501708,
      50501709,
      50501710
    },
    pre = 50010106,
    next = 50010108,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1001:Map_2",
    back_ground = "ActivityDungeon1001:MapBottom_2"
  },
  [50010108] = {
    id = 50010108,
    name = function()
      return T(80206008)
    end,
    type = 21,
    stages = {
      50501801,
      50501802,
      50501803,
      50501804,
      50501805,
      50501806,
      50501807,
      50501808,
      50501809,
      50501810
    },
    pre = 50010107,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1001:Map_2",
    back_ground = "ActivityDungeon1001:MapBottom_3"
  },
  [50010109] = {
    id = 50010109,
    name = function()
      return T(80206009)
    end,
    type = 22,
    stages = {
      50501901,
      50501902,
      50501903,
      50501904
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1001:Material_1000"
  },
  [50010110] = {
    id = 50010110,
    name = function()
      return T(80206010)
    end,
    type = 23,
    stages = {
      50502001,
      50502002,
      50502003,
      50502004,
      50502005,
      50502006,
      50502007,
      50502008,
      50502009,
      50502010
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1001:Boss_1000"
  },
  [50010111] = {
    id = 50010111,
    name = function()
      return T(80206011)
    end,
    type = 21,
    stages = {
      50502101,
      50502102,
      50502103,
      50502104,
      50502105,
      50502106,
      50502107,
      50502108,
      50502109,
      50502110
    },
    pre = 0,
    next = 50010112,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1002:Map_1",
    back_ground = "ActivityDungeon1002:MapBottom_1"
  },
  [50010112] = {
    id = 50010112,
    name = function()
      return T(80206012)
    end,
    type = 21,
    stages = {
      50502201,
      50502202,
      50502203,
      50502204,
      50502205,
      50502206,
      50502207,
      50502208,
      50502209,
      50502210
    },
    pre = 50010111,
    next = 50010113,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1002:Map_2",
    back_ground = "ActivityDungeon1002:MapBottom_2"
  },
  [50010113] = {
    id = 50010113,
    name = function()
      return T(80206013)
    end,
    type = 21,
    stages = {
      50502301,
      50502302,
      50502303,
      50502304,
      50502305,
      50502306,
      50502307,
      50502308,
      50502309,
      50502310
    },
    pre = 50010112,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1002:Map_2",
    back_ground = "ActivityDungeon1002:MapBottom_3"
  },
  [50010114] = {
    id = 50010114,
    name = function()
      return T(80206014)
    end,
    type = 22,
    stages = {
      50502401,
      50502402,
      50502403,
      50502404
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1002:Material_1000"
  },
  [50010115] = {
    id = 50010115,
    name = function()
      return T(80206015)
    end,
    type = 23,
    stages = {
      50502501,
      50502502,
      50502503,
      50502504,
      50502505,
      50502506,
      50502507,
      50502508,
      50502509,
      50502510
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1002:Boss_1000"
  },
  [50010116] = {
    id = 50010116,
    name = function()
      return T(80206016)
    end,
    type = 21,
    stages = {
      50502601,
      50502602,
      50502603,
      50502604,
      50502605,
      50502606,
      50502607,
      50502608,
      50502609,
      50502610
    },
    pre = 0,
    next = 50010117,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1003:Map_1",
    back_ground = "ActivityDungeon1003:MapBottom_1"
  },
  [50010117] = {
    id = 50010117,
    name = function()
      return T(80206017)
    end,
    type = 21,
    stages = {
      50502701,
      50502702,
      50502703,
      50502704,
      50502705,
      50502706,
      50502707,
      50502708,
      50502709,
      50502710
    },
    pre = 50010116,
    next = 50010118,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1003:Map_2",
    back_ground = "ActivityDungeon1003:MapBottom_2"
  },
  [50010118] = {
    id = 50010118,
    name = function()
      return T(80206018)
    end,
    type = 21,
    stages = {
      50502801,
      50502802,
      50502803,
      50502804,
      50502805,
      50502806,
      50502807,
      50502808,
      50502809,
      50502810
    },
    pre = 50010117,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1003:Map_2",
    back_ground = "ActivityDungeon1003:MapBottom_3"
  },
  [50010119] = {
    id = 50010119,
    name = function()
      return T(80206019)
    end,
    type = 22,
    stages = {
      50502901,
      50502902,
      50502903,
      50502904
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1003:Material_1000"
  },
  [50010120] = {
    id = 50010120,
    name = function()
      return T(80206020)
    end,
    type = 23,
    stages = {
      50503001,
      50503002,
      50503003,
      50503004,
      50503005,
      50503006,
      50503007,
      50503008,
      50503009,
      50503010
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1003:Boss_1000"
  },
  [50010121] = {
    id = 50010121,
    name = function()
      return T(80206021)
    end,
    type = 21,
    stages = {
      50503101,
      50503102,
      50503103,
      50503104,
      50503105,
      50503106,
      50503107,
      50503108,
      50503109,
      50503110
    },
    pre = 0,
    next = 50010122,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1004:Map_1",
    back_ground = "ActivityDungeon1004:MapBottom_1"
  },
  [50010122] = {
    id = 50010122,
    name = function()
      return T(80206022)
    end,
    type = 21,
    stages = {
      50503201,
      50503202,
      50503203,
      50503204,
      50503205,
      50503206,
      50503207,
      50503208,
      50503209,
      50503210
    },
    pre = 50010121,
    next = 50010123,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1004:Map_2",
    back_ground = "ActivityDungeon1004:MapBottom_2"
  },
  [50010123] = {
    id = 50010123,
    name = function()
      return T(80206023)
    end,
    type = 21,
    stages = {
      50503301,
      50503302,
      50503303,
      50503304,
      50503305,
      50503306,
      50503307,
      50503308,
      50503309,
      50503310
    },
    pre = 50010122,
    next = 50010124,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1004:Map_2",
    back_ground = "ActivityDungeon1004:MapBottom_3"
  },
  [50010124] = {
    id = 50010124,
    name = function()
      return T(80206024)
    end,
    type = 21,
    stages = {
      50503401,
      50503402,
      50503403,
      50503404,
      50503405,
      50503406,
      50503407,
      50503408,
      50503409,
      50503410
    },
    pre = 50010123,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1004:Map_2",
    back_ground = "ActivityDungeon1004:MapBottom_4"
  },
  [50010125] = {
    id = 50010125,
    name = function()
      return T(80206025)
    end,
    type = 22,
    stages = {
      50503501,
      50503502,
      50503503,
      50503504
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1004:Material_1000"
  },
  [50010126] = {
    id = 50010126,
    name = function()
      return T(80206026)
    end,
    type = 23,
    stages = {
      50503601,
      50503602,
      50503603,
      50503604,
      50503605,
      50503606,
      50503607,
      50503608,
      50503609,
      50503610
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1004:Boss_1000"
  },
  [50010127] = {
    id = 50010127,
    name = function()
      return T(80206027)
    end,
    type = 21,
    stages = {
      50503701,
      50503702,
      50503703,
      50503704,
      50503705,
      50503706,
      50503707,
      50503708,
      50503709,
      50503710,
      50503711,
      50503712,
      50503713,
      50503714,
      50503715
    },
    pre = 0,
    next = 50010128,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1005:Map_1",
    back_ground = "ActivityDungeon1005:MapBottom_1"
  },
  [50010128] = {
    id = 50010128,
    name = function()
      return T(80206028)
    end,
    type = 21,
    stages = {
      50503801,
      50503802,
      50503803,
      50503804,
      50503805,
      50503806,
      50503807,
      50503808,
      50503809,
      50503810,
      50503811,
      50503812,
      50503813,
      50503814,
      50503815
    },
    pre = 50010127,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1005:Map_2",
    back_ground = "ActivityDungeon1005:MapBottom_2"
  },
  [50010129] = {
    id = 50010129,
    name = function()
      return T(80206029)
    end,
    type = 22,
    stages = {
      50503901,
      50503902,
      50503903,
      50503904
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1005:Material_1000"
  },
  [50010130] = {
    id = 50010130,
    name = function()
      return T(80206030)
    end,
    type = 23,
    stages = {
      50504001,
      50504002,
      50504003,
      50504004,
      50504005,
      50504006,
      50504007,
      50504008,
      50504009,
      50504010
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1005:Boss_1000"
  },
  [50010131] = {
    id = 50010131,
    name = function()
      return T(80206031)
    end,
    type = 21,
    stages = {
      50504101,
      50504102,
      50504103,
      50504104,
      50504105,
      50504106,
      50504107,
      50504108,
      50504109,
      50504110,
      50504111,
      50504112,
      50504113,
      50504114,
      50504115
    },
    pre = 0,
    next = 50010132,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1006:Map_1",
    back_ground = "ActivityDungeon1006:MapBottom_1"
  },
  [50010132] = {
    id = 50010132,
    name = function()
      return T(80206032)
    end,
    type = 21,
    stages = {
      50504201,
      50504202,
      50504203,
      50504204,
      50504205,
      50504206,
      50504207,
      50504208,
      50504209,
      50504210,
      50504211,
      50504212,
      50504213,
      50504214,
      50504215
    },
    pre = 50010131,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1006:Map_2",
    back_ground = "ActivityDungeon1006:MapBottom_2"
  },
  [50010133] = {
    id = 50010133,
    name = function()
      return T(80206033)
    end,
    type = 22,
    stages = {
      50504301,
      50504302,
      50504303,
      50504304
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1006:Material_1000"
  },
  [50010134] = {
    id = 50010134,
    name = function()
      return T(80206034)
    end,
    type = 23,
    stages = {
      50504401,
      50504402,
      50504403,
      50504404,
      50504405,
      50504406,
      50504407,
      50504408,
      50504409,
      50504410
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1006:Boss_1000"
  },
  [50010135] = {
    id = 50010135,
    name = function()
      return T(80206035)
    end,
    type = 21,
    stages = {
      50504501,
      50504502,
      50504503,
      50504504,
      50504505,
      50504506,
      50504507,
      50504508,
      50504509,
      50504510,
      50504511,
      50504512,
      50504513,
      50504514,
      50504515
    },
    pre = 0,
    next = 50010136,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1007:Map_1",
    back_ground = "ActivityDungeon1007:MapBottom_1"
  },
  [50010136] = {
    id = 50010136,
    name = function()
      return T(80206036)
    end,
    type = 21,
    stages = {
      50504601,
      50504602,
      50504603,
      50504604,
      50504605,
      50504606,
      50504607,
      50504608,
      50504609,
      50504610,
      50504611,
      50504612,
      50504613,
      50504614,
      50504615
    },
    pre = 50010135,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1007:Map_2",
    back_ground = "ActivityDungeon1007:MapBottom_2"
  },
  [50010137] = {
    id = 50010137,
    name = function()
      return T(80206037)
    end,
    type = 22,
    stages = {
      50504701,
      50504702,
      50504703,
      50504704
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1007:Material_1000"
  },
  [50010138] = {
    id = 50010138,
    name = function()
      return T(80206038)
    end,
    type = 23,
    stages = {
      50504801,
      50504802,
      50504803,
      50504804,
      50504805,
      50504806,
      50504807,
      50504808,
      50504809,
      50504810
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1007:Boss_1000"
  },
  [50010139] = {
    id = 50010139,
    name = function()
      return T(80206039)
    end,
    type = 21,
    stages = {
      50504901,
      50504902,
      50504903,
      50504904,
      50504905,
      50504906,
      50504907,
      50504908,
      50504909,
      50504910
    },
    pre = 0,
    next = 50010140,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1008:Map_1",
    back_ground = "ActivityDungeon1008:MapBottom_1"
  },
  [50010140] = {
    id = 50010140,
    name = function()
      return T(80206040)
    end,
    type = 21,
    stages = {
      50505001,
      50505002,
      50505003,
      50505004,
      50505005,
      50505006,
      50505007,
      50505008,
      50505009,
      50505010
    },
    pre = 50010139,
    next = 50010141,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1008:Map_2",
    back_ground = "ActivityDungeon1008:MapBottom_2"
  },
  [50010141] = {
    id = 50010141,
    name = function()
      return T(80206041)
    end,
    type = 21,
    stages = {
      50505101,
      50505102,
      50505103,
      50505104,
      50505105,
      50505106,
      50505107,
      50505108,
      50505109,
      50505110
    },
    pre = 50010140,
    next = 50010142,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1008:Map_2",
    back_ground = "ActivityDungeon1008:MapBottom_3"
  },
  [50010142] = {
    id = 50010142,
    name = function()
      return T(80206042)
    end,
    type = 21,
    stages = {
      50505201,
      50505202,
      50505203,
      50505204,
      50505205,
      50505206,
      50505207,
      50505208,
      50505209,
      50505210
    },
    pre = 50010141,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1008:Map_2",
    back_ground = "ActivityDungeon1008:MapBottom_4"
  },
  [50010143] = {
    id = 50010143,
    name = function()
      return T(80206043)
    end,
    type = 22,
    stages = {
      50505301,
      50505302,
      50505303,
      50505304
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1008:Material_1000"
  },
  [50010144] = {
    id = 50010144,
    name = function()
      return T(80206044)
    end,
    type = 23,
    stages = {
      50505401,
      50505402,
      50505403,
      50505404,
      50505405,
      50505406,
      50505407,
      50505408,
      50505409,
      50505410
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1008:Boss_1000"
  },
  [50010145] = {
    id = 50010145,
    name = function()
      return T(80206045)
    end,
    type = 21,
    stages = {
      50505501,
      50505502,
      50505503,
      50505504,
      50505505,
      50505506,
      50505507,
      50505508,
      50505509,
      50505510,
      50505511,
      50505512,
      50505513,
      50505514,
      50505515
    },
    pre = 0,
    next = 50010146,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1010:Map_1",
    back_ground = "ActivityDungeon1010:MapBottom_1"
  },
  [50010146] = {
    id = 50010146,
    name = function()
      return T(80206046)
    end,
    type = 21,
    stages = {
      50505601,
      50505602,
      50505603,
      50505604,
      50505605,
      50505606,
      50505607,
      50505608,
      50505609,
      50505610,
      50505611,
      50505612,
      50505613,
      50505614,
      50505615
    },
    pre = 50010145,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1010:Map_2",
    back_ground = "ActivityDungeon1010:MapBottom_2"
  },
  [50010147] = {
    id = 50010147,
    name = function()
      return T(80206047)
    end,
    type = 22,
    stages = {
      50505701,
      50505702,
      50505703,
      50505704
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1010:Material_1000"
  },
  [50010148] = {
    id = 50010148,
    name = function()
      return T(80206048)
    end,
    type = 23,
    stages = {
      50505801,
      50505802,
      50505803,
      50505804,
      50505805,
      50505806,
      50505807,
      50505808,
      50505809,
      50505810
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1010:Boss_1000"
  },
  [50010149] = {
    id = 50010149,
    name = function()
      return T(80206049)
    end,
    type = 21,
    stages = {
      50505901,
      50505902,
      50505903,
      50505904,
      50505905,
      50505906,
      50505907,
      50505908,
      50505909,
      50505910,
      50505911,
      50505912,
      50505913,
      50505914,
      50505915
    },
    pre = 0,
    next = 50010150,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1011:Map_1",
    back_ground = "ActivityDungeon1011:MapBottom_1"
  },
  [50010150] = {
    id = 50010150,
    name = function()
      return T(80206050)
    end,
    type = 21,
    stages = {
      50506001,
      50506002,
      50506003,
      50506004,
      50506005,
      50506006,
      50506007,
      50506008,
      50506009,
      50506010,
      50506011,
      50506012,
      50506013,
      50506014,
      50506015
    },
    pre = 50010149,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1011:Map_2",
    back_ground = "ActivityDungeon1011:MapBottom_2"
  },
  [50010151] = {
    id = 50010151,
    name = function()
      return T(80206051)
    end,
    type = 22,
    stages = {
      50506101,
      50506102,
      50506103,
      50506104
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1011:Material_1000"
  },
  [50010152] = {
    id = 50010152,
    name = function()
      return T(80206052)
    end,
    type = 23,
    stages = {
      50506201,
      50506202,
      50506203,
      50506204,
      50506205,
      50506206,
      50506207,
      50506208,
      50506209,
      50506210
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1011:Boss_1000"
  },
  [50010153] = {
    id = 50010153,
    name = function()
      return T(80206053)
    end,
    type = 21,
    stages = {
      50506301,
      50506302,
      50506303,
      50506304,
      50506305,
      50506306,
      50506307,
      50506308,
      50506309,
      50506310,
      50506311,
      50506312,
      50506313,
      50506314,
      50506315
    },
    pre = 0,
    next = 50010154,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1012:Map_1",
    back_ground = "ActivityDungeon1012:MapBottom_1"
  },
  [50010154] = {
    id = 50010154,
    name = function()
      return T(80206054)
    end,
    type = 21,
    stages = {
      50506401,
      50506402,
      50506403,
      50506404,
      50506405,
      50506406,
      50506407,
      50506408,
      50506409,
      50506410,
      50506411,
      50506412,
      50506413,
      50506414,
      50506415
    },
    pre = 50010153,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1012:Map_2",
    back_ground = "ActivityDungeon1012:MapBottom_2"
  },
  [50010155] = {
    id = 50010155,
    name = function()
      return T(80206055)
    end,
    type = 22,
    stages = {
      50506501,
      50506502,
      50506503,
      50506504
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1012:Material_1000"
  },
  [50010156] = {
    id = 50010156,
    name = function()
      return T(80206056)
    end,
    type = 23,
    stages = {
      50506601,
      50506602,
      50506603,
      50506604,
      50506605,
      50506606,
      50506607,
      50506608,
      50506609,
      50506610
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1012:Boss_1000"
  },
  [50010157] = {
    id = 50010157,
    name = function()
      return T(80206057)
    end,
    type = 21,
    stages = {
      50506701,
      50506702,
      50506703,
      50506704,
      50506705,
      50506706,
      50506707,
      50506708,
      50506709,
      50506710,
      50506711,
      50506712,
      50506713,
      50506714,
      50506715
    },
    pre = 0,
    next = 50010158,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon0001:Map_1",
    back_ground = "ActivityDungeon0001:MapBottom_1"
  },
  [50010158] = {
    id = 50010158,
    name = function()
      return T(80206058)
    end,
    type = 21,
    stages = {
      50506801,
      50506802,
      50506803,
      50506804,
      50506805,
      50506806,
      50506807,
      50506808,
      50506809,
      50506810,
      50506811,
      50506812,
      50506813,
      50506814,
      50506815
    },
    pre = 50010157,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon0001:Map_2",
    back_ground = "ActivityDungeon0001:MapBottom_2"
  },
  [50010159] = {
    id = 50010159,
    name = function()
      return T(80206059)
    end,
    type = 22,
    stages = {
      50506901,
      50506902,
      50506903,
      50506904
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon0001:Material_1000"
  },
  [50010160] = {
    id = 50010160,
    name = function()
      return T(80206060)
    end,
    type = 23,
    stages = {
      50507001,
      50507002,
      50507003,
      50507004,
      50507005,
      50507006,
      50507007,
      50507008,
      50507009,
      50507010
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon0001:Boss_1000"
  },
  [50010161] = {
    id = 50010161,
    name = function()
      return T(80206061)
    end,
    type = 21,
    stages = {
      50507101,
      50507102,
      50507103,
      50507104,
      50507105,
      50507106,
      50507107,
      50507108,
      50507109,
      50507110
    },
    pre = 0,
    next = 50010162,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1013:Map_1",
    back_ground = "ActivityDungeon1013:MapBottom_1"
  },
  [50010162] = {
    id = 50010162,
    name = function()
      return T(80206062)
    end,
    type = 21,
    stages = {
      50507201,
      50507202,
      50507203,
      50507204,
      50507205,
      50507206,
      50507207,
      50507208,
      50507209,
      50507210
    },
    pre = 50010161,
    next = 50010163,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1013:Map_2",
    back_ground = "ActivityDungeon1013:MapBottom_2"
  },
  [50010163] = {
    id = 50010163,
    name = function()
      return T(80206063)
    end,
    type = 21,
    stages = {
      50507301,
      50507302,
      50507303,
      50507304,
      50507305,
      50507306,
      50507307,
      50507308,
      50507309,
      50507310
    },
    pre = 50010162,
    next = 50010164,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1013:Map_2",
    back_ground = "ActivityDungeon1013:MapBottom_3"
  },
  [50010164] = {
    id = 50010164,
    name = function()
      return T(80206064)
    end,
    type = 21,
    stages = {
      50507401,
      50507402,
      50507403,
      50507404,
      50507405,
      50507406,
      50507407,
      50507408,
      50507409,
      50507410
    },
    pre = 50010163,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1013:Map_2",
    back_ground = "ActivityDungeon1013:MapBottom_4"
  },
  [50010165] = {
    id = 50010165,
    name = function()
      return T(80206065)
    end,
    type = 22,
    stages = {
      50507501,
      50507502,
      50507503,
      50507504
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1013:Material_1000"
  },
  [50010166] = {
    id = 50010166,
    name = function()
      return T(80206066)
    end,
    type = 23,
    stages = {
      50507601,
      50507602,
      50507603,
      50507604,
      50507605,
      50507606,
      50507607,
      50507608,
      50507609,
      50507610
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1013:Boss_1000"
  },
  [50010167] = {
    id = 50010167,
    name = function()
      return T(80206067)
    end,
    type = 21,
    stages = {
      50507701,
      50507702,
      50507703,
      50507704,
      50507705,
      50507706,
      50507707,
      50507708,
      50507709,
      50507710,
      50507711,
      50507712,
      50507713,
      50507714,
      50507715
    },
    pre = 0,
    next = 50010168,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1014:Map_1",
    back_ground = "ActivityDungeon1014:MapBottom_1"
  },
  [50010168] = {
    id = 50010168,
    name = function()
      return T(80206068)
    end,
    type = 21,
    stages = {
      50507801,
      50507802,
      50507803,
      50507804,
      50507805,
      50507806,
      50507807,
      50507808,
      50507809,
      50507810,
      50507811,
      50507812,
      50507813,
      50507814,
      50507815
    },
    pre = 50010167,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1014:Map_2",
    back_ground = "ActivityDungeon1014:MapBottom_2"
  },
  [50010169] = {
    id = 50010169,
    name = function()
      return T(80206069)
    end,
    type = 22,
    stages = {
      50507901,
      50507902,
      50507903,
      50507904
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1014:Material_1000"
  },
  [50010170] = {
    id = 50010170,
    name = function()
      return T(80206070)
    end,
    type = 23,
    stages = {
      50508001,
      50508002,
      50508003,
      50508004,
      50508005,
      50508006,
      50508007,
      50508008,
      50508009,
      50508010
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1014:Boss_1000"
  },
  [50010171] = {
    id = 50010171,
    name = function()
      return T(80206071)
    end,
    type = 21,
    stages = {
      50508101,
      50508102,
      50508103,
      50508104,
      50508105,
      50508106,
      50508107,
      50508108,
      50508109,
      50508110,
      50508111,
      50508112,
      50508113,
      50508114,
      50508115
    },
    pre = 0,
    next = 50010172,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1015:Map_1",
    back_ground = "ActivityDungeon1015:MapBottom_1"
  },
  [50010172] = {
    id = 50010172,
    name = function()
      return T(80206072)
    end,
    type = 21,
    stages = {
      50508201,
      50508202,
      50508203,
      50508204,
      50508205,
      50508206,
      50508207,
      50508208,
      50508209,
      50508210,
      50508211,
      50508212,
      50508213,
      50508214,
      50508215
    },
    pre = 50010171,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1015:Map_2",
    back_ground = "ActivityDungeon1015:MapBottom_2"
  },
  [50010173] = {
    id = 50010173,
    name = function()
      return T(80206073)
    end,
    type = 22,
    stages = {
      50508301,
      50508302,
      50508303,
      50508304
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1015:Material_1000"
  },
  [50010174] = {
    id = 50010174,
    name = function()
      return T(80206074)
    end,
    type = 23,
    stages = {
      50508401,
      50508402,
      50508403,
      50508404,
      50508405,
      50508406,
      50508407,
      50508408,
      50508409,
      50508410
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1015:Boss_1000"
  },
  [50010175] = {
    id = 50010175,
    name = function()
      return T(80206075)
    end,
    type = 21,
    stages = {
      50508501,
      50508502,
      50508503,
      50508504,
      50508505,
      50508506,
      50508507,
      50508508,
      50508509,
      50508510,
      50508511,
      50508512,
      50508513,
      50508514,
      50508515
    },
    pre = 0,
    next = 50010176,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1016:Map_1",
    back_ground = "ActivityDungeon1016:MapBottom_1"
  },
  [50010176] = {
    id = 50010176,
    name = function()
      return T(80206076)
    end,
    type = 21,
    stages = {
      50508601,
      50508602,
      50508603,
      50508604,
      50508605,
      50508606,
      50508607,
      50508608,
      50508609,
      50508610,
      50508611,
      50508612,
      50508613,
      50508614,
      50508615
    },
    pre = 50010175,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1016:Map_2",
    back_ground = "ActivityDungeon1016:MapBottom_2"
  },
  [50010177] = {
    id = 50010177,
    name = function()
      return T(80206077)
    end,
    type = 22,
    stages = {
      50508701,
      50508702,
      50508703,
      50508704
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1016:Material_1000"
  },
  [50010178] = {
    id = 50010178,
    name = function()
      return T(80206078)
    end,
    type = 23,
    stages = {
      50508801,
      50508802,
      50508803,
      50508804,
      50508805,
      50508806,
      50508807,
      50508808,
      50508809,
      50508810
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1016:Boss_1000"
  },
  [50010179] = {
    id = 50010179,
    name = function()
      return T(80206079)
    end,
    type = 21,
    stages = {
      50508901,
      50508902,
      50508903,
      50508904,
      50508905,
      50508906,
      50508907,
      50508908,
      50508909,
      50508910
    },
    pre = 0,
    next = 50010180,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1017:Map_1",
    back_ground = "ActivityDungeon1017:MapBottom_1"
  },
  [50010180] = {
    id = 50010180,
    name = function()
      return T(80206080)
    end,
    type = 21,
    stages = {
      50509001,
      50509002,
      50509003,
      50509004,
      50509005,
      50509006,
      50509007,
      50509008,
      50509009,
      50509010
    },
    pre = 50010179,
    next = 50010181,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1017:Map_2",
    back_ground = "ActivityDungeon1017:MapBottom_2"
  },
  [50010181] = {
    id = 50010181,
    name = function()
      return T(80206081)
    end,
    type = 21,
    stages = {
      50509101,
      50509102,
      50509103,
      50509104,
      50509105,
      50509106,
      50509107,
      50509108,
      50509109,
      50509110
    },
    pre = 50010180,
    next = 50010182,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1017:Map_2",
    back_ground = "ActivityDungeon1017:MapBottom_3"
  },
  [50010182] = {
    id = 50010182,
    name = function()
      return T(80206082)
    end,
    type = 21,
    stages = {
      50509201,
      50509202,
      50509203,
      50509204,
      50509205,
      50509206,
      50509207,
      50509208,
      50509209,
      50509210
    },
    pre = 50010181,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1017:Map_2",
    back_ground = "ActivityDungeon1017:MapBottom_4"
  },
  [50010183] = {
    id = 50010183,
    name = function()
      return T(80206083)
    end,
    type = 22,
    stages = {
      50509301,
      50509302,
      50509303,
      50509304
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1017:Material_1000"
  },
  [50010184] = {
    id = 50010184,
    name = function()
      return T(80206084)
    end,
    type = 23,
    stages = {
      50509401,
      50509402,
      50509403,
      50509404,
      50509405,
      50509406,
      50509407,
      50509408,
      50509409,
      50509410
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1017:Boss_1000"
  },
  [50010185] = {
    id = 50010185,
    name = function()
      return T(80206085)
    end,
    type = 21,
    stages = {
      50509501,
      50509502,
      50509503,
      50509504,
      50509505,
      50509506,
      50509507,
      50509508,
      50509509,
      50509510,
      50509511,
      50509512,
      50509513,
      50509514,
      50509515
    },
    pre = 0,
    next = 50010186,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1018:Map_1",
    back_ground = "ActivityDungeon1018:MapBottom_1"
  },
  [50010186] = {
    id = 50010186,
    name = function()
      return T(80206086)
    end,
    type = 21,
    stages = {
      50509601,
      50509602,
      50509603,
      50509604,
      50509605,
      50509606,
      50509607,
      50509608,
      50509609,
      50509610,
      50509611,
      50509612,
      50509613,
      50509614,
      50509615
    },
    pre = 50010185,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1018:Map_2",
    back_ground = "ActivityDungeon1018:MapBottom_2"
  },
  [50010187] = {
    id = 50010187,
    name = function()
      return T(80206087)
    end,
    type = 22,
    stages = {
      50509701,
      50509702,
      50509703,
      50509704
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1018:Material_1000"
  },
  [50010188] = {
    id = 50010188,
    name = function()
      return T(80206088)
    end,
    type = 23,
    stages = {
      50509801,
      50509802,
      50509803,
      50509804,
      50509805,
      50509806,
      50509807,
      50509808,
      50509809,
      50509810
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1018:Boss_1000"
  },
  [50010189] = {
    id = 50010189,
    name = function()
      return T(80206089)
    end,
    type = 21,
    stages = {
      50509901,
      50509902,
      50509903,
      50509904,
      50509905,
      50509906,
      50509907,
      50509908,
      50509909,
      50509910,
      50509911,
      50509912,
      50509913,
      50509914,
      50509915
    },
    pre = 0,
    next = 50010190,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1019:Map_1",
    back_ground = "ActivityDungeon1019:MapBottom_1"
  },
  [50010190] = {
    id = 50010190,
    name = function()
      return T(80206090)
    end,
    type = 21,
    stages = {
      50510001,
      50510002,
      50510003,
      50510004,
      50510005,
      50510006,
      50510007,
      50510008,
      50510009,
      50510010,
      50510011,
      50510012,
      50510013,
      50510014,
      50510015
    },
    pre = 50010189,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1019:Map_2",
    back_ground = "ActivityDungeon1019:MapBottom_2"
  },
  [50010191] = {
    id = 50010191,
    name = function()
      return T(80206091)
    end,
    type = 22,
    stages = {
      50510101,
      50510102,
      50510103,
      50510104
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1019:Material_1000"
  },
  [50010192] = {
    id = 50010192,
    name = function()
      return T(80206092)
    end,
    type = 23,
    stages = {
      50510201,
      50510202,
      50510203,
      50510204,
      50510205,
      50510206,
      50510207,
      50510208,
      50510209,
      50510210
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1019:Boss_1000"
  },
  [50010193] = {
    id = 50010193,
    name = function()
      return T(80206093)
    end,
    type = 21,
    stages = {
      50510301,
      50510302,
      50510303,
      50510304,
      50510305,
      50510306,
      50510307,
      50510308,
      50510309,
      50510310,
      50510311,
      50510312,
      50510313,
      50510314,
      50510315
    },
    pre = 0,
    next = 50010194,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1020:Map_1",
    back_ground = "ActivityDungeon1020:MapBottom_1"
  },
  [50010194] = {
    id = 50010194,
    name = function()
      return T(80206094)
    end,
    type = 21,
    stages = {
      50510401,
      50510402,
      50510403,
      50510404,
      50510405,
      50510406,
      50510407,
      50510408,
      50510409,
      50510410,
      50510411,
      50510412,
      50510413,
      50510414,
      50510415
    },
    pre = 50010193,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1020:Map_2",
    back_ground = "ActivityDungeon1020:MapBottom_2"
  },
  [50010195] = {
    id = 50010195,
    name = function()
      return T(80206095)
    end,
    type = 22,
    stages = {
      50510501,
      50510502,
      50510503,
      50510504
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1020:Material_1000"
  },
  [50010196] = {
    id = 50010196,
    name = function()
      return T(80206096)
    end,
    type = 23,
    stages = {
      50510601,
      50510602,
      50510603,
      50510604,
      50510605,
      50510606,
      50510607,
      50510608,
      50510609,
      50510610
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1020:Boss_1000"
  },
  [50010197] = {
    id = 50010197,
    name = function()
      return T(80206097)
    end,
    type = 21,
    stages = {
      50510701,
      50510702,
      50510703,
      50510704,
      50510705,
      50510706,
      50510707,
      50510708,
      50510709,
      50510710,
      50510711,
      50510712,
      50510713,
      50510714,
      50510715
    },
    pre = 0,
    next = 50010198,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1021:Map_1",
    back_ground = "ActivityDungeon1021:MapBottom_1"
  },
  [50010198] = {
    id = 50010198,
    name = function()
      return T(80206098)
    end,
    type = 21,
    stages = {
      50510801,
      50510802,
      50510803,
      50510804,
      50510805,
      50510806,
      50510807,
      50510808,
      50510809,
      50510810,
      50510811,
      50510812,
      50510813,
      50510814,
      50510815
    },
    pre = 50010197,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1021:Map_2",
    back_ground = "ActivityDungeon1021:MapBottom_2"
  },
  [50010199] = {
    id = 50010199,
    name = function()
      return T(80206099)
    end,
    type = 22,
    stages = {
      50510901,
      50510902,
      50510903,
      50510904
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1021:Material_1000"
  },
  [50010200] = {
    id = 50010200,
    name = function()
      return T(80206100)
    end,
    type = 23,
    stages = {
      50511001,
      50511002,
      50511003,
      50511004,
      50511005,
      50511006,
      50511007,
      50511008,
      50511009,
      50511010
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1021:Boss_1000"
  },
  [50010201] = {
    id = 50010201,
    name = function()
      return T(80206101)
    end,
    type = 21,
    stages = {
      50511101,
      50511102,
      50511103,
      50511104,
      50511105,
      50511106,
      50511107,
      50511108,
      50511109,
      50511110,
      50511111,
      50511112,
      50511113,
      50511114,
      50511115
    },
    pre = 0,
    next = 50010202,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1022:Map_1",
    back_ground = "ActivityDungeon1022:MapBottom_1"
  },
  [50010202] = {
    id = 50010202,
    name = function()
      return T(80206102)
    end,
    type = 21,
    stages = {
      50511201,
      50511202,
      50511203,
      50511204,
      50511205,
      50511206,
      50511207,
      50511208,
      50511209,
      50511210,
      50511211,
      50511212,
      50511213,
      50511214,
      50511215
    },
    pre = 50010201,
    next = 0,
    open_condition = "70020100:1",
    map_path = "ActivityDungeon1022:Map_2",
    back_ground = "ActivityDungeon1022:MapBottom_2"
  },
  [50010203] = {
    id = 50010203,
    name = function()
      return T(80206103)
    end,
    type = 22,
    stages = {
      50511301,
      50511302,
      50511303,
      50511304
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1022:Material_1000"
  },
  [50010204] = {
    id = 50010204,
    name = function()
      return T(80206104)
    end,
    type = 23,
    stages = {
      50511401,
      50511402,
      50511403,
      50511404,
      50511405,
      50511406,
      50511407,
      50511408,
      50511409,
      50511410
    },
    pre = 0,
    next = 0,
    open_condition = "70020100:1",
    back_ground = "ActivityDungeon1022:Boss_1000"
  },
  [50020101] = {
    id = 50020101,
    type = 32,
    stages = {
      51501011,
      51501012,
      51501013,
      51501014,
      51501015
    },
    pre = 0,
    next = 50020102,
    open_condition = "70020100:1"
  },
  [50020102] = {
    id = 50020102,
    type = 32,
    stages = {
      51501021,
      51501022,
      51501023,
      51501024,
      51501025
    },
    pre = 50020101,
    next = 50020103,
    open_condition = "70020100:1"
  },
  [50020103] = {
    id = 50020103,
    type = 32,
    stages = {
      51501031,
      51501032,
      51501033,
      51501034,
      51501035
    },
    pre = 50020102,
    next = 50020104,
    open_condition = "70020100:1"
  },
  [50020104] = {
    id = 50020104,
    type = 32,
    stages = {
      51501041,
      51501042,
      51501043,
      51501044,
      51501045
    },
    pre = 50020103,
    next = 50020105,
    open_condition = "70020100:1"
  },
  [50020105] = {
    id = 50020105,
    type = 32,
    stages = {
      51501051,
      51501052,
      51501053,
      51501054,
      51501055
    },
    pre = 50020104,
    next = 50020106,
    open_condition = "70020100:1"
  },
  [50020106] = {
    id = 50020106,
    type = 32,
    stages = {
      51501061,
      51501062,
      51501063,
      51501064,
      51501065
    },
    pre = 50020105,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020201] = {
    id = 50020201,
    type = 32,
    stages = {
      51502011,
      51502012,
      51502013,
      51502014,
      51502015
    },
    pre = 0,
    next = 50020202,
    open_condition = "70020100:1"
  },
  [50020202] = {
    id = 50020202,
    type = 32,
    stages = {
      51502021,
      51502022,
      51502023,
      51502024,
      51502025
    },
    pre = 50020201,
    next = 50020203,
    open_condition = "70020100:1"
  },
  [50020203] = {
    id = 50020203,
    type = 32,
    stages = {
      51502031,
      51502032,
      51502033,
      51502034,
      51502035
    },
    pre = 50020202,
    next = 50020204,
    open_condition = "70020100:1"
  },
  [50020204] = {
    id = 50020204,
    type = 32,
    stages = {
      51502041,
      51502042,
      51502043,
      51502044,
      51502045
    },
    pre = 50020203,
    next = 50020205,
    open_condition = "70020100:1"
  },
  [50020205] = {
    id = 50020205,
    type = 32,
    stages = {
      51502051,
      51502052,
      51502053,
      51502054,
      51502055
    },
    pre = 50020204,
    next = 50020206,
    open_condition = "70020100:1"
  },
  [50020206] = {
    id = 50020206,
    type = 32,
    stages = {
      51502061,
      51502062,
      51502063,
      51502064,
      51502065
    },
    pre = 50020205,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020301] = {
    id = 50020301,
    type = 32,
    stages = {
      51503011,
      51503012,
      51503013,
      51503014,
      51503015
    },
    pre = 0,
    next = 50020302,
    open_condition = "70020100:1"
  },
  [50020302] = {
    id = 50020302,
    type = 32,
    stages = {
      51503021,
      51503022,
      51503023,
      51503024,
      51503025
    },
    pre = 50020301,
    next = 50020303,
    open_condition = "70020100:1"
  },
  [50020303] = {
    id = 50020303,
    type = 32,
    stages = {
      51503031,
      51503032,
      51503033,
      51503034,
      51503035
    },
    pre = 50020302,
    next = 50020304,
    open_condition = "70020100:1"
  },
  [50020304] = {
    id = 50020304,
    type = 32,
    stages = {
      51503041,
      51503042,
      51503043,
      51503044,
      51503045
    },
    pre = 50020303,
    next = 50020305,
    open_condition = "70020100:1"
  },
  [50020305] = {
    id = 50020305,
    type = 32,
    stages = {
      51503051,
      51503052,
      51503053,
      51503054,
      51503055
    },
    pre = 50020304,
    next = 50020306,
    open_condition = "70020100:1"
  },
  [50020306] = {
    id = 50020306,
    type = 32,
    stages = {
      51503061,
      51503062,
      51503063,
      51503064,
      51503065
    },
    pre = 50020305,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020401] = {
    id = 50020401,
    type = 32,
    stages = {
      51504011,
      51504012,
      51504013,
      51504014,
      51504015
    },
    pre = 0,
    next = 50020402,
    open_condition = "70020100:1"
  },
  [50020402] = {
    id = 50020402,
    type = 32,
    stages = {
      51504021,
      51504022,
      51504023,
      51504024,
      51504025
    },
    pre = 50020401,
    next = 50020403,
    open_condition = "70020100:1"
  },
  [50020403] = {
    id = 50020403,
    type = 32,
    stages = {
      51504031,
      51504032,
      51504033,
      51504034,
      51504035
    },
    pre = 50020402,
    next = 50020404,
    open_condition = "70020100:1"
  },
  [50020404] = {
    id = 50020404,
    type = 32,
    stages = {
      51504041,
      51504042,
      51504043,
      51504044,
      51504045
    },
    pre = 50020403,
    next = 50020405,
    open_condition = "70020100:1"
  },
  [50020405] = {
    id = 50020405,
    type = 32,
    stages = {
      51504051,
      51504052,
      51504053,
      51504054,
      51504055
    },
    pre = 50020404,
    next = 50020406,
    open_condition = "70020100:1"
  },
  [50020406] = {
    id = 50020406,
    type = 32,
    stages = {
      51504061,
      51504062,
      51504063,
      51504064,
      51504065
    },
    pre = 50020405,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020501] = {
    id = 50020501,
    type = 32,
    stages = {
      51505011,
      51505012,
      51505013,
      51505014,
      51505015
    },
    pre = 0,
    next = 50020502,
    open_condition = "70020100:1"
  },
  [50020502] = {
    id = 50020502,
    type = 32,
    stages = {
      51505021,
      51505022,
      51505023,
      51505024,
      51505025
    },
    pre = 50020501,
    next = 50020503,
    open_condition = "70020100:1"
  },
  [50020503] = {
    id = 50020503,
    type = 32,
    stages = {
      51505031,
      51505032,
      51505033,
      51505034,
      51505035
    },
    pre = 50020502,
    next = 50020504,
    open_condition = "70020100:1"
  },
  [50020504] = {
    id = 50020504,
    type = 32,
    stages = {
      51505041,
      51505042,
      51505043,
      51505044,
      51505045
    },
    pre = 50020503,
    next = 50020505,
    open_condition = "70020100:1"
  },
  [50020505] = {
    id = 50020505,
    type = 32,
    stages = {
      51505051,
      51505052,
      51505053,
      51505054,
      51505055
    },
    pre = 50020504,
    next = 50020506,
    open_condition = "70020100:1"
  },
  [50020506] = {
    id = 50020506,
    type = 32,
    stages = {
      51505061,
      51505062,
      51505063,
      51505064,
      51505065
    },
    pre = 50020505,
    next = 50020507,
    open_condition = "70020100:1"
  },
  [50020507] = {
    id = 50020507,
    type = 32,
    stages = {
      51505071,
      51505072,
      51505073,
      51505074,
      51505075
    },
    pre = 50020506,
    next = 50020508,
    open_condition = "70020100:1"
  },
  [50020508] = {
    id = 50020508,
    type = 32,
    stages = {
      51505081,
      51505082,
      51505083,
      51505084,
      51505085
    },
    pre = 50020507,
    next = 50020509,
    open_condition = "70020100:1"
  },
  [50020509] = {
    id = 50020509,
    type = 32,
    stages = {
      51505091,
      51505092,
      51505093,
      51505094,
      51505095
    },
    pre = 50020508,
    next = 50020510,
    open_condition = "70020100:1"
  },
  [50020510] = {
    id = 50020510,
    type = 32,
    stages = {
      51505101,
      51505102,
      51505103,
      51505104,
      51505105
    },
    pre = 50020509,
    next = 50020511,
    open_condition = "70020100:1"
  },
  [50020511] = {
    id = 50020511,
    type = 32,
    stages = {
      51505111,
      51505112,
      51505113,
      51505114,
      51505115
    },
    pre = 50020510,
    next = 50020512,
    open_condition = "70020100:1"
  },
  [50020512] = {
    id = 50020512,
    type = 32,
    stages = {
      51505121,
      51505122,
      51505123,
      51505124,
      51505125
    },
    pre = 50020511,
    next = 50020513,
    open_condition = "70020100:1"
  },
  [50020513] = {
    id = 50020513,
    type = 32,
    stages = {
      51505131,
      51505132,
      51505133,
      51505134,
      51505135
    },
    pre = 50020512,
    next = 50020514,
    open_condition = "70020100:1"
  },
  [50020514] = {
    id = 50020514,
    type = 32,
    stages = {
      51505141,
      51505142,
      51505143,
      51505144,
      51505145
    },
    pre = 50020513,
    next = 50020515,
    open_condition = "70020100:1"
  },
  [50020515] = {
    id = 50020515,
    type = 32,
    stages = {
      51505151,
      51505152,
      51505153,
      51505154,
      51505155
    },
    pre = 50020514,
    next = 50020516,
    open_condition = "70020100:1"
  },
  [50020516] = {
    id = 50020516,
    type = 32,
    stages = {
      51505161,
      51505162,
      51505163,
      51505164,
      51505165
    },
    pre = 50020515,
    next = 50020517,
    open_condition = "70020100:1"
  },
  [50020517] = {
    id = 50020517,
    type = 32,
    stages = {
      51505171,
      51505172,
      51505173,
      51505174,
      51505175
    },
    pre = 50020516,
    next = 50020518,
    open_condition = "70020100:1"
  },
  [50020518] = {
    id = 50020518,
    type = 32,
    stages = {
      51505181,
      51505182,
      51505183,
      51505184,
      51505185
    },
    pre = 50020517,
    next = 50020519,
    open_condition = "70020100:1"
  },
  [50020519] = {
    id = 50020519,
    type = 32,
    stages = {
      51505191,
      51505192,
      51505193,
      51505194,
      51505195
    },
    pre = 50020518,
    next = 50020520,
    open_condition = "70020100:1"
  },
  [50020520] = {
    id = 50020520,
    type = 32,
    stages = {
      51505201,
      51505202,
      51505203,
      51505204,
      51505205
    },
    pre = 50020519,
    next = 50020521,
    open_condition = "70020100:1"
  },
  [50020521] = {
    id = 50020521,
    type = 32,
    stages = {
      51505211,
      51505212,
      51505213,
      51505214,
      51505215
    },
    pre = 50020520,
    next = 50020522,
    open_condition = "70020100:1"
  },
  [50020522] = {
    id = 50020522,
    type = 32,
    stages = {
      51505221,
      51505222,
      51505223,
      51505224,
      51505225
    },
    pre = 50020521,
    next = 50020523,
    open_condition = "70020100:1"
  },
  [50020523] = {
    id = 50020523,
    type = 32,
    stages = {
      51505231,
      51505232,
      51505233,
      51505234,
      51505235
    },
    pre = 50020522,
    next = 50020524,
    open_condition = "70020100:1"
  },
  [50020524] = {
    id = 50020524,
    type = 32,
    stages = {
      51505241,
      51505242,
      51505243,
      51505244,
      51505245
    },
    pre = 50020523,
    next = 50020525,
    open_condition = "70020100:1"
  },
  [50020525] = {
    id = 50020525,
    type = 32,
    stages = {
      51505251,
      51505252,
      51505253,
      51505254,
      51505255
    },
    pre = 50020524,
    next = 50020526,
    open_condition = "70020100:1"
  },
  [50020526] = {
    id = 50020526,
    type = 32,
    stages = {
      51505261,
      51505262,
      51505263,
      51505264,
      51505265
    },
    pre = 50020525,
    next = 50020527,
    open_condition = "70020100:1"
  },
  [50020527] = {
    id = 50020527,
    type = 32,
    stages = {
      51505271,
      51505272,
      51505273,
      51505274,
      51505275
    },
    pre = 50020526,
    next = 50020528,
    open_condition = "70020100:1"
  },
  [50020528] = {
    id = 50020528,
    type = 32,
    stages = {
      51505281,
      51505282,
      51505283,
      51505284,
      51505285
    },
    pre = 50020527,
    next = 50020529,
    open_condition = "70020100:1"
  },
  [50020529] = {
    id = 50020529,
    type = 32,
    stages = {
      51505291,
      51505292,
      51505293,
      51505294,
      51505295
    },
    pre = 50020528,
    next = 50020530,
    open_condition = "70020100:1"
  },
  [50020530] = {
    id = 50020530,
    type = 32,
    stages = {
      51505301,
      51505302,
      51505303,
      51505304,
      51505305
    },
    pre = 50020529,
    next = 50020531,
    open_condition = "70020100:1"
  },
  [50020531] = {
    id = 50020531,
    type = 32,
    stages = {
      51505311,
      51505312,
      51505313,
      51505314,
      51505315
    },
    pre = 50020530,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020601] = {
    id = 50020601,
    type = 32,
    stages = {
      51506011,
      51506012,
      51506013,
      51506014,
      51506015
    },
    pre = 0,
    next = 50020602,
    open_condition = "70020100:1"
  },
  [50020602] = {
    id = 50020602,
    type = 32,
    stages = {
      51506021,
      51506022,
      51506023,
      51506024,
      51506025
    },
    pre = 50020601,
    next = 50020603,
    open_condition = "70020100:1"
  },
  [50020603] = {
    id = 50020603,
    type = 32,
    stages = {
      51506031,
      51506032,
      51506033,
      51506034,
      51506035
    },
    pre = 50020602,
    next = 50020604,
    open_condition = "70020100:1"
  },
  [50020604] = {
    id = 50020604,
    type = 32,
    stages = {
      51506041,
      51506042,
      51506043,
      51506044,
      51506045
    },
    pre = 50020603,
    next = 50020605,
    open_condition = "70020100:1"
  },
  [50020605] = {
    id = 50020605,
    type = 32,
    stages = {
      51506051,
      51506052,
      51506053,
      51506054,
      51506055
    },
    pre = 50020604,
    next = 50020606,
    open_condition = "70020100:1"
  },
  [50020606] = {
    id = 50020606,
    type = 32,
    stages = {
      51506061,
      51506062,
      51506063,
      51506064,
      51506065
    },
    pre = 50020605,
    next = 50020607,
    open_condition = "70020100:1"
  },
  [50020607] = {
    id = 50020607,
    type = 32,
    stages = {
      51506071,
      51506072,
      51506073,
      51506074,
      51506075
    },
    pre = 50020606,
    next = 50020608,
    open_condition = "70020100:1"
  },
  [50020608] = {
    id = 50020608,
    type = 32,
    stages = {
      51506081,
      51506082,
      51506083,
      51506084,
      51506085
    },
    pre = 50020607,
    next = 50020609,
    open_condition = "70020100:1"
  },
  [50020609] = {
    id = 50020609,
    type = 32,
    stages = {
      51506091,
      51506092,
      51506093,
      51506094,
      51506095
    },
    pre = 50020608,
    next = 50020610,
    open_condition = "70020100:1"
  },
  [50020610] = {
    id = 50020610,
    type = 32,
    stages = {
      51506101,
      51506102,
      51506103,
      51506104,
      51506105
    },
    pre = 50020609,
    next = 50020611,
    open_condition = "70020100:1"
  },
  [50020611] = {
    id = 50020611,
    type = 32,
    stages = {
      51506111,
      51506112,
      51506113,
      51506114,
      51506115
    },
    pre = 50020610,
    next = 50020612,
    open_condition = "70020100:1"
  },
  [50020612] = {
    id = 50020612,
    type = 32,
    stages = {
      51506121,
      51506122,
      51506123,
      51506124,
      51506125
    },
    pre = 50020611,
    next = 50020613,
    open_condition = "70020100:1"
  },
  [50020613] = {
    id = 50020613,
    type = 32,
    stages = {
      51506131,
      51506132,
      51506133,
      51506134,
      51506135
    },
    pre = 50020612,
    next = 50020614,
    open_condition = "70020100:1"
  },
  [50020614] = {
    id = 50020614,
    type = 32,
    stages = {
      51506141,
      51506142,
      51506143,
      51506144,
      51506145
    },
    pre = 50020613,
    next = 50020615,
    open_condition = "70020100:1"
  },
  [50020615] = {
    id = 50020615,
    type = 32,
    stages = {
      51506151,
      51506152,
      51506153,
      51506154,
      51506155
    },
    pre = 50020614,
    next = 50020616,
    open_condition = "70020100:1"
  },
  [50020616] = {
    id = 50020616,
    type = 32,
    stages = {
      51506161,
      51506162,
      51506163,
      51506164,
      51506165
    },
    pre = 50020615,
    next = 50020617,
    open_condition = "70020100:1"
  },
  [50020617] = {
    id = 50020617,
    type = 32,
    stages = {
      51506171,
      51506172,
      51506173,
      51506174,
      51506175
    },
    pre = 50020616,
    next = 50020618,
    open_condition = "70020100:1"
  },
  [50020618] = {
    id = 50020618,
    type = 32,
    stages = {
      51506181,
      51506182,
      51506183,
      51506184,
      51506185
    },
    pre = 50020617,
    next = 50020619,
    open_condition = "70020100:1"
  },
  [50020619] = {
    id = 50020619,
    type = 32,
    stages = {
      51506191,
      51506192,
      51506193,
      51506194,
      51506195
    },
    pre = 50020618,
    next = 50020620,
    open_condition = "70020100:1"
  },
  [50020620] = {
    id = 50020620,
    type = 32,
    stages = {
      51506201,
      51506202,
      51506203,
      51506204,
      51506205
    },
    pre = 50020619,
    next = 50020621,
    open_condition = "70020100:1"
  },
  [50020621] = {
    id = 50020621,
    type = 32,
    stages = {
      51506211,
      51506212,
      51506213,
      51506214,
      51506215
    },
    pre = 50020620,
    next = 50020622,
    open_condition = "70020100:1"
  },
  [50020622] = {
    id = 50020622,
    type = 32,
    stages = {
      51506221,
      51506222,
      51506223,
      51506224,
      51506225
    },
    pre = 50020621,
    next = 50020623,
    open_condition = "70020100:1"
  },
  [50020623] = {
    id = 50020623,
    type = 32,
    stages = {
      51506231,
      51506232,
      51506233,
      51506234,
      51506235
    },
    pre = 50020622,
    next = 50020624,
    open_condition = "70020100:1"
  },
  [50020624] = {
    id = 50020624,
    type = 32,
    stages = {
      51506241,
      51506242,
      51506243,
      51506244,
      51506245
    },
    pre = 50020623,
    next = 50020625,
    open_condition = "70020100:1"
  },
  [50020625] = {
    id = 50020625,
    type = 32,
    stages = {
      51506251,
      51506252,
      51506253,
      51506254,
      51506255
    },
    pre = 50020624,
    next = 50020626,
    open_condition = "70020100:1"
  },
  [50020626] = {
    id = 50020626,
    type = 32,
    stages = {
      51506261,
      51506262,
      51506263,
      51506264,
      51506265
    },
    pre = 50020625,
    next = 50020627,
    open_condition = "70020100:1"
  },
  [50020627] = {
    id = 50020627,
    type = 32,
    stages = {
      51506271,
      51506272,
      51506273,
      51506274,
      51506275
    },
    pre = 50020626,
    next = 50020628,
    open_condition = "70020100:1"
  },
  [50020628] = {
    id = 50020628,
    type = 32,
    stages = {
      51506281,
      51506282,
      51506283,
      51506284,
      51506285
    },
    pre = 50020627,
    next = 50020629,
    open_condition = "70020100:1"
  },
  [50020629] = {
    id = 50020629,
    type = 32,
    stages = {
      51506291,
      51506292,
      51506293,
      51506294,
      51506295
    },
    pre = 50020628,
    next = 50020630,
    open_condition = "70020100:1"
  },
  [50020630] = {
    id = 50020630,
    type = 32,
    stages = {
      51506301,
      51506302,
      51506303,
      51506304,
      51506305
    },
    pre = 50020629,
    next = 50020631,
    open_condition = "70020100:1"
  },
  [50020631] = {
    id = 50020631,
    type = 32,
    stages = {
      51506311,
      51506312,
      51506313,
      51506314,
      51506315
    },
    pre = 50020630,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020701] = {
    id = 50020701,
    type = 32,
    stages = {
      51507011,
      51507012,
      51507013,
      51507014,
      51507015
    },
    pre = 0,
    next = 50020702,
    open_condition = "70020100:1"
  },
  [50020702] = {
    id = 50020702,
    type = 32,
    stages = {
      51507021,
      51507022,
      51507023,
      51507024,
      51507025
    },
    pre = 50020701,
    next = 50020703,
    open_condition = "70020100:1"
  },
  [50020703] = {
    id = 50020703,
    type = 32,
    stages = {
      51507031,
      51507032,
      51507033,
      51507034,
      51507035
    },
    pre = 50020702,
    next = 50020704,
    open_condition = "70020100:1"
  },
  [50020704] = {
    id = 50020704,
    type = 32,
    stages = {
      51507041,
      51507042,
      51507043,
      51507044,
      51507045
    },
    pre = 50020703,
    next = 50020705,
    open_condition = "70020100:1"
  },
  [50020705] = {
    id = 50020705,
    type = 32,
    stages = {
      51507051,
      51507052,
      51507053,
      51507054,
      51507055
    },
    pre = 50020704,
    next = 50020706,
    open_condition = "70020100:1"
  },
  [50020706] = {
    id = 50020706,
    type = 32,
    stages = {
      51507061,
      51507062,
      51507063,
      51507064,
      51507065
    },
    pre = 50020705,
    next = 50020707,
    open_condition = "70020100:1"
  },
  [50020707] = {
    id = 50020707,
    type = 32,
    stages = {
      51507071,
      51507072,
      51507073,
      51507074,
      51507075
    },
    pre = 50020706,
    next = 50020708,
    open_condition = "70020100:1"
  },
  [50020708] = {
    id = 50020708,
    type = 32,
    stages = {
      51507081,
      51507082,
      51507083,
      51507084,
      51507085
    },
    pre = 50020707,
    next = 50020709,
    open_condition = "70020100:1"
  },
  [50020709] = {
    id = 50020709,
    type = 32,
    stages = {
      51507091,
      51507092,
      51507093,
      51507094,
      51507095
    },
    pre = 50020708,
    next = 50020710,
    open_condition = "70020100:1"
  },
  [50020710] = {
    id = 50020710,
    type = 32,
    stages = {
      51507101,
      51507102,
      51507103,
      51507104,
      51507105
    },
    pre = 50020709,
    next = 50020711,
    open_condition = "70020100:1"
  },
  [50020711] = {
    id = 50020711,
    type = 32,
    stages = {
      51507111,
      51507112,
      51507113,
      51507114,
      51507115
    },
    pre = 50020710,
    next = 50020712,
    open_condition = "70020100:1"
  },
  [50020712] = {
    id = 50020712,
    type = 32,
    stages = {
      51507121,
      51507122,
      51507123,
      51507124,
      51507125
    },
    pre = 50020711,
    next = 50020713,
    open_condition = "70020100:1"
  },
  [50020713] = {
    id = 50020713,
    type = 32,
    stages = {
      51507131,
      51507132,
      51507133,
      51507134,
      51507135
    },
    pre = 50020712,
    next = 50020714,
    open_condition = "70020100:1"
  },
  [50020714] = {
    id = 50020714,
    type = 32,
    stages = {
      51507141,
      51507142,
      51507143,
      51507144,
      51507145
    },
    pre = 50020713,
    next = 50020715,
    open_condition = "70020100:1"
  },
  [50020715] = {
    id = 50020715,
    type = 32,
    stages = {
      51507151,
      51507152,
      51507153,
      51507154,
      51507155
    },
    pre = 50020714,
    next = 50020716,
    open_condition = "70020100:1"
  },
  [50020716] = {
    id = 50020716,
    type = 32,
    stages = {
      51507161,
      51507162,
      51507163,
      51507164,
      51507165
    },
    pre = 50020715,
    next = 50020717,
    open_condition = "70020100:1"
  },
  [50020717] = {
    id = 50020717,
    type = 32,
    stages = {
      51507171,
      51507172,
      51507173,
      51507174,
      51507175
    },
    pre = 50020716,
    next = 50020718,
    open_condition = "70020100:1"
  },
  [50020718] = {
    id = 50020718,
    type = 32,
    stages = {
      51507181,
      51507182,
      51507183,
      51507184,
      51507185
    },
    pre = 50020717,
    next = 50020719,
    open_condition = "70020100:1"
  },
  [50020719] = {
    id = 50020719,
    type = 32,
    stages = {
      51507191,
      51507192,
      51507193,
      51507194,
      51507195
    },
    pre = 50020718,
    next = 50020720,
    open_condition = "70020100:1"
  },
  [50020720] = {
    id = 50020720,
    type = 32,
    stages = {
      51507201,
      51507202,
      51507203,
      51507204,
      51507205
    },
    pre = 50020719,
    next = 50020721,
    open_condition = "70020100:1"
  },
  [50020721] = {
    id = 50020721,
    type = 32,
    stages = {
      51507211,
      51507212,
      51507213,
      51507214,
      51507215
    },
    pre = 50020720,
    next = 50020722,
    open_condition = "70020100:1"
  },
  [50020722] = {
    id = 50020722,
    type = 32,
    stages = {
      51507221,
      51507222,
      51507223,
      51507224,
      51507225
    },
    pre = 50020721,
    next = 50020723,
    open_condition = "70020100:1"
  },
  [50020723] = {
    id = 50020723,
    type = 32,
    stages = {
      51507231,
      51507232,
      51507233,
      51507234,
      51507235
    },
    pre = 50020722,
    next = 50020724,
    open_condition = "70020100:1"
  },
  [50020724] = {
    id = 50020724,
    type = 32,
    stages = {
      51507241,
      51507242,
      51507243,
      51507244,
      51507245
    },
    pre = 50020723,
    next = 50020725,
    open_condition = "70020100:1"
  },
  [50020725] = {
    id = 50020725,
    type = 32,
    stages = {
      51507251,
      51507252,
      51507253,
      51507254,
      51507255
    },
    pre = 50020724,
    next = 50020726,
    open_condition = "70020100:1"
  },
  [50020726] = {
    id = 50020726,
    type = 32,
    stages = {
      51507261,
      51507262,
      51507263,
      51507264,
      51507265
    },
    pre = 50020725,
    next = 50020727,
    open_condition = "70020100:1"
  },
  [50020727] = {
    id = 50020727,
    type = 32,
    stages = {
      51507271,
      51507272,
      51507273,
      51507274,
      51507275
    },
    pre = 50020726,
    next = 50020728,
    open_condition = "70020100:1"
  },
  [50020728] = {
    id = 50020728,
    type = 32,
    stages = {
      51507281,
      51507282,
      51507283,
      51507284,
      51507285
    },
    pre = 50020727,
    next = 50020729,
    open_condition = "70020100:1"
  },
  [50020729] = {
    id = 50020729,
    type = 32,
    stages = {
      51507291,
      51507292,
      51507293,
      51507294,
      51507295
    },
    pre = 50020728,
    next = 50020730,
    open_condition = "70020100:1"
  },
  [50020730] = {
    id = 50020730,
    type = 32,
    stages = {
      51507301,
      51507302,
      51507303,
      51507304,
      51507305
    },
    pre = 50020729,
    next = 50020731,
    open_condition = "70020100:1"
  },
  [50020731] = {
    id = 50020731,
    type = 32,
    stages = {
      51507311,
      51507312,
      51507313,
      51507314,
      51507315
    },
    pre = 50020730,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020801] = {
    id = 50020801,
    type = 32,
    stages = {
      51508011,
      51508012,
      51508013,
      51508014,
      51508015
    },
    pre = 0,
    next = 50020802,
    open_condition = "70020100:1"
  },
  [50020802] = {
    id = 50020802,
    type = 32,
    stages = {
      51508021,
      51508022,
      51508023,
      51508024,
      51508025
    },
    pre = 50020801,
    next = 50020803,
    open_condition = "70020100:1"
  },
  [50020803] = {
    id = 50020803,
    type = 32,
    stages = {
      51508031,
      51508032,
      51508033,
      51508034,
      51508035
    },
    pre = 50020802,
    next = 50020804,
    open_condition = "70020100:1"
  },
  [50020804] = {
    id = 50020804,
    type = 32,
    stages = {
      51508041,
      51508042,
      51508043,
      51508044,
      51508045
    },
    pre = 50020803,
    next = 50020805,
    open_condition = "70020100:1"
  },
  [50020805] = {
    id = 50020805,
    type = 32,
    stages = {
      51508051,
      51508052,
      51508053,
      51508054,
      51508055
    },
    pre = 50020804,
    next = 50020806,
    open_condition = "70020100:1"
  },
  [50020806] = {
    id = 50020806,
    type = 32,
    stages = {
      51508061,
      51508062,
      51508063,
      51508064,
      51508065
    },
    pre = 50020805,
    next = 50020807,
    open_condition = "70020100:1"
  },
  [50020807] = {
    id = 50020807,
    type = 32,
    stages = {
      51508071,
      51508072,
      51508073,
      51508074,
      51508075
    },
    pre = 50020806,
    next = 50020808,
    open_condition = "70020100:1"
  },
  [50020808] = {
    id = 50020808,
    type = 32,
    stages = {
      51508081,
      51508082,
      51508083,
      51508084,
      51508085
    },
    pre = 50020807,
    next = 50020809,
    open_condition = "70020100:1"
  },
  [50020809] = {
    id = 50020809,
    type = 32,
    stages = {
      51508091,
      51508092,
      51508093,
      51508094,
      51508095
    },
    pre = 50020808,
    next = 50020810,
    open_condition = "70020100:1"
  },
  [50020810] = {
    id = 50020810,
    type = 32,
    stages = {
      51508101,
      51508102,
      51508103,
      51508104,
      51508105
    },
    pre = 50020809,
    next = 50020811,
    open_condition = "70020100:1"
  },
  [50020811] = {
    id = 50020811,
    type = 32,
    stages = {
      51508111,
      51508112,
      51508113,
      51508114,
      51508115
    },
    pre = 50020810,
    next = 50020812,
    open_condition = "70020100:1"
  },
  [50020812] = {
    id = 50020812,
    type = 32,
    stages = {
      51508121,
      51508122,
      51508123,
      51508124,
      51508125
    },
    pre = 50020811,
    next = 50020813,
    open_condition = "70020100:1"
  },
  [50020813] = {
    id = 50020813,
    type = 32,
    stages = {
      51508131,
      51508132,
      51508133,
      51508134,
      51508135
    },
    pre = 50020812,
    next = 50020814,
    open_condition = "70020100:1"
  },
  [50020814] = {
    id = 50020814,
    type = 32,
    stages = {
      51508141,
      51508142,
      51508143,
      51508144,
      51508145
    },
    pre = 50020813,
    next = 50020815,
    open_condition = "70020100:1"
  },
  [50020815] = {
    id = 50020815,
    type = 32,
    stages = {
      51508151,
      51508152,
      51508153,
      51508154,
      51508155
    },
    pre = 50020814,
    next = 50020816,
    open_condition = "70020100:1"
  },
  [50020816] = {
    id = 50020816,
    type = 32,
    stages = {
      51508161,
      51508162,
      51508163,
      51508164,
      51508165
    },
    pre = 50020815,
    next = 50020817,
    open_condition = "70020100:1"
  },
  [50020817] = {
    id = 50020817,
    type = 32,
    stages = {
      51508171,
      51508172,
      51508173,
      51508174,
      51508175
    },
    pre = 50020816,
    next = 50020818,
    open_condition = "70020100:1"
  },
  [50020818] = {
    id = 50020818,
    type = 32,
    stages = {
      51508181,
      51508182,
      51508183,
      51508184,
      51508185
    },
    pre = 50020817,
    next = 50020819,
    open_condition = "70020100:1"
  },
  [50020819] = {
    id = 50020819,
    type = 32,
    stages = {
      51508191,
      51508192,
      51508193,
      51508194,
      51508195
    },
    pre = 50020818,
    next = 50020820,
    open_condition = "70020100:1"
  },
  [50020820] = {
    id = 50020820,
    type = 32,
    stages = {
      51508201,
      51508202,
      51508203,
      51508204,
      51508205
    },
    pre = 50020819,
    next = 50020821,
    open_condition = "70020100:1"
  },
  [50020821] = {
    id = 50020821,
    type = 32,
    stages = {
      51508211,
      51508212,
      51508213,
      51508214,
      51508215
    },
    pre = 50020820,
    next = 50020822,
    open_condition = "70020100:1"
  },
  [50020822] = {
    id = 50020822,
    type = 32,
    stages = {
      51508221,
      51508222,
      51508223,
      51508224,
      51508225
    },
    pre = 50020821,
    next = 50020823,
    open_condition = "70020100:1"
  },
  [50020823] = {
    id = 50020823,
    type = 32,
    stages = {
      51508231,
      51508232,
      51508233,
      51508234,
      51508235
    },
    pre = 50020822,
    next = 50020824,
    open_condition = "70020100:1"
  },
  [50020824] = {
    id = 50020824,
    type = 32,
    stages = {
      51508241,
      51508242,
      51508243,
      51508244,
      51508245
    },
    pre = 50020823,
    next = 50020825,
    open_condition = "70020100:1"
  },
  [50020825] = {
    id = 50020825,
    type = 32,
    stages = {
      51508251,
      51508252,
      51508253,
      51508254,
      51508255
    },
    pre = 50020824,
    next = 50020826,
    open_condition = "70020100:1"
  },
  [50020826] = {
    id = 50020826,
    type = 32,
    stages = {
      51508261,
      51508262,
      51508263,
      51508264,
      51508265
    },
    pre = 50020825,
    next = 50020827,
    open_condition = "70020100:1"
  },
  [50020827] = {
    id = 50020827,
    type = 32,
    stages = {
      51508271,
      51508272,
      51508273,
      51508274,
      51508275
    },
    pre = 50020826,
    next = 50020828,
    open_condition = "70020100:1"
  },
  [50020828] = {
    id = 50020828,
    type = 32,
    stages = {
      51508281,
      51508282,
      51508283,
      51508284,
      51508285
    },
    pre = 50020827,
    next = 50020829,
    open_condition = "70020100:1"
  },
  [50020829] = {
    id = 50020829,
    type = 32,
    stages = {
      51508291,
      51508292,
      51508293,
      51508294,
      51508295
    },
    pre = 50020828,
    next = 50020830,
    open_condition = "70020100:1"
  },
  [50020830] = {
    id = 50020830,
    type = 32,
    stages = {
      51508301,
      51508302,
      51508303,
      51508304,
      51508305
    },
    pre = 50020829,
    next = 50020831,
    open_condition = "70020100:1"
  },
  [50020831] = {
    id = 50020831,
    type = 32,
    stages = {
      51508311,
      51508312,
      51508313,
      51508314,
      51508315
    },
    pre = 50020830,
    next = 0,
    open_condition = "70020100:1"
  },
  [50020901] = {
    id = 50020901,
    type = 32,
    stages = {
      51509011,
      51509012,
      51509013,
      51509014,
      51509015
    },
    pre = 0,
    next = 50020902,
    open_condition = "70020100:1"
  },
  [50020902] = {
    id = 50020902,
    type = 32,
    stages = {
      51509021,
      51509022,
      51509023,
      51509024,
      51509025
    },
    pre = 50020901,
    next = 50020903,
    open_condition = "70020100:1"
  },
  [50020903] = {
    id = 50020903,
    type = 32,
    stages = {
      51509031,
      51509032,
      51509033,
      51509034,
      51509035
    },
    pre = 50020902,
    next = 50020904,
    open_condition = "70020100:1"
  },
  [50020904] = {
    id = 50020904,
    type = 32,
    stages = {
      51509041,
      51509042,
      51509043,
      51509044,
      51509045
    },
    pre = 50020903,
    next = 50020905,
    open_condition = "70020100:1"
  },
  [50020905] = {
    id = 50020905,
    type = 32,
    stages = {
      51509051,
      51509052,
      51509053,
      51509054,
      51509055
    },
    pre = 50020904,
    next = 50020906,
    open_condition = "70020100:1"
  },
  [50020906] = {
    id = 50020906,
    type = 32,
    stages = {
      51509061,
      51509062,
      51509063,
      51509064,
      51509065
    },
    pre = 50020905,
    next = 50020907,
    open_condition = "70020100:1"
  },
  [50020907] = {
    id = 50020907,
    type = 32,
    stages = {
      51509071,
      51509072,
      51509073,
      51509074,
      51509075
    },
    pre = 50020906,
    next = 50020908,
    open_condition = "70020100:1"
  },
  [50020908] = {
    id = 50020908,
    type = 32,
    stages = {
      51509081,
      51509082,
      51509083,
      51509084,
      51509085
    },
    pre = 50020907,
    next = 50020909,
    open_condition = "70020100:1"
  },
  [50020909] = {
    id = 50020909,
    type = 32,
    stages = {
      51509091,
      51509092,
      51509093,
      51509094,
      51509095
    },
    pre = 50020908,
    next = 50020910,
    open_condition = "70020100:1"
  },
  [50020910] = {
    id = 50020910,
    type = 32,
    stages = {
      51509101,
      51509102,
      51509103,
      51509104,
      51509105
    },
    pre = 50020909,
    next = 50020911,
    open_condition = "70020100:1"
  },
  [50020911] = {
    id = 50020911,
    type = 32,
    stages = {
      51509111,
      51509112,
      51509113,
      51509114,
      51509115
    },
    pre = 50020910,
    next = 50020912,
    open_condition = "70020100:1"
  },
  [50020912] = {
    id = 50020912,
    type = 32,
    stages = {
      51509121,
      51509122,
      51509123,
      51509124,
      51509125
    },
    pre = 50020911,
    next = 50020913,
    open_condition = "70020100:1"
  },
  [50020913] = {
    id = 50020913,
    type = 32,
    stages = {
      51509131,
      51509132,
      51509133,
      51509134,
      51509135
    },
    pre = 50020912,
    next = 50020914,
    open_condition = "70020100:1"
  },
  [50020914] = {
    id = 50020914,
    type = 32,
    stages = {
      51509141,
      51509142,
      51509143,
      51509144,
      51509145
    },
    pre = 50020913,
    next = 50020915,
    open_condition = "70020100:1"
  },
  [50020915] = {
    id = 50020915,
    type = 32,
    stages = {
      51509151,
      51509152,
      51509153,
      51509154,
      51509155
    },
    pre = 50020914,
    next = 50020916,
    open_condition = "70020100:1"
  },
  [50020916] = {
    id = 50020916,
    type = 32,
    stages = {
      51509161,
      51509162,
      51509163,
      51509164,
      51509165
    },
    pre = 50020915,
    next = 50020917,
    open_condition = "70020100:1"
  },
  [50020917] = {
    id = 50020917,
    type = 32,
    stages = {
      51509171,
      51509172,
      51509173,
      51509174,
      51509175
    },
    pre = 50020916,
    next = 50020918,
    open_condition = "70020100:1"
  },
  [50020918] = {
    id = 50020918,
    type = 32,
    stages = {
      51509181,
      51509182,
      51509183,
      51509184,
      51509185
    },
    pre = 50020917,
    next = 50020919,
    open_condition = "70020100:1"
  },
  [50020919] = {
    id = 50020919,
    type = 32,
    stages = {
      51509191,
      51509192,
      51509193,
      51509194,
      51509195
    },
    pre = 50020918,
    next = 50020920,
    open_condition = "70020100:1"
  },
  [50020920] = {
    id = 50020920,
    type = 32,
    stages = {
      51509201,
      51509202,
      51509203,
      51509204,
      51509205
    },
    pre = 50020919,
    next = 50020921,
    open_condition = "70020100:1"
  },
  [50020921] = {
    id = 50020921,
    type = 32,
    stages = {
      51509211,
      51509212,
      51509213,
      51509214,
      51509215
    },
    pre = 50020920,
    next = 50020922,
    open_condition = "70020100:1"
  },
  [50020922] = {
    id = 50020922,
    type = 32,
    stages = {
      51509221,
      51509222,
      51509223,
      51509224,
      51509225
    },
    pre = 50020921,
    next = 50020923,
    open_condition = "70020100:1"
  },
  [50020923] = {
    id = 50020923,
    type = 32,
    stages = {
      51509231,
      51509232,
      51509233,
      51509234,
      51509235
    },
    pre = 50020922,
    next = 50020924,
    open_condition = "70020100:1"
  },
  [50020924] = {
    id = 50020924,
    type = 32,
    stages = {
      51509241,
      51509242,
      51509243,
      51509244,
      51509245
    },
    pre = 50020923,
    next = 50020925,
    open_condition = "70020100:1"
  },
  [50020925] = {
    id = 50020925,
    type = 32,
    stages = {
      51509251,
      51509252,
      51509253,
      51509254,
      51509255
    },
    pre = 50020924,
    next = 50020926,
    open_condition = "70020100:1"
  },
  [50020926] = {
    id = 50020926,
    type = 32,
    stages = {
      51509261,
      51509262,
      51509263,
      51509264,
      51509265
    },
    pre = 50020925,
    next = 50020927,
    open_condition = "70020100:1"
  },
  [50020927] = {
    id = 50020927,
    type = 32,
    stages = {
      51509271,
      51509272,
      51509273,
      51509274,
      51509275
    },
    pre = 50020926,
    next = 50020928,
    open_condition = "70020100:1"
  },
  [50020928] = {
    id = 50020928,
    type = 32,
    stages = {
      51509281,
      51509282,
      51509283,
      51509284,
      51509285
    },
    pre = 50020927,
    next = 50020929,
    open_condition = "70020100:1"
  },
  [50020929] = {
    id = 50020929,
    type = 32,
    stages = {
      51509291,
      51509292,
      51509293,
      51509294,
      51509295
    },
    pre = 50020928,
    next = 50020930,
    open_condition = "70020100:1"
  },
  [50020930] = {
    id = 50020930,
    type = 32,
    stages = {
      51509301,
      51509302,
      51509303,
      51509304,
      51509305
    },
    pre = 50020929,
    next = 50020931,
    open_condition = "70020100:1"
  },
  [50020931] = {
    id = 50020931,
    type = 32,
    stages = {
      51509311,
      51509312,
      51509313,
      51509314,
      51509315
    },
    pre = 50020930,
    next = 0,
    open_condition = "70020100:1"
  },
  [50021001] = {
    id = 50021001,
    type = 32,
    stages = {
      51510011,
      51510012,
      51510013,
      51510014,
      51510015
    },
    pre = 0,
    next = 50021002,
    open_condition = "70020100:1"
  },
  [50021002] = {
    id = 50021002,
    type = 32,
    stages = {
      51510021,
      51510022,
      51510023,
      51510024,
      51510025
    },
    pre = 50021001,
    next = 50021003,
    open_condition = "70020100:1"
  },
  [50021003] = {
    id = 50021003,
    type = 32,
    stages = {
      51510031,
      51510032,
      51510033,
      51510034,
      51510035
    },
    pre = 50021002,
    next = 50021004,
    open_condition = "70020100:1"
  },
  [50021004] = {
    id = 50021004,
    type = 32,
    stages = {
      51510041,
      51510042,
      51510043,
      51510044,
      51510045
    },
    pre = 50021003,
    next = 50021005,
    open_condition = "70020100:1"
  },
  [50021005] = {
    id = 50021005,
    type = 32,
    stages = {
      51510051,
      51510052,
      51510053,
      51510054,
      51510055
    },
    pre = 50021004,
    next = 50021006,
    open_condition = "70020100:1"
  },
  [50021006] = {
    id = 50021006,
    type = 32,
    stages = {
      51510061,
      51510062,
      51510063,
      51510064,
      51510065
    },
    pre = 50021005,
    next = 50021007,
    open_condition = "70020100:1"
  },
  [50021007] = {
    id = 50021007,
    type = 32,
    stages = {
      51510071,
      51510072,
      51510073,
      51510074,
      51510075
    },
    pre = 50021006,
    next = 50021008,
    open_condition = "70020100:1"
  },
  [50021008] = {
    id = 50021008,
    type = 32,
    stages = {
      51510081,
      51510082,
      51510083,
      51510084,
      51510085
    },
    pre = 50021007,
    next = 50021009,
    open_condition = "70020100:1"
  },
  [50021009] = {
    id = 50021009,
    type = 32,
    stages = {
      51510091,
      51510092,
      51510093,
      51510094,
      51510095
    },
    pre = 50021008,
    next = 50021010,
    open_condition = "70020100:1"
  },
  [50021010] = {
    id = 50021010,
    type = 32,
    stages = {
      51510101,
      51510102,
      51510103,
      51510104,
      51510105
    },
    pre = 50021009,
    next = 50021011,
    open_condition = "70020100:1"
  },
  [50021011] = {
    id = 50021011,
    type = 32,
    stages = {
      51510111,
      51510112,
      51510113,
      51510114,
      51510115
    },
    pre = 50021010,
    next = 50021012,
    open_condition = "70020100:1"
  },
  [50021012] = {
    id = 50021012,
    type = 32,
    stages = {
      51510121,
      51510122,
      51510123,
      51510124,
      51510125
    },
    pre = 50021011,
    next = 50021013,
    open_condition = "70020100:1"
  },
  [50021013] = {
    id = 50021013,
    type = 32,
    stages = {
      51510131,
      51510132,
      51510133,
      51510134,
      51510135
    },
    pre = 50021012,
    next = 50021014,
    open_condition = "70020100:1"
  },
  [50021014] = {
    id = 50021014,
    type = 32,
    stages = {
      51510141,
      51510142,
      51510143,
      51510144,
      51510145
    },
    pre = 50021013,
    next = 50021015,
    open_condition = "70020100:1"
  },
  [50021015] = {
    id = 50021015,
    type = 32,
    stages = {
      51510151,
      51510152,
      51510153,
      51510154,
      51510155
    },
    pre = 50021014,
    next = 50021016,
    open_condition = "70020100:1"
  },
  [50021016] = {
    id = 50021016,
    type = 32,
    stages = {
      51510161,
      51510162,
      51510163,
      51510164,
      51510165
    },
    pre = 50021015,
    next = 50021017,
    open_condition = "70020100:1"
  },
  [50021017] = {
    id = 50021017,
    type = 32,
    stages = {
      51510171,
      51510172,
      51510173,
      51510174,
      51510175
    },
    pre = 50021016,
    next = 50021018,
    open_condition = "70020100:1"
  },
  [50021018] = {
    id = 50021018,
    type = 32,
    stages = {
      51510181,
      51510182,
      51510183,
      51510184,
      51510185
    },
    pre = 50021017,
    next = 50021019,
    open_condition = "70020100:1"
  },
  [50021019] = {
    id = 50021019,
    type = 32,
    stages = {
      51510191,
      51510192,
      51510193,
      51510194,
      51510195
    },
    pre = 50021018,
    next = 50021020,
    open_condition = "70020100:1"
  },
  [50021020] = {
    id = 50021020,
    type = 32,
    stages = {
      51510201,
      51510202,
      51510203,
      51510204,
      51510205
    },
    pre = 50021019,
    next = 50021021,
    open_condition = "70020100:1"
  },
  [50021021] = {
    id = 50021021,
    type = 32,
    stages = {
      51510211,
      51510212,
      51510213,
      51510214,
      51510215
    },
    pre = 50021020,
    next = 50021022,
    open_condition = "70020100:1"
  },
  [50021022] = {
    id = 50021022,
    type = 32,
    stages = {
      51510221,
      51510222,
      51510223,
      51510224,
      51510225
    },
    pre = 50021021,
    next = 50021023,
    open_condition = "70020100:1"
  },
  [50021023] = {
    id = 50021023,
    type = 32,
    stages = {
      51510231,
      51510232,
      51510233,
      51510234,
      51510235
    },
    pre = 50021022,
    next = 50021024,
    open_condition = "70020100:1"
  },
  [50021024] = {
    id = 50021024,
    type = 32,
    stages = {
      51510241,
      51510242,
      51510243,
      51510244,
      51510245
    },
    pre = 50021023,
    next = 50021025,
    open_condition = "70020100:1"
  },
  [50021025] = {
    id = 50021025,
    type = 32,
    stages = {
      51510251,
      51510252,
      51510253,
      51510254,
      51510255
    },
    pre = 50021024,
    next = 50021026,
    open_condition = "70020100:1"
  },
  [50021026] = {
    id = 50021026,
    type = 32,
    stages = {
      51510261,
      51510262,
      51510263,
      51510264,
      51510265
    },
    pre = 50021025,
    next = 50021027,
    open_condition = "70020100:1"
  },
  [50021027] = {
    id = 50021027,
    type = 32,
    stages = {
      51510271,
      51510272,
      51510273,
      51510274,
      51510275
    },
    pre = 50021026,
    next = 50021028,
    open_condition = "70020100:1"
  },
  [50021028] = {
    id = 50021028,
    type = 32,
    stages = {
      51510281,
      51510282,
      51510283,
      51510284,
      51510285
    },
    pre = 50021027,
    next = 50021029,
    open_condition = "70020100:1"
  },
  [50021029] = {
    id = 50021029,
    type = 32,
    stages = {
      51510291,
      51510292,
      51510293,
      51510294,
      51510295
    },
    pre = 50021028,
    next = 50021030,
    open_condition = "70020100:1"
  },
  [50021030] = {
    id = 50021030,
    type = 32,
    stages = {
      51510301,
      51510302,
      51510303,
      51510304,
      51510305
    },
    pre = 50021029,
    next = 50021031,
    open_condition = "70020100:1"
  },
  [50021031] = {
    id = 50021031,
    type = 32,
    stages = {
      51510311,
      51510312,
      51510313,
      51510314,
      51510315
    },
    pre = 50021030,
    next = 0,
    open_condition = "70020100:1"
  }
}
