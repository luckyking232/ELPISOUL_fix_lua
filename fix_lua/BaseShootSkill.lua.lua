BaseShootSkill = {
  [78010110] = {
    id = 78010110,
    name = function()
      return T(80440110)
    end,
    des = function()
      return T(80450110)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_1",
    icon_ui = "ActivityDungeon1017:Skill_10018_1",
    type = 1,
    card_id = 78000101,
    damage_rate = 10000,
    bullet_speed = 750,
    level_max = 1,
    total_f = 23,
    hurt_point = 12,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000118_skill1.prefab",
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000118_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 20
  },
  [78010111] = {
    id = 78010111,
    name = function()
      return T(80440111)
    end,
    des = function()
      return T(80450111)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_1",
    icon_ui = "ActivityDungeon1017:Skill_10018_1",
    type = 11,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040101:3001:10000"
    },
    appear_pre = {78010110},
    appear_round = 1,
    level_max = -1,
    appear_prob = 10
  },
  [78010112] = {
    id = 78010112,
    name = function()
      return T(80440112)
    end,
    des = function()
      return T(80450112)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_1",
    icon_ui = "ActivityDungeon1017:Skill_10018_1",
    type = 11,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040102:3001:10000"
    },
    appear_pre = {78010110},
    appear_round = 1,
    level_max = 2,
    appear_prob = 100
  },
  [78010113] = {
    id = 78010113,
    name = function()
      return T(80440113)
    end,
    des = function()
      return T(80450113)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_1",
    icon_ui = "ActivityDungeon1017:Skill_10018_1",
    type = 11,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040103:3001:10000"
    },
    appear_pre = {78010110},
    appear_round = 2,
    level_max = 1,
    appear_prob = 100
  },
  [78010120] = {
    id = 78010120,
    name = function()
      return T(80440120)
    end,
    des = function()
      return T(80450120)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_2",
    icon_ui = "ActivityDungeon1017:Skill_10018_2",
    type = 2,
    card_id = 78000101,
    damage_rate = 5000,
    bullet_speed = 750,
    active_buff_list = {
      "78040111:3001:10000"
    },
    appear_round = 2,
    level_max = 1,
    appear_prob = 100,
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000118_skill2_bullet.prefab",
    bullet_scale = 5000,
    bullet_size = 20
  },
  [78010121] = {
    id = 78010121,
    name = function()
      return T(80440121)
    end,
    des = function()
      return T(80450121)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_2",
    icon_ui = "ActivityDungeon1017:Skill_10018_2",
    type = 12,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040112:3001:10000"
    },
    appear_pre = {78010120},
    appear_round = 3,
    level_max = 1,
    appear_prob = 100
  },
  [78010122] = {
    id = 78010122,
    name = function()
      return T(80440122)
    end,
    des = function()
      return T(80450122)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_2",
    icon_ui = "ActivityDungeon1017:Skill_10018_2",
    type = 12,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040113:3001:10000"
    },
    appear_pre = {78010120},
    appear_round = 3,
    level_max = 2,
    appear_prob = 100
  },
  [78010123] = {
    id = 78010123,
    name = function()
      return T(80440123)
    end,
    des = function()
      return T(80450123)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_2",
    icon_ui = "ActivityDungeon1017:Skill_10018_2",
    type = 12,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040114:3001:10000"
    },
    appear_pre = {78010120},
    appear_round = 4,
    level_max = 1,
    appear_prob = 100
  },
  [78010130] = {
    id = 78010130,
    name = function()
      return T(80440130)
    end,
    des = function()
      return T(80450130)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_3",
    icon_ui = "ActivityDungeon1017:Skill_10018_3",
    type = 3,
    card_id = 78000101,
    trigger_condition = {1001},
    trigger_cd = 180,
    target_type = 2001,
    damage_rate = 30000,
    buff_list = {
      "78040121:1000:10000"
    },
    range_type = 1,
    range_x = 40,
    range_y = 40,
    appear_round = 4,
    level_max = 1,
    appear_prob = 300,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000118_skill3.prefab"
  },
  [78010131] = {
    id = 78010131,
    name = function()
      return T(80440131)
    end,
    des = function()
      return T(80450131)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_3",
    icon_ui = "ActivityDungeon1017:Skill_10018_3",
    type = 13,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040122:3001:10000"
    },
    appear_pre = {78010130},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010132] = {
    id = 78010132,
    name = function()
      return T(80440132)
    end,
    des = function()
      return T(80450132)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_3",
    icon_ui = "ActivityDungeon1017:Skill_10018_3",
    type = 13,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040123:3001:10000"
    },
    appear_pre = {78010130},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010133] = {
    id = 78010133,
    name = function()
      return T(80440133)
    end,
    des = function()
      return T(80450133)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10018_3",
    icon_ui = "ActivityDungeon1017:Skill_10018_3",
    type = 13,
    card_id = 78000101,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040124:3001:10000"
    },
    appear_pre = {78010130},
    appear_round = 6,
    level_max = 2,
    appear_prob = 100
  },
  [78010210] = {
    id = 78010210,
    name = function()
      return T(80440210)
    end,
    des = function()
      return T(80450210)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_1",
    icon_ui = "ActivityDungeon1017:Skill_10034_1",
    type = 1,
    card_id = 78000102,
    damage_rate = 10000,
    bullet_speed = 500,
    level_max = 1,
    total_f = 23,
    hurt_point = 12,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000134_skill1.prefab",
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000134_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 20
  },
  [78010211] = {
    id = 78010211,
    name = function()
      return T(80440211)
    end,
    des = function()
      return T(80450211)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_1",
    icon_ui = "ActivityDungeon1017:Skill_10034_1",
    type = 11,
    card_id = 78000102,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040201:3001:10000"
    },
    appear_pre = {78010210},
    appear_round = 1,
    level_max = -1,
    appear_prob = 10
  },
  [78010212] = {
    id = 78010212,
    name = function()
      return T(80440212)
    end,
    des = function()
      return T(80450212)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_1",
    icon_ui = "ActivityDungeon1017:Skill_10034_1",
    type = 11,
    card_id = 78000102,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040202:3001:10000"
    },
    appear_pre = {78010210},
    appear_round = 1,
    level_max = 2,
    appear_prob = 100
  },
  [78010213] = {
    id = 78010213,
    name = function()
      return T(80440213)
    end,
    des = function()
      return T(80450213)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_1",
    icon_ui = "ActivityDungeon1017:Skill_10034_1",
    type = 11,
    card_id = 78000102,
    target_type = 3001,
    damage_rate = 0,
    active_buff_list = {
      "78040203:3001:10000"
    },
    appear_pre = {78010210},
    appear_round = 2,
    level_max = 1,
    appear_prob = 100
  },
  [78010220] = {
    id = 78010220,
    name = function()
      return T(80440220)
    end,
    des = function()
      return T(80450220)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_2",
    icon_ui = "ActivityDungeon1017:Skill_10034_2",
    type = 2,
    card_id = 78000102,
    damage_rate = 850,
    active_buff_list = {
      "78040211:3001:10000"
    },
    appear_round = 2,
    level_max = 1,
    appear_prob = 100
  },
  [78010221] = {
    id = 78010221,
    name = function()
      return T(80440221)
    end,
    des = function()
      return T(80450221)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_2",
    icon_ui = "ActivityDungeon1017:Skill_10034_2",
    type = 12,
    card_id = 78000102,
    damage_rate = 0,
    active_buff_list = {
      "78040213:3001:10000"
    },
    appear_pre = {78010220},
    appear_round = 3,
    level_max = 1,
    appear_prob = 100
  },
  [78010222] = {
    id = 78010222,
    name = function()
      return T(80440222)
    end,
    des = function()
      return T(80450222)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_2",
    icon_ui = "ActivityDungeon1017:Skill_10034_2",
    type = 12,
    card_id = 78000102,
    damage_rate = 0,
    active_buff_list = {
      "78040214:3001:10000"
    },
    appear_pre = {78010220},
    appear_round = 3,
    level_max = 2,
    appear_prob = 100
  },
  [78010223] = {
    id = 78010223,
    name = function()
      return T(80440223)
    end,
    des = function()
      return T(80450223)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_2",
    icon_ui = "ActivityDungeon1017:Skill_10034_2",
    type = 12,
    card_id = 78000102,
    damage_rate = 0,
    active_buff_list = {
      "78040215:3001:10000"
    },
    appear_pre = {78010220},
    appear_round = 4,
    level_max = 1,
    appear_prob = 100
  },
  [78010230] = {
    id = 78010230,
    name = function()
      return T(80440230)
    end,
    des = function()
      return T(80450230)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_3",
    icon_ui = "ActivityDungeon1017:Skill_10034_3",
    type = 3,
    card_id = 78000102,
    trigger_condition = {1001},
    trigger_cd = 450,
    damage_rate = 50000,
    bullet_speed = 120,
    active_buff_list = {
      "78040221:3001:10000"
    },
    appear_round = 4,
    level_max = 1,
    appear_prob = 300,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000134_skill3.prefab",
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000134_skill3_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 40
  },
  [78010231] = {
    id = 78010231,
    name = function()
      return T(80440231)
    end,
    des = function()
      return T(80450231)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_3",
    icon_ui = "ActivityDungeon1017:Skill_10034_3",
    type = 13,
    card_id = 78000102,
    damage_rate = 0,
    active_buff_list = {
      "78040223:3001:10000"
    },
    appear_pre = {78010230},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010232] = {
    id = 78010232,
    name = function()
      return T(80440232)
    end,
    des = function()
      return T(80450232)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_3",
    icon_ui = "ActivityDungeon1017:Skill_10034_3",
    type = 13,
    card_id = 78000102,
    damage_rate = 0,
    active_buff_list = {
      "78040224:3001:10000"
    },
    appear_pre = {78010230},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010233] = {
    id = 78010233,
    name = function()
      return T(80440233)
    end,
    des = function()
      return T(80450233)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10034_3",
    icon_ui = "ActivityDungeon1017:Skill_10034_3",
    type = 13,
    card_id = 78000102,
    damage_rate = 0,
    active_buff_list = {
      "78040225:3001:10000"
    },
    appear_pre = {78010230},
    appear_round = 6,
    level_max = 2,
    appear_prob = 100
  },
  [78010310] = {
    id = 78010310,
    name = function()
      return T(80440310)
    end,
    des = function()
      return T(80450310)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_1",
    icon_ui = "ActivityDungeon1017:Skill_10004_1",
    type = 1,
    card_id = 78000103,
    damage_rate = 2000,
    bullet_speed = 1000,
    pierce_num = 9999,
    level_max = 1,
    total_f = 20,
    hurt_point = 12,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000104_skill1.prefab",
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000104_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 20
  },
  [78010311] = {
    id = 78010311,
    name = function()
      return T(80440311)
    end,
    des = function()
      return T(80450311)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_1",
    icon_ui = "ActivityDungeon1017:Skill_10004_1",
    type = 11,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040301:3001:10000"
    },
    appear_pre = {78010310},
    appear_round = 1,
    level_max = -1,
    appear_prob = 10
  },
  [78010312] = {
    id = 78010312,
    name = function()
      return T(80440312)
    end,
    des = function()
      return T(80450312)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_1",
    icon_ui = "ActivityDungeon1017:Skill_10004_1",
    type = 11,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040302:3001:10000"
    },
    appear_pre = {78010310},
    appear_round = 1,
    level_max = 2,
    appear_prob = 100
  },
  [78010313] = {
    id = 78010313,
    name = function()
      return T(80440313)
    end,
    des = function()
      return T(80450313)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_1",
    icon_ui = "ActivityDungeon1017:Skill_10004_1",
    type = 11,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040303:3001:10000"
    },
    appear_pre = {78010310},
    appear_round = 2,
    level_max = 1,
    appear_prob = 100
  },
  [78010320] = {
    id = 78010320,
    name = function()
      return T(80440320)
    end,
    des = function()
      return T(80450320)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_2",
    icon_ui = "ActivityDungeon1017:Skill_10004_2",
    type = 2,
    card_id = 78000103,
    damage_rate = 2000,
    bullet_speed = 1000,
    active_buff_list = {
      "78040311:3001:10000"
    },
    appear_round = 2,
    level_max = 1,
    appear_prob = 100,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000104_skill2.prefab",
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000104_skill2_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 20
  },
  [78010321] = {
    id = 78010321,
    name = function()
      return T(80440321)
    end,
    des = function()
      return T(80450321)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_2",
    icon_ui = "ActivityDungeon1017:Skill_10004_2",
    type = 12,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040312:3001:10000"
    },
    appear_pre = {78010320},
    appear_round = 3,
    level_max = 1,
    appear_prob = 100
  },
  [78010322] = {
    id = 78010322,
    name = function()
      return T(80440322)
    end,
    des = function()
      return T(80450322)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_2",
    icon_ui = "ActivityDungeon1017:Skill_10004_2",
    type = 12,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040313:3001:10000"
    },
    appear_pre = {78010320},
    appear_round = 3,
    level_max = 2,
    appear_prob = 100
  },
  [78010323] = {
    id = 78010323,
    name = function()
      return T(80440323)
    end,
    des = function()
      return T(80450323)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_2",
    icon_ui = "ActivityDungeon1017:Skill_10004_2",
    type = 12,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040314:3001:10000"
    },
    appear_pre = {78010320},
    appear_round = 4,
    level_max = 1,
    appear_prob = 100
  },
  [78010330] = {
    id = 78010330,
    name = function()
      return T(80440330)
    end,
    des = function()
      return T(80450330)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_3",
    icon_ui = "ActivityDungeon1017:Skill_10004_3",
    type = 3,
    card_id = 78000103,
    trigger_condition = {1001},
    trigger_cd = 600,
    damage_rate = 160000,
    active_buff_list = {
      "78040321:3001:10000"
    },
    appear_round = 4,
    level_max = 1,
    appear_prob = 300
  },
  [78010331] = {
    id = 78010331,
    name = function()
      return T(80440331)
    end,
    des = function()
      return T(80450331)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_3",
    icon_ui = "ActivityDungeon1017:Skill_10004_3",
    type = 13,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040323:3001:10000"
    },
    appear_pre = {78010330},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010332] = {
    id = 78010332,
    name = function()
      return T(80440332)
    end,
    des = function()
      return T(80450332)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_3",
    icon_ui = "ActivityDungeon1017:Skill_10004_3",
    type = 13,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040324:3001:10000"
    },
    appear_pre = {78010330},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010333] = {
    id = 78010333,
    name = function()
      return T(80440333)
    end,
    des = function()
      return T(80450333)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10004_3",
    icon_ui = "ActivityDungeon1017:Skill_10004_3",
    type = 13,
    card_id = 78000103,
    damage_rate = 0,
    active_buff_list = {
      "78040325:3001:10000"
    },
    appear_pre = {78010330},
    appear_round = 6,
    level_max = 2,
    appear_prob = 100
  },
  [78010410] = {
    id = 78010410,
    name = function()
      return T(80440410)
    end,
    des = function()
      return T(80450410)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_1",
    icon_ui = "ActivityDungeon1017:Skill_10001_1",
    type = 1,
    card_id = 78000104,
    damage_rate = 3500,
    bullet_speed = 800,
    active_buff_list = {
      "78040401:3001:10000"
    },
    level_max = 1,
    total_f = 23,
    hurt_point = 12,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000101_skill1.prefab",
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000101_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 20
  },
  [78010411] = {
    id = 78010411,
    name = function()
      return T(80440411)
    end,
    des = function()
      return T(80450411)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_1",
    icon_ui = "ActivityDungeon1017:Skill_10001_1",
    type = 11,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040402:3001:10000"
    },
    appear_pre = {78010410},
    appear_round = 1,
    level_max = -1,
    appear_prob = 10
  },
  [78010412] = {
    id = 78010412,
    name = function()
      return T(80440412)
    end,
    des = function()
      return T(80450412)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_1",
    icon_ui = "ActivityDungeon1017:Skill_10001_1",
    type = 11,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040403:3001:10000"
    },
    appear_pre = {78010410},
    appear_round = 1,
    level_max = 2,
    appear_prob = 100
  },
  [78010413] = {
    id = 78010413,
    name = function()
      return T(80440413)
    end,
    des = function()
      return T(80450413)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_1",
    icon_ui = "ActivityDungeon1017:Skill_10001_1",
    type = 11,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040404:3001:10000"
    },
    appear_pre = {78010410},
    appear_round = 2,
    level_max = 1,
    appear_prob = 100
  },
  [78010420] = {
    id = 78010420,
    name = function()
      return T(80440420)
    end,
    des = function()
      return T(80450420)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_2",
    icon_ui = "ActivityDungeon1017:Skill_10001_2",
    type = 2,
    card_id = 78000104,
    trigger_condition = {1002},
    damage_rate = 3000,
    buff_list = {
      "78040411:1001:5000"
    },
    appear_round = 2,
    level_max = 1,
    appear_prob = 100
  },
  [78010421] = {
    id = 78010421,
    name = function()
      return T(80440421)
    end,
    des = function()
      return T(80450421)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_2",
    icon_ui = "ActivityDungeon1017:Skill_10001_2",
    type = 12,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040412:3001:10000"
    },
    appear_pre = {78010420},
    appear_round = 3,
    level_max = 1,
    appear_prob = 100
  },
  [78010422] = {
    id = 78010422,
    name = function()
      return T(80440422)
    end,
    des = function()
      return T(80450422)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_2",
    icon_ui = "ActivityDungeon1017:Skill_10001_2",
    type = 12,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040413:3001:10000"
    },
    appear_pre = {78010420},
    appear_round = 3,
    level_max = 2,
    appear_prob = 100
  },
  [78010423] = {
    id = 78010423,
    name = function()
      return T(80440423)
    end,
    des = function()
      return T(80450423)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_2",
    icon_ui = "ActivityDungeon1017:Skill_10001_2",
    type = 12,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040414:3001:10000"
    },
    appear_pre = {78010420},
    appear_round = 4,
    level_max = 1,
    appear_prob = 100
  },
  [78010430] = {
    id = 78010430,
    name = function()
      return T(80440430)
    end,
    des = function()
      return T(80450430)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_3",
    icon_ui = "ActivityDungeon1017:Skill_10001_3",
    type = 3,
    card_id = 78000104,
    trigger_condition = {1001},
    trigger_cd = 900,
    damage_rate = 40000,
    active_buff_list = {
      "78040421:3001:10000"
    },
    appear_round = 4,
    level_max = 1,
    appear_prob = 300
  },
  [78010431] = {
    id = 78010431,
    name = function()
      return T(80440431)
    end,
    des = function()
      return T(80450431)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_3",
    icon_ui = "ActivityDungeon1017:Skill_10001_3",
    type = 13,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040423:3001:10000"
    },
    appear_pre = {78010430},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010432] = {
    id = 78010432,
    name = function()
      return T(80440432)
    end,
    des = function()
      return T(80450432)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_3",
    icon_ui = "ActivityDungeon1017:Skill_10001_3",
    type = 13,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040424:3001:10000"
    },
    appear_pre = {78010430},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010433] = {
    id = 78010433,
    name = function()
      return T(80440433)
    end,
    des = function()
      return T(80450433)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10001_3",
    icon_ui = "ActivityDungeon1017:Skill_10001_3",
    type = 13,
    card_id = 78000104,
    damage_rate = 0,
    active_buff_list = {
      "78040425:3001:10000"
    },
    appear_pre = {78010430},
    appear_round = 6,
    level_max = 2,
    appear_prob = 100
  },
  [78010510] = {
    id = 78010510,
    name = function()
      return T(80440510)
    end,
    des = function()
      return T(80450510)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_1",
    icon_ui = "ActivityDungeon1017:Skill_10098_1",
    type = 1,
    card_id = 78000105,
    damage_rate = 6000,
    bullet_speed = 700,
    active_buff_list = {
      "78040501:3001:10000"
    },
    level_max = 1,
    total_f = 23,
    hurt_point = 15,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000198_skill1.prefab",
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000198_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 20
  },
  [78010511] = {
    id = 78010511,
    name = function()
      return T(80440511)
    end,
    des = function()
      return T(80450511)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_1",
    icon_ui = "ActivityDungeon1017:Skill_10098_1",
    type = 11,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040502:3001:10000"
    },
    appear_pre = {78010510},
    appear_round = 1,
    level_max = -1,
    appear_prob = 10
  },
  [78010512] = {
    id = 78010512,
    name = function()
      return T(80440512)
    end,
    des = function()
      return T(80450512)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_1",
    icon_ui = "ActivityDungeon1017:Skill_10098_1",
    type = 11,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040503:3001:10000"
    },
    appear_pre = {78010510},
    appear_round = 1,
    level_max = 2,
    appear_prob = 100
  },
  [78010513] = {
    id = 78010513,
    name = function()
      return T(80440513)
    end,
    des = function()
      return T(80450513)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_1",
    icon_ui = "ActivityDungeon1017:Skill_10098_1",
    type = 11,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040504:3001:10000"
    },
    appear_pre = {78010510},
    appear_round = 2,
    level_max = 1,
    appear_prob = 100
  },
  [78010520] = {
    id = 78010520,
    name = function()
      return T(80440520)
    end,
    des = function()
      return T(80450520)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_2",
    icon_ui = "ActivityDungeon1017:Skill_10098_2",
    type = 2,
    card_id = 78000105,
    damage_rate = 3000,
    active_buff_list = {
      "78040511:3001:10000"
    },
    range_type = 1,
    range_x = 30,
    range_y = 30,
    appear_round = 2,
    level_max = 1,
    appear_prob = 100,
    effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000198_skill2.prefab"
  },
  [78010521] = {
    id = 78010521,
    name = function()
      return T(80440521)
    end,
    des = function()
      return T(80450521)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_2",
    icon_ui = "ActivityDungeon1017:Skill_10098_2",
    type = 12,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040513:3001:10000"
    },
    appear_pre = {78010520},
    appear_round = 3,
    level_max = 1,
    appear_prob = 100
  },
  [78010522] = {
    id = 78010522,
    name = function()
      return T(80440522)
    end,
    des = function()
      return T(80450522)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_2",
    icon_ui = "ActivityDungeon1017:Skill_10098_2",
    type = 12,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040514:3001:10000"
    },
    appear_pre = {78010520},
    appear_round = 3,
    level_max = 2,
    appear_prob = 100
  },
  [78010523] = {
    id = 78010523,
    name = function()
      return T(80440523)
    end,
    des = function()
      return T(80450523)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_2",
    icon_ui = "ActivityDungeon1017:Skill_10098_2",
    type = 12,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040515:3001:10000"
    },
    appear_pre = {78010520},
    appear_round = 4,
    level_max = 1,
    appear_prob = 100
  },
  [78010530] = {
    id = 78010530,
    name = function()
      return T(80440530)
    end,
    des = function()
      return T(80450530)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_3",
    icon_ui = "ActivityDungeon1017:Skill_10098_3",
    type = 3,
    card_id = 78000105,
    trigger_condition = {1001},
    trigger_cd = 900,
    damage_rate = 0,
    buff_list = {
      "78040521:3004:10000",
      "78040522:3004:10000"
    },
    appear_round = 4,
    level_max = 1,
    appear_prob = 300
  },
  [78010531] = {
    id = 78010531,
    name = function()
      return T(80440531)
    end,
    des = function()
      return T(80450531)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_3",
    icon_ui = "ActivityDungeon1017:Skill_10098_3",
    type = 13,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040523:3003:10000"
    },
    appear_pre = {78010530},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010532] = {
    id = 78010532,
    name = function()
      return T(80440532)
    end,
    des = function()
      return T(80450532)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_3",
    icon_ui = "ActivityDungeon1017:Skill_10098_3",
    type = 13,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040524:3004:10000"
    },
    appear_pre = {78010530},
    appear_round = 5,
    level_max = 1,
    appear_prob = 100
  },
  [78010533] = {
    id = 78010533,
    name = function()
      return T(80440533)
    end,
    des = function()
      return T(80450533)
    end,
    icon = "ActivityDungeon1017Battle:Skill_10098_3",
    icon_ui = "ActivityDungeon1017:Skill_10098_3",
    type = 13,
    card_id = 78000105,
    damage_rate = 0,
    active_buff_list = {
      "78040525:3004:10000"
    },
    appear_pre = {78010530},
    appear_round = 6,
    level_max = 2,
    appear_prob = 100
  },
  [78020110] = {
    id = 78020110,
    type = 1,
    damage_rate = 10000,
    level_max = 1,
    total_f = 23,
    hurt_point = 12
  },
  [78020210] = {
    id = 78020210,
    type = 1,
    damage_rate = 10000,
    level_max = 1,
    total_f = 20,
    hurt_point = 12
  },
  [78020310] = {
    id = 78020310,
    type = 1,
    damage_rate = 10000,
    bullet_speed = 1000,
    level_max = 1,
    total_f = 24,
    hurt_point = 9,
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_20010_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 10
  },
  [78020410] = {
    id = 78020410,
    type = 1,
    damage_rate = 10000,
    bullet_speed = 1000,
    level_max = 1,
    total_f = 23,
    hurt_point = 18,
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_20306_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 10
  },
  [78020510] = {
    id = 78020510,
    type = 1,
    damage_rate = 10000,
    level_max = 1,
    total_f = 21,
    hurt_point = 9
  },
  [78020610] = {
    id = 78020610,
    type = 1,
    damage_rate = 10000,
    bullet_speed = 1000,
    level_max = 1,
    total_f = 18,
    hurt_point = 9,
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_20108_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 10
  },
  [78020710] = {
    id = 78020710,
    type = 1,
    damage_rate = 10000,
    bullet_speed = 1000,
    level_max = 1,
    total_f = 23,
    hurt_point = 12,
    bullet_effect = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_20411_skill1_bullet.prefab",
    bullet_scale = 10000,
    bullet_size = 10
  }
}
