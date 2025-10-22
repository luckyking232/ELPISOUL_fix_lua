BasePlotDialogPart520450 = {
  [2041001001] = {
    id = 2041001001,
    talk_text = function()
      return T_S(20410010010)
    end,
    next_dialog = 2041001002,
    env_sound = 20004,
    open_title_1 = function()
      return T_S(20410010018)
    end,
    open_title_2 = function()
      return T_S(20410010019)
    end
  },
  [2041001002] = {
    id = 2041001002,
    talk_text = function()
      return T_S(20410010020)
    end,
    next_dialog = 2041001003,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410010025)
    end,
    env_sound = 20004
  },
  [2041001003] = {
    id = 2041001003,
    talk_text = function()
      return T_S(20410010030)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041001004,
    speak_name = function()
      return T_S(20410010035)
    end,
    env_sound = 20004
  },
  [2041001004] = {
    id = 2041001004,
    talk_text = function()
      return T_S(20410010040)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041001005,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410010045)
    end,
    env_sound = 20004
  },
  [2041001005] = {
    id = 2041001005,
    talk_text = function()
      return T_S(20410010050)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041001006,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410010055)
    end,
    env_sound = 20004
  },
  [2041001006] = {
    id = 2041001006,
    talk_text = function()
      return T_S(20410010060)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041001007,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410010065)
    end,
    env_sound = 20004
  },
  [2041001007] = {
    id = 2041001007,
    talk_text = function()
      return T_S(20410010070)
    end,
    role_ids = {90110031, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1011", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041001008,
    speak_name = function()
      return T_S(20410010075)
    end,
    env_sound = 20004
  },
  [2041001008] = {
    id = 2041001008,
    talk_text = function()
      return T_S(20410010080)
    end,
    next_dialog = 2041001009,
    env_sound = 20004
  },
  [2041001009] = {
    id = 2041001009,
    talk_text = function()
      return T_S(20410010090)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041001010,
    speak_name = function()
      return T_S(20410010095)
    end,
    env_sound = 20004
  },
  [2041001010] = {
    id = 2041001010,
    talk_text = function()
      return T_S(20410010100)
    end,
    next_dialog = 2041001011,
    env_sound = 20004
  },
  [2041001011] = {
    id = 2041001011,
    talk_text = function()
      return T_S(20410010110)
    end,
    next_dialog = 2041001012,
    env_sound = 20004
  },
  [2041001012] = {
    id = 2041001012,
    talk_text = function()
      return T_S(20410010120)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041001013,
    speak_name = function()
      return T_S(20410010125)
    end,
    env_sound = 20004
  },
  [2041001013] = {
    id = 2041001013,
    talk_text = function()
      return T_S(20410010130)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041001014,
    speak_head = 90120055,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410010135)
    end,
    camera_shake = {
      "2",
      "0",
      "1600"
    },
    env_sound = 20004
  },
  [2041001014] = {
    id = 2041001014,
    talk_text = function()
      return T_S(20410010140)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041001015,
    speak_name = function()
      return T_S(20410010145)
    end,
    env_sound = 20004
  },
  [2041001015] = {
    id = 2041001015,
    talk_text = function()
      return T_S(20410010150)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2041001016,
    env_sound = 20004
  },
  [2041001016] = {
    id = 2041001016,
    talk_text = function()
      return T_S(20410010160)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041001017,
    env_sound = 20004
  },
  [2041001017] = {
    id = 2041001017,
    talk_text = function()
      return T_S(20410010170)
    end,
    next_dialog = 2041001018,
    env_sound = 20004
  },
  [2041001018] = {
    id = 2041001018,
    talk_text = function()
      return T_S(20410010180)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    role_shake = {"2:0:1100"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041001019,
    speak_name = function()
      return T_S(20410010185)
    end,
    env_sound = 20004
  },
  [2041001019] = {
    id = 2041001019,
    talk_text = function()
      return T_S(20410010190)
    end,
    next_dialog = 2041001020,
    env_sound = 20004
  },
  [2041001020] = {
    id = 2041001020,
    talk_text = function()
      return T_S(20410010200)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041001021,
    speak_name = function()
      return T_S(20410010205)
    end,
    env_sound = 20004
  },
  [2041001021] = {
    id = 2041001021,
    talk_text = function()
      return T_S(20410010210)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041001022,
    speak_head = 90120055,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410010215)
    end,
    env_sound = 20004
  },
  [2041001022] = {
    id = 2041001022,
    talk_text = function()
      return T_S(20410010220)
    end,
    next_dialog = 2041001023,
    env_sound = 20004
  },
  [2041001023] = {
    id = 2041001023,
    talk_text = function()
      return T_S(20410010230)
    end,
    is_master = 1,
    next_dialog = 2041001024,
    env_sound = 20004
  },
  [2041001024] = {
    id = 2041001024,
    talk_text = function()
      return T_S(20410010240)
    end,
    next_dialog = 2041001025,
    env_sound = 20004
  },
  [2041001025] = {
    id = 2041001025,
    talk_text = function()
      return T_S(20410010250)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041001026,
    speak_name = function()
      return T_S(20410010255)
    end,
    env_sound = 20004
  },
  [2041001026] = {
    id = 2041001026,
    talk_text = function()
      return T_S(20410010260)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041001027,
    env_sound = 20004
  },
  [2041001027] = {
    id = 2041001027,
    talk_text = function()
      return T_S(20410010270)
    end,
    role_ids = {90110002, 90110031},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"270:-1066", "-270:-1011"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(20410010275)
    end,
    env_sound = 20004
  },
  [2041002001] = {
    id = 2041002001,
    talk_text = function()
      return T_S(20410020010)
    end,
    next_dialog = 2041002002,
    env_sound = 20007
  },
  [2041002002] = {
    id = 2041002002,
    talk_text = function()
      return T_S(20410020020)
    end,
    next_dialog = 2041002003,
    env_sound = 20007
  },
  [2041002003] = {
    id = 2041002003,
    talk_text = function()
      return T_S(20410020030)
    end,
    is_master = 1,
    next_dialog = 2041002004,
    env_sound = 20007
  },
  [2041002004] = {
    id = 2041002004,
    talk_text = function()
      return T_S(20410020040)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002005,
    speak_name = function()
      return T_S(20410020045)
    end,
    env_sound = 20007
  },
  [2041002005] = {
    id = 2041002005,
    talk_text = function()
      return T_S(20410020050)
    end,
    next_dialog = 2041002006,
    env_sound = 20007
  },
  [2041002006] = {
    id = 2041002006,
    talk_text = function()
      return T_S(20410020060)
    end,
    next_dialog = 2041002007,
    env_sound = 20007
  },
  [2041002007] = {
    id = 2041002007,
    talk_text = function()
      return T_S(20410020070)
    end,
    next_dialog = 2041002008,
    speak_head = 90120066,
    speak_head_actions = {
      "idle",
      "blink",
      "talk"
    },
    speak_name = function()
      return T_S(20410020075)
    end,
    env_sound = 20007
  },
  [2041002008] = {
    id = 2041002008,
    talk_text = function()
      return T_S(20410020080)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002009,
    speak_name = function()
      return T_S(20410020085)
    end,
    env_sound = 20007
  },
  [2041002009] = {
    id = 2041002009,
    talk_text = function()
      return T_S(20410020090)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041002010,
    env_sound = 20007
  },
  [2041002010] = {
    id = 2041002010,
    talk_text = function()
      return T_S(20410020100)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041002011,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410020105)
    end,
    env_sound = 20007
  },
  [2041002011] = {
    id = 2041002011,
    talk_text = function()
      return T_S(20410020110)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041002012,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410020115)
    end,
    env_sound = 20007
  },
  [2041002012] = {
    id = 2041002012,
    talk_text = function()
      return T_S(20410020120)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002013,
    speak_name = function()
      return T_S(20410020125)
    end,
    env_sound = 20007
  },
  [2041002013] = {
    id = 2041002013,
    talk_text = function()
      return T_S(20410020130)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041002014,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410020135)
    end,
    env_sound = 20007
  },
  [2041002014] = {
    id = 2041002014,
    talk_text = function()
      return T_S(20410020140)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002015,
    speak_name = function()
      return T_S(20410020145)
    end,
    env_sound = 20007
  },
  [2041002015] = {
    id = 2041002015,
    talk_text = function()
      return T_S(20410020150)
    end,
    next_dialog = 2041002016,
    env_sound = 20007
  },
  [2041002016] = {
    id = 2041002016,
    talk_text = function()
      return T_S(20410020160)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002017,
    speak_name = function()
      return T_S(20410020165)
    end,
    env_sound = 20007
  },
  [2041002017] = {
    id = 2041002017,
    talk_text = function()
      return T_S(20410020170)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041002018,
    env_sound = 20007
  },
  [2041002018] = {
    id = 2041002018,
    talk_text = function()
      return T_S(20410020180)
    end,
    next_dialog = 2041002019,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410020185)
    end,
    env_sound = 20007
  },
  [2041002019] = {
    id = 2041002019,
    talk_text = function()
      return T_S(20410020190)
    end,
    next_dialog = 2041002020,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410020195)
    end,
    env_sound = 20007
  },
  [2041002020] = {
    id = 2041002020,
    talk_text = function()
      return T_S(20410020200)
    end,
    next_dialog = 2041002021,
    env_sound = 20007
  },
  [2041002021] = {
    id = 2041002021,
    talk_text = function()
      return T_S(20410020210)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002022,
    speak_name = function()
      return T_S(20410020215)
    end,
    env_sound = 20007
  },
  [2041002022] = {
    id = 2041002022,
    talk_text = function()
      return T_S(20410020220)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041002023,
    speak_head = 90120066,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20410020225)
    end,
    env_sound = 20007
  },
  [2041002023] = {
    id = 2041002023,
    talk_text = function()
      return T_S(20410020230)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-308:-1165", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041002024,
    speak_name = function()
      return T_S(20410020235)
    end,
    env_sound = 20007
  },
  [2041002024] = {
    id = 2041002024,
    talk_text = function()
      return T_S(20410020240)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-308:-1165", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2041002025,
    speak_head = 90120066,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20410020245)
    end,
    env_sound = 20007
  },
  [2041002025] = {
    id = 2041002025,
    talk_text = function()
      return T_S(20410020250)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-308:-1165", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041002026,
    speak_name = function()
      return T_S(20410020255)
    end,
    env_sound = 20007
  },
  [2041002026] = {
    id = 2041002026,
    talk_text = function()
      return T_S(20410020260)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-308:-1165", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "3"},
    effect_out_param = {"240", "240"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2041002027,
    env_sound = 20007
  },
  [2041002027] = {
    id = 2041002027,
    talk_text = function()
      return T_S(20410020270)
    end,
    is_master = 1,
    next_dialog = 2041002028,
    env_sound = 20007
  },
  [2041002028] = {
    id = 2041002028,
    talk_text = function()
      return T_S(20410020280)
    end,
    next_dialog = 2041002029,
    env_sound = 20007
  },
  [2041002029] = {
    id = 2041002029,
    talk_text = function()
      return T_S(20410020290)
    end,
    next_dialog = 2041002030,
    env_sound = 20007
  },
  [2041002030] = {
    id = 2041002030,
    talk_text = function()
      return T_S(20410020300)
    end,
    is_master = 1,
    next_dialog = 2041002031,
    env_sound = 20007
  },
  [2041002031] = {
    id = 2041002031,
    talk_text = function()
      return T_S(20410020310)
    end,
    next_dialog = 2041002032,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410020315)
    end,
    env_sound = 20007
  },
  [2041002032] = {
    id = 2041002032,
    talk_text = function()
      return T_S(20410020320)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002033,
    speak_name = function()
      return T_S(20410020325)
    end,
    env_sound = 20007
  },
  [2041002033] = {
    id = 2041002033,
    talk_text = function()
      return T_S(20410020330)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041002034,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20410020335)
    end,
    env_sound = 20007
  },
  [2041002034] = {
    id = 2041002034,
    talk_text = function()
      return T_S(20410020340)
    end,
    next_dialog = 2041002035,
    env_sound = 20007
  },
  [2041002035] = {
    id = 2041002035,
    talk_text = function()
      return T_S(20410020350)
    end,
    next_dialog = 2041002036,
    env_sound = 20007
  },
  [2041002036] = {
    id = 2041002036,
    talk_text = function()
      return T_S(20410020360)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"2"},
    effect_out_param = {"240"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041002037,
    speak_name = function()
      return T_S(20410020365)
    end,
    env_sound = 20007
  },
  [2041002037] = {
    id = 2041002037,
    talk_text = function()
      return T_S(20410020370)
    end,
    next_dialog = 2041002038,
    env_sound = 20007
  },
  [2041002038] = {
    id = 2041002038,
    talk_text = function()
      return T_S(20410020380)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_2.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20410020385)
    end,
    env_sound = 20007
  }
}
