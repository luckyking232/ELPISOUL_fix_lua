BaseSkillBuffEffect = {
  [1] = {id = 1},
  [101] = {id = 101, attribute_id = 40000101},
  [102] = {id = 102, attribute_id = 40000101},
  [103] = {
    id = 103,
    attribute_id = 40000101,
    def = 1,
    element_type = {2},
    restraint_add3 = 3000,
    show_type = 2,
    icon_path = "BuffIcon:103",
    icon_priority = 150,
    effect_path = "battle/FX_battle_normal_burn.prefab",
    effect_tag = {1}
  },
  [104] = {
    id = 104,
    attribute_id = 40000101,
    def = 1,
    element_type = {1},
    restraint_add2 = 3000,
    show_type = 2,
    icon_path = "BuffIcon:104",
    icon_priority = 150,
    effect_path = "battle/FX_battle_normal_damage_water.prefab",
    effect_tag = {1}
  },
  [105] = {
    id = 105,
    attribute_id = 40000101,
    def = 1,
    element_type = {1},
    restraint_add2 = 3000,
    show_type = 2,
    icon_path = "BuffIcon:105",
    icon_priority = 150,
    effect_path = "battle/FX_battle_normal_damage_ice.prefab",
    effect_tag = {1}
  },
  [106] = {id = 106, attribute_id = 40000101},
  [107] = {
    id = 107,
    attribute_id = 40000101,
    def = 1
  },
  [108] = {
    id = 108,
    attribute_id = 40000101,
    def = 1,
    element_type = {5},
    restraint_add4 = 3000,
    show_type = 2,
    icon_path = "BuffIcon:108",
    icon_priority = 150,
    effect_path = "battle/FX_battle_normal_damage_light.prefab",
    effect_tag = {1}
  },
  [109] = {
    id = 109,
    attribute_id = 40000101,
    def = 1,
    element_type = {4},
    restraint_add5 = 3000,
    show_type = 2,
    icon_path = "BuffIcon:109",
    icon_priority = 150,
    effect_path = "battle/FX_battle_normal_damage_dark.prefab",
    effect_tag = {1}
  },
  [110] = {
    id = 110,
    attribute_id = 40000101,
    def = 1,
    element_type = {3},
    restraint_add1 = 3000,
    show_type = 2,
    icon_path = "BuffIcon:110",
    icon_priority = 150,
    effect_path = "battle/FX_battle_normal_damage_wood.prefab",
    effect_tag = {1}
  },
  [111] = {
    id = 111,
    attribute_id = 40000101,
    def = 1
  },
  [112] = {id = 112, attribute_id = 40000101},
  [113] = {
    id = 113,
    attribute_id = 40000101,
    def = 1,
    element_type = {3},
    restraint_add1 = 3000
  },
  [115] = {
    id = 115,
    attribute_id = 40000101,
    def = 1
  },
  [119] = {id = 119},
  [120] = {
    id = 120,
    attribute_id = 40000101,
    show_type = 1,
    icon_path = "BuffIcon:120",
    icon_priority = 201,
    effect_tag = {5}
  },
  [121] = {id = 121},
  [122] = {
    id = 122,
    show_type = 1,
    icon_path = "BuffIcon:122",
    icon_priority = 201,
    effect_tag = {5}
  },
  [123] = {id = 123},
  [124] = {id = 124},
  [125] = {id = 125, attribute_id = 40000101},
  [126] = {id = 126, attribute_id = 40000101},
  [127] = {id = 127, attribute_id = 40000101},
  [128] = {id = 128, attribute_id = 40000101},
  [131] = {id = 131},
  [132] = {id = 132},
  [133] = {id = 133},
  [134] = {id = 134},
  [135] = {
    id = 135,
    words_path = "Battle:buff_702",
    show_type = 1,
    icon_path = "BuffIcon:614",
    icon_priority = 101,
    effect_tag = {5},
    words_txt = function()
      return T(80002702)
    end,
    words_type = 2
  },
  [142] = {id = 142, attribute_id = 40000101},
  [301] = {
    id = 301,
    attribute_id = 40000101,
    treat_add = 1
  },
  [302] = {
    id = 302,
    attribute_id = 40000101,
    treat_add = 1
  },
  [303] = {
    id = 303,
    attribute_id = 40000101,
    treat_add = 1,
    show_type = 1,
    icon_path = "BuffIcon:303",
    icon_priority = 200,
    effect_tag = {5}
  },
  [304] = {
    id = 304,
    attribute_id = 40000101,
    treat_add = 1
  },
  [305] = {
    id = 305,
    attribute_id = 40000101,
    words_path = "Battle:buff_305",
    words_txt = function()
      return T(80002305)
    end,
    words_type = 0
  },
  [306] = {id = 306, attribute_id = 40000101},
  [307] = {
    id = 307,
    attribute_id = 40000101,
    treat_add = 1,
    show_type = 1,
    icon_path = "BuffIcon:303",
    icon_priority = 200,
    effect_tag = {5}
  },
  [308] = {id = 308, attribute_id = 40000101},
  [311] = {
    id = 311,
    show_type = 1,
    icon_path = "BuffIcon:311",
    icon_priority = 10
  },
  [401] = {id = 401, attribute_id = 40000306},
  [402] = {
    id = 402,
    words_path = "Battle:buff_402",
    show_type = 1,
    icon_path = "BuffIcon:402",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002402)
    end,
    words_type = 0
  },
  [403] = {
    id = 403,
    show_type = 1,
    icon_path = "BuffIcon:403",
    icon_priority = 201,
    effect_path = "battle/FX_battle_normal_invincible.prefab",
    effect_tag = {5}
  },
  [404] = {id = 404},
  [405] = {
    id = 405,
    control_type = {
      201,
      202,
      203
    },
    words_path = "Battle:buff_405",
    show_type = 1,
    icon_path = "BuffIcon:405",
    icon_priority = 10
  },
  [406] = {
    id = 406,
    words_path = "Battle:buff_406",
    show_type = 1,
    icon_path = "BuffIcon:406",
    icon_priority = 10,
    words_txt = function()
      return T(80002406)
    end,
    words_type = 0
  },
  [413] = {
    id = 413,
    attribute_id = 40000602,
    effect_tag = {7}
  },
  [416] = {
    id = 416,
    show_type = 1,
    icon_path = "BuffIcon:416",
    icon_priority = 201
  },
  [417] = {
    id = 417,
    show_type = 1,
    icon_path = "BuffIcon:417",
    icon_priority = 10
  },
  [419] = {
    id = 419,
    show_type = 1,
    icon_path = "BuffIcon:419",
    icon_priority = 201
  },
  [420] = {
    id = 420,
    show_type = 1,
    icon_path = "BuffIcon:420",
    icon_priority = 10
  },
  [421] = {
    id = 421,
    show_type = 1,
    icon_path = "BuffIcon:421",
    icon_priority = 10
  },
  [501] = {
    id = 501,
    control_type = {
      201,
      202,
      203,
      204,
      206
    },
    delay_frame_settle = 1,
    words_path = "Battle:buff_501",
    show_type = 2,
    icon_path = "BuffIcon:501",
    icon_priority = 100,
    effect_path = "battle/FX_battle_normal_dizzy.prefab",
    effect_bind_name = "DizzyBuffPoint",
    effect_tag = {2, 4},
    words_txt = function()
      return T(80002501)
    end,
    words_type = 0
  },
  [502] = {
    id = 502,
    control_type = {203, 206},
    delay_frame_settle = 1,
    words_path = "Battle:buff_502",
    show_type = 2,
    icon_path = "BuffIcon:502",
    icon_priority = 100,
    effect_path = "battle/FX_battle_normal_silent.prefab",
    effect_bind_name = "HeadBuffPoint",
    effect_tag = {2},
    words_txt = function()
      return T(80002502)
    end,
    words_type = 0
  },
  [503] = {
    id = 503,
    control_type = {
      202,
      203,
      204,
      206
    },
    delay_frame_settle = 1,
    words_path = "Battle:buff_503",
    show_type = 2,
    icon_path = "BuffIcon:503",
    icon_priority = 100,
    effect_tag = {2, 4},
    words_txt = function()
      return T(80002503)
    end,
    words_type = 0
  },
  [504] = {id = 504},
  [505] = {id = 505},
  [506] = {
    id = 506,
    words_path = "Battle:buff_506",
    show_type = 2,
    icon_path = "BuffIcon:506",
    icon_priority = 100,
    effect_path = "battle/FX_battle_normal_taunt.prefab",
    effect_bind_name = "HeadBuffPoint",
    effect_tag = {2},
    words_txt = function()
      return T(80002506)
    end,
    words_type = 0
  },
  [507] = {id = 507},
  [508] = {
    id = 508,
    words_path = "Battle:buff_508",
    show_type = 2,
    icon_path = "BuffIcon:508",
    icon_priority = 100,
    effect_path = "battle/FX_battle_normal_blind.prefab",
    effect_bind_name = "HeadBuffPoint",
    effect_tag = {2},
    words_txt = function()
      return T(80002508)
    end,
    words_type = 0
  },
  [510] = {
    id = 510,
    control_type = {
      202,
      203,
      204,
      206
    },
    delay_frame_settle = 1,
    words_path = "Battle:buff_510",
    show_type = 2,
    icon_path = "BuffIcon:510",
    icon_priority = 100,
    effect_tag = {2, 4},
    words_txt = function()
      return T(80002510)
    end,
    words_type = 0
  },
  [511] = {
    id = 511,
    control_type = {
      202,
      203,
      206
    },
    delay_frame_settle = 1,
    words_path = "Battle:buff_511",
    show_type = 2,
    icon_path = "BuffIcon:511",
    icon_priority = 100,
    effect_path = "battle/FX_battle_normal_charm.prefab",
    effect_bind_name = "HeadBuffPoint",
    effect_tag = {2},
    words_txt = function()
      return T(80002511)
    end,
    words_type = 0
  },
  [512] = {
    id = 512,
    effect_tag = {6}
  },
  [513] = {
    id = 513,
    attribute_id = 40000301,
    control_type = {204},
    words_path = "Battle:buff_513",
    effect_tag = {2},
    words_txt = function()
      return T(80002513)
    end,
    words_type = 0
  },
  [514] = {
    id = 514,
    effect_path = "31004/FX_31004_skill_buff.prefab"
  },
  [515] = {
    id = 515,
    effect_tag = {6}
  },
  [516] = {
    id = 516,
    control_type = {
      201,
      202,
      203
    },
    show_type = 2,
    icon_path = "BuffIcon:buff_1103",
    icon_priority = 10,
    effect_tag = {6}
  },
  [517] = {
    id = 517,
    attribute_id = 40000101,
    show_type = 2,
    icon_path = "BuffIcon:buff_1103",
    icon_priority = 10
  },
  [518] = {id = 518},
  [519] = {id = 519},
  [520] = {id = 520},
  [522] = {id = 522},
  [523] = {id = 523},
  [524] = {id = 524},
  [525] = {id = 525},
  [526] = {
    id = 526,
    control_type = {
      201,
      202,
      203,
      204,
      206
    },
    delay_frame_settle = 1,
    words_path = "Battle:buff_501",
    show_type = 2,
    icon_path = "BuffIcon:526",
    icon_priority = 100,
    effect_path = "battle/FX_battle_normal_dizzy.prefab",
    effect_bind_name = "DizzyBuffPoint",
    words_txt = function()
      return T(80002501)
    end,
    words_type = 0
  },
  [527] = {
    id = 527,
    control_type = {
      201,
      202,
      203,
      204,
      207
    },
    delay_frame_settle = 1
  },
  [528] = {
    id = 528,
    attribute_id = 40000103,
    show_type = 1,
    icon_path = "BuffIcon:1104",
    icon_priority = 10
  },
  [534] = {
    id = 534,
    control_type = {
      202,
      203,
      204,
      206
    },
    delay_frame_settle = 1,
    words_path = "Battle:buff_534",
    show_type = 2,
    icon_path = "BuffIcon:534",
    icon_priority = 100,
    effect_tag = {2, 4},
    words_txt = function()
      return T(80002534)
    end,
    words_type = 0
  },
  [538] = {
    id = 538,
    show_type = 1,
    icon_path = "BuffIcon:538",
    icon_priority = 201
  },
  [539] = {
    id = 539,
    control_type = {206},
    words_path = "Battle:buff_539",
    show_type = 1,
    icon_path = "BuffIcon:539",
    icon_priority = 10,
    words_txt = function()
      return T(80002539)
    end,
    words_type = 0
  },
  [540] = {id = 540},
  [548] = {
    id = 548,
    words_path = "Battle:buff_548",
    show_type = 2,
    icon_path = "BuffIcon:548",
    icon_priority = 100,
    effect_path = "10097/FX_10097_skill_buff.prefab",
    effect_bind_name = "HeadBuffPoint",
    effect_tag = {2},
    words_txt = function()
      return T(80002548)
    end,
    words_type = 0
  },
  [544] = {
    id = 544,
    words_path = "Battle:buff_544",
    show_type = 2,
    icon_path = "BuffIcon:544",
    icon_priority = 100,
    effect_path = "20016/FX_20016_skill2_2_target.prefab"
  },
  [601] = {
    id = 601,
    attribute_id = 40000316,
    words_path = "Battle:buff_601",
    show_type = 1,
    icon_path = "BuffIcon:601",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002601)
    end,
    words_type = 1
  },
  [602] = {
    id = 602,
    attribute_id = 40000103,
    words_path = "Battle:buff_602",
    show_type = 1,
    icon_path = "BuffIcon:602",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002602)
    end,
    words_type = 1
  },
  [603] = {
    id = 603,
    attribute_id = 40000501,
    words_path = "Battle:buff_603",
    show_type = 1,
    icon_path = "BuffIcon:603",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002603)
    end,
    words_type = 1
  },
  [604] = {
    id = 604,
    attribute_id = 40000502,
    words_path = "Battle:buff_604",
    show_type = 1,
    icon_path = "BuffIcon:604",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002604)
    end,
    words_type = 1
  },
  [605] = {
    id = 605,
    attribute_id = 40000104,
    words_path = "Battle:buff_605",
    show_type = 1,
    icon_path = "BuffIcon:605",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002605)
    end,
    words_type = 1
  },
  [606] = {
    id = 606,
    attribute_id = 40000306,
    effect_tag = {7}
  },
  [607] = {
    id = 607,
    attribute_id = 40000202,
    words_path = "Battle:buff_607",
    show_type = 1,
    icon_path = "BuffIcon:607",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002607)
    end,
    words_type = 1
  },
  [608] = {id = 608, attribute_id = 40000102},
  [609] = {id = 609, attribute_id = 40000101},
  [610] = {id = 610, attribute_id = 40000102},
  [611] = {
    id = 611,
    attribute_id = 40000201,
    words_path = "Battle:buff_611",
    show_type = 1,
    icon_path = "BuffIcon:611",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002611)
    end,
    words_type = 1
  },
  [614] = {
    id = 614,
    attribute_id = 40000411,
    words_path = "Battle:buff_614",
    show_type = 1,
    icon_path = "BuffIcon:614",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002614)
    end,
    words_type = 1
  },
  [615] = {
    id = 615,
    attribute_id = 40000412,
    words_path = "Battle:buff_615",
    show_type = 1,
    icon_path = "BuffIcon:615",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002615)
    end,
    words_type = 1
  },
  [616] = {id = 616},
  [619] = {
    id = 619,
    attribute_id = 40000204,
    words_path = "Battle:buff_619",
    show_type = 1,
    icon_path = "BuffIcon:619",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002619)
    end,
    words_type = 1
  },
  [620] = {
    id = 620,
    attribute_id = 40000203,
    words_path = "Battle:buff_620",
    show_type = 1,
    icon_path = "BuffIcon:620",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002620)
    end,
    words_type = 1
  },
  [621] = {
    id = 621,
    attribute_id = 40000205,
    words_path = "Battle:buff_621",
    show_type = 1,
    icon_path = "BuffIcon:521",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002621)
    end,
    words_type = 1
  },
  [623] = {id = 623},
  [624] = {id = 624},
  [625] = {id = 625},
  [626] = {id = 626},
  [627] = {id = 627},
  [628] = {id = 628},
  [629] = {id = 629},
  [630] = {id = 630},
  [631] = {id = 631},
  [632] = {id = 632},
  [633] = {
    id = 633,
    attribute_id = 40000315,
    words_path = "Battle:buff_640",
    show_type = 1,
    icon_path = "BuffIcon:640",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002640)
    end,
    words_type = 1
  },
  [634] = {id = 634},
  [635] = {id = 635},
  [636] = {id = 636},
  [637] = {
    id = 637,
    attribute_id = 40000303,
    words_path = "Battle:buff_637",
    show_type = 1,
    icon_path = "BuffIcon:637",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002637)
    end,
    words_type = 1
  },
  [638] = {id = 638},
  [639] = {
    id = 639,
    effect_path = "battle/FX_battle_normal_immunity.prefab"
  },
  [640] = {
    id = 640,
    attribute_id = 40000301,
    words_path = "Battle:buff_640",
    show_type = 1,
    icon_path = "BuffIcon:640",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002640)
    end,
    words_type = 1
  },
  [641] = {id = 641},
  [642] = {id = 642},
  [644] = {
    id = 644,
    show_type = 1,
    icon_path = "BuffIcon:614",
    icon_priority = 201,
    effect_tag = {5}
  },
  [645] = {
    id = 645,
    show_type = 1,
    icon_path = "BuffIcon:615",
    icon_priority = 201,
    effect_tag = {5}
  },
  [646] = {
    id = 646,
    words_path = "Battle:buff_646",
    show_type = 1,
    icon_path = "BuffIcon:646",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002646)
    end,
    words_type = 1
  },
  [647] = {
    id = 647,
    words_path = "Battle:buff_647",
    show_type = 1,
    icon_path = "BuffIcon:647",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002647)
    end,
    words_type = 1
  },
  [648] = {
    id = 648,
    words_path = "Battle:buff_648",
    show_type = 1,
    icon_path = "BuffIcon:650",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002648)
    end,
    words_type = 1
  },
  [649] = {
    id = 649,
    words_path = "Battle:buff_649",
    show_type = 1,
    icon_path = "BuffIcon:650",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002649)
    end,
    words_type = 1
  },
  [650] = {
    id = 650,
    words_path = "Battle:buff_650",
    show_type = 1,
    icon_path = "BuffIcon:650",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002650)
    end,
    words_type = 1
  },
  [651] = {
    id = 651,
    show_type = 1,
    icon_path = "BuffIcon:122",
    icon_priority = 201,
    effect_tag = {5}
  },
  [652] = {id = 652},
  [653] = {
    id = 653,
    attribute_id = 40000601,
    effect_tag = {7}
  },
  [654] = {id = 654, attribute_id = 40000601},
  [655] = {id = 655},
  [658] = {
    id = 658,
    words_path = "Battle:buff_650",
    show_type = 1,
    icon_path = "BuffIcon:650",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002650)
    end,
    words_type = 1
  },
  [660] = {id = 660},
  [661] = {
    id = 661,
    words_path = "Battle:buff_614",
    show_type = 1,
    icon_path = "BuffIcon:614",
    icon_priority = 201,
    effect_tag = {5},
    words_txt = function()
      return T(80002661)
    end,
    words_type = 1
  },
  [701] = {
    id = 701,
    attribute_id = 40000316,
    words_path = "Battle:buff_701",
    show_type = 2,
    icon_path = "BuffIcon:701",
    icon_priority = 101,
    words_txt = function()
      return T(80002701)
    end,
    words_type = 2
  },
  [702] = {
    id = 702,
    attribute_id = 40000103,
    words_path = "Battle:buff_702",
    show_type = 2,
    icon_path = "BuffIcon:702",
    icon_priority = 101,
    effect_tag = {8},
    words_txt = function()
      return T(80002702)
    end,
    words_type = 2
  },
  [703] = {
    id = 703,
    attribute_id = 40000104,
    words_path = "Battle:buff_703",
    show_type = 2,
    icon_path = "BuffIcon:703",
    icon_priority = 101,
    effect_tag = {3},
    words_txt = function()
      return T(80002703)
    end,
    words_type = 2
  },
  [704] = {
    id = 704,
    attribute_id = 40000502,
    words_path = "Battle:buff_704",
    show_type = 2,
    icon_path = "BuffIcon:704",
    icon_priority = 101,
    words_txt = function()
      return T(80002704)
    end,
    words_type = 2
  },
  [706] = {
    id = 706,
    attribute_id = 40000301,
    words_path = "Battle:buff_706",
    show_type = 2,
    icon_path = "BuffIcon:706",
    icon_priority = 101,
    words_txt = function()
      return T(80002706)
    end,
    words_type = 2
  },
  [707] = {
    id = 707,
    show_type = 2,
    icon_path = "BuffIcon:710",
    icon_priority = 101
  },
  [709] = {
    id = 709,
    attribute_id = 40000411,
    show_type = 2,
    icon_path = "BuffIcon:709",
    icon_priority = 101
  },
  [710] = {
    id = 710,
    show_type = 2,
    icon_path = "BuffIcon:710",
    icon_priority = 101
  },
  [711] = {id = 711, attribute_id = 40000102},
  [712] = {id = 712, attribute_id = 40000101},
  [713] = {
    id = 713,
    attribute_id = 40000407,
    show_type = 2,
    icon_path = "BuffIcon:713",
    icon_priority = 101
  },
  [714] = {
    id = 714,
    attribute_id = 40000408,
    show_type = 2,
    icon_path = "BuffIcon:714",
    icon_priority = 101
  },
  [715] = {
    id = 715,
    attribute_id = 40000406,
    show_type = 2,
    icon_path = "BuffIcon:715",
    icon_priority = 101
  },
  [716] = {
    id = 716,
    attribute_id = 40000410,
    show_type = 2,
    icon_path = "BuffIcon:716",
    icon_priority = 101
  },
  [717] = {
    id = 717,
    attribute_id = 40000409,
    show_type = 2,
    icon_path = "BuffIcon:717",
    icon_priority = 101
  },
  [718] = {id = 718},
  [719] = {
    id = 719,
    attribute_id = 40000316,
    words_path = "Battle:buff_701",
    show_type = 2,
    icon_path = "BuffIcon:701",
    icon_priority = 101,
    words_txt = function()
      return T(80002701)
    end,
    words_type = 2
  },
  [720] = {
    id = 720,
    show_type = 2,
    icon_path = "BuffIcon:720",
    icon_priority = 101
  },
  [801] = {id = 801, attribute_id = 40000309},
  [802] = {id = 802, attribute_id = 40000308},
  [803] = {id = 803, attribute_id = 40000308},
  [901] = {
    id = 901,
    show_type = 2,
    icon_path = "BuffIcon:901",
    icon_priority = 10
  },
  [1004] = {
    id = 1004,
    show_type = 2,
    icon_path = "BuffIcon:1004",
    icon_priority = 10,
    effect_path = "battle/FX_battle_normal_damage_ice.prefab"
  },
  [1005] = {
    id = 1005,
    attribute_id = 40000104,
    show_type = 2,
    icon_path = "BuffIcon:1005",
    icon_priority = 10,
    effect_tag = {3}
  },
  [1006] = {
    id = 1006,
    show_type = 1,
    icon_path = "BuffIcon:1006",
    icon_priority = 10
  },
  [1007] = {
    id = 1007,
    attribute_id = 40000103,
    show_type = 1,
    icon_path = "BuffIcon:1007",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1008] = {
    id = 1008,
    show_type = 2,
    icon_path = "BuffIcon:1008",
    icon_priority = 10
  },
  [1009] = {
    id = 1009,
    show_type = 1,
    icon_path = "BuffIcon:1009",
    icon_priority = 10
  },
  [1010] = {
    id = 1010,
    show_type = 1,
    icon_path = "BuffIcon:1010",
    icon_priority = 10
  },
  [1012] = {
    id = 1012,
    show_type = 1,
    icon_path = "BuffIcon:419",
    icon_priority = 10
  },
  [1013] = {
    id = 1013,
    show_type = 2,
    icon_path = "BuffIcon:1013",
    icon_priority = 10
  },
  [1014] = {
    id = 1014,
    show_type = 1,
    icon_path = "BuffIcon:1014",
    icon_priority = 10
  },
  [1015] = {
    id = 1015,
    show_type = 1,
    icon_path = "BuffIcon:1015",
    icon_priority = 10
  },
  [1016] = {
    id = 1016,
    show_type = 1,
    icon_path = "BuffIcon:1016",
    icon_priority = 10
  },
  [1020] = {
    id = 1020,
    show_type = 2,
    icon_path = "BuffIcon:1020",
    icon_priority = 10
  },
  [1021] = {
    id = 1021,
    show_type = 1,
    icon_path = "BuffIcon:1021",
    icon_priority = 10
  },
  [1023] = {
    id = 1023,
    show_type = 1,
    icon_path = "BuffIcon:1023",
    icon_priority = 10
  },
  [1024] = {
    id = 1024,
    show_type = 1,
    icon_path = "BuffIcon:1024",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1025] = {
    id = 1025,
    attribute_id = 40000103,
    show_type = 1,
    icon_path = "BuffIcon:1025",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1027] = {
    id = 1027,
    show_type = 1,
    icon_path = "BuffIcon:1027",
    icon_priority = 10
  },
  [1028] = {
    id = 1028,
    show_type = 1,
    icon_path = "BuffIcon:1028",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1029] = {
    id = 1029,
    show_type = 1,
    icon_path = "BuffIcon:1029",
    icon_priority = 10
  },
  [1031] = {
    id = 1031,
    show_type = 1,
    icon_path = "BuffIcon:1031",
    icon_priority = 10
  },
  [1032] = {
    id = 1032,
    show_type = 1,
    icon_path = "BuffIcon:1032",
    icon_priority = 10
  },
  [1033] = {
    id = 1033,
    show_type = 1,
    icon_path = "BuffIcon:1033",
    icon_priority = 10
  },
  [1040] = {
    id = 1040,
    show_type = 1,
    icon_path = "BuffIcon:1040",
    icon_priority = 10
  },
  [1041] = {
    id = 1041,
    attribute_id = 40000103,
    show_type = 1,
    icon_path = "BuffIcon:1041",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1042] = {id = 1042},
  [1043] = {
    id = 1043,
    show_type = 1,
    icon_path = "BuffIcon:1043",
    icon_priority = 10
  },
  [1045] = {
    id = 1045,
    show_type = 2,
    icon_path = "BuffIcon:1045",
    icon_priority = 150
  },
  [1046] = {
    id = 1046,
    show_type = 1,
    icon_path = "BuffIcon:1046",
    icon_priority = 10
  },
  [1048] = {
    id = 1048,
    show_type = 1,
    icon_path = "BuffIcon:1048",
    icon_priority = 10
  },
  [1101] = {
    id = 1101,
    show_type = 2,
    icon_path = "BuffIcon:buff_1103",
    icon_priority = 10,
    effect_path = "20511/FX_20511_point.prefab"
  },
  [1102] = {id = 1102},
  [1103] = {id = 1103, attribute_id = 40000103},
  [1106] = {
    id = 1106,
    show_type = 1,
    icon_path = "BuffIcon:615",
    icon_priority = 10
  },
  [1107] = {
    id = 1107,
    control_type = {
      201,
      202,
      203,
      204
    },
    show_type = 2,
    icon_path = "BuffIcon:buff_1103",
    icon_priority = 10
  },
  [1108] = {id = 1108, attribute_id = 40000301},
  [1109] = {
    id = 1109,
    control_type = {201},
    delay_frame_settle = 1
  },
  [1110] = {
    id = 1110,
    show_type = 2,
    icon_path = "BuffIcon:1104",
    icon_priority = 10
  },
  [1111] = {
    id = 1111,
    attribute_id = 40000316,
    show_type = 2,
    icon_path = "BuffIcon:1103",
    icon_priority = 10
  },
  [1112] = {
    id = 1112,
    attribute_id = 40000103,
    effect_tag = {8}
  },
  [1113] = {
    id = 1113,
    show_type = 2,
    icon_path = "BuffIcon:1113",
    icon_priority = 10
  },
  [1114] = {
    id = 1114,
    show_type = 1,
    icon_path = "BuffIcon:615",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1115] = {
    id = 1115,
    attribute_id = 40000101,
    def = 1,
    element_type = {2},
    restraint_add3 = 3000,
    show_type = 2,
    icon_path = "BuffIcon:103",
    icon_priority = 150,
    effect_path = "battle/FX_battle_normal_burn.prefab",
    effect_tag = {1}
  },
  [1116] = {
    id = 1116,
    attribute_id = 40000316,
    show_type = 2,
    icon_path = "BuffIcon:701",
    icon_priority = 101
  },
  [1117] = {
    id = 1117,
    attribute_id = 40000104,
    show_type = 2,
    icon_path = "BuffIcon:703",
    icon_priority = 101,
    effect_tag = {3}
  },
  [1118] = {
    id = 1118,
    attribute_id = 40000104,
    show_type = 2,
    icon_path = "BuffIcon:1118",
    icon_priority = 10,
    effect_path = "20906/FX_20906_buff.prefab",
    effect_tag = {3}
  },
  [1119] = {
    id = 1119,
    attribute_id = 40000104,
    show_type = 2,
    icon_path = "BuffIcon:1119",
    icon_priority = 10,
    effect_path = "20017/FX_20017_buff.prefab",
    effect_tag = {3}
  },
  [1120] = {
    id = 1120,
    show_type = 1,
    icon_path = "BuffIcon:1120",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1121] = {
    id = 1121,
    show_type = 2,
    icon_path = "BuffIcon:1121",
    icon_priority = 10,
    effect_path = "20908/FX_20908_skill2_2_buff.prefab"
  },
  [1122] = {
    id = 1122,
    show_type = 2,
    icon_path = "BuffIcon:1122",
    icon_priority = 10,
    effect_path = "20908/FX_20908_skill2_2_buff.prefab"
  },
  [1123] = {
    id = 1123,
    attribute_id = 40000103,
    show_type = 1,
    icon_path = "BuffIcon:602",
    icon_priority = 201
  },
  [1124] = {
    id = 1124,
    attribute_id = 40000412,
    words_path = "Battle:buff_615",
    show_type = 1,
    icon_path = "BuffIcon:615",
    icon_priority = 201,
    words_txt = function()
      return T(80002615)
    end,
    words_type = 1
  },
  [1125] = {
    id = 1125,
    show_type = 2,
    icon_path = "BuffIcon:1125",
    icon_priority = 10
  },
  [1126] = {
    id = 1126,
    show_type = 1,
    icon_path = "BuffIcon:614",
    icon_priority = 10,
    effect_tag = {5}
  },
  [1127] = {
    id = 1127,
    show_type = 2,
    icon_path = "BuffIcon:1127",
    icon_priority = 10
  },
  [1201] = {
    id = 1201,
    show_type = 2,
    icon_path = "BuffIcon:1201",
    icon_priority = 10
  },
  [1202] = {id = 1202},
  [1203] = {
    id = 1203,
    warn_effect = "1:30:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
  },
  [1204] = {
    id = 1204,
    show_type = 1,
    icon_path = "BuffIcon:1204",
    icon_priority = 201,
    effect_tag = {5}
  },
  [10101] = {id = 10101},
  [10102] = {id = 10102}
}
