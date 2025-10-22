BasePlotDialogPart520500 = {
  [2041101001] = {
    id = 2041101001,
    talk_text = function()
      return T_S(20411010010)
    end,
    next_dialog = 2041101002,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010015)
    end,
    env_sound = 20004,
    open_title_1 = function()
      return T_S(20411010018)
    end,
    open_title_2 = function()
      return T_S(20411010019)
    end
  },
  [2041101002] = {
    id = 2041101002,
    talk_text = function()
      return T_S(20411010020)
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
    next_dialog = 2041101003,
    speak_name = function()
      return T_S(20411010025)
    end,
    env_sound = 20004
  },
  [2041101003] = {
    id = 2041101003,
    talk_text = function()
      return T_S(20411010030)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041101004,
    speak_name = function()
      return T_S(20411010035)
    end,
    env_sound = 20004
  },
  [2041101004] = {
    id = 2041101004,
    talk_text = function()
      return T_S(20411010040)
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
    next_dialog = 2041101005,
    speak_name = function()
      return T_S(20411010045)
    end,
    env_sound = 20004
  },
  [2041101005] = {
    id = 2041101005,
    talk_text = function()
      return T_S(20411010050)
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
    next_dialog = 2041101006,
    speak_head = 90120066,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20411010055)
    end,
    env_sound = 20004
  },
  [2041101006] = {
    id = 2041101006,
    talk_text = function()
      return T_S(20411010060)
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
    next_dialog = 2041101007,
    speak_name = function()
      return T_S(20411010065)
    end,
    env_sound = 20004
  },
  [2041101007] = {
    id = 2041101007,
    talk_text = function()
      return T_S(20411010070)
    end,
    is_master = 1,
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
    next_dialog = 2041101008,
    env_sound = 20004
  },
  [2041101008] = {
    id = 2041101008,
    talk_text = function()
      return T_S(20411010080)
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
    next_dialog = 2041101009,
    speak_name = function()
      return T_S(20411010085)
    end,
    env_sound = 20004
  },
  [2041101009] = {
    id = 2041101009,
    talk_text = function()
      return T_S(20411010090)
    end,
    next_dialog = 2041101010,
    env_sound = 20004
  },
  [2041101010] = {
    id = 2041101010,
    talk_text = function()
      return T_S(20411010100)
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
    next_dialog = 2041101011,
    speak_name = function()
      return T_S(20411010105)
    end,
    env_sound = 20004
  },
  [2041101011] = {
    id = 2041101011,
    talk_text = function()
      return T_S(20411010110)
    end,
    next_dialog = 2041101012,
    env_sound = 20004
  },
  [2041101012] = {
    id = 2041101012,
    talk_text = function()
      return T_S(20411010120)
    end,
    next_dialog = 2041101013,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010125)
    end,
    env_sound = 20004
  },
  [2041101013] = {
    id = 2041101013,
    talk_text = function()
      return T_S(20411010130)
    end,
    next_dialog = 2041101014,
    env_sound = 20004
  },
  [2041101014] = {
    id = 2041101014,
    talk_text = function()
      return T_S(20411010140)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041101015,
    speak_name = function()
      return T_S(20411010145)
    end,
    env_sound = 20004
  },
  [2041101015] = {
    id = 2041101015,
    talk_text = function()
      return T_S(20411010150)
    end,
    is_master = 1,
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
    light_role = {1},
    next_dialog = 2041101016,
    env_sound = 20004
  },
  [2041101016] = {
    id = 2041101016,
    talk_text = function()
      return T_S(20411010160)
    end,
    next_dialog = 2041101017,
    env_sound = 20004
  },
  [2041101017] = {
    id = 2041101017,
    talk_text = function()
      return T_S(20411010170)
    end,
    next_dialog = 2041101018,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010175)
    end,
    env_sound = 20004
  },
  [2041101018] = {
    id = 2041101018,
    talk_text = function()
      return T_S(20411010180)
    end,
    next_dialog = 2041101019,
    env_sound = 20004
  },
  [2041101019] = {
    id = 2041101019,
    talk_text = function()
      return T_S(20411010190)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041101020,
    speak_name = function()
      return T_S(20411010195)
    end,
    env_sound = 20004
  },
  [2041101020] = {
    id = 2041101020,
    talk_text = function()
      return T_S(20411010200)
    end,
    next_dialog = 2041101021,
    speak_head = 90120066,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20411010205)
    end,
    env_sound = 20004
  },
  [2041101021] = {
    id = 2041101021,
    talk_text = function()
      return T_S(20411010210)
    end,
    next_dialog = 2041101022,
    speak_head = 90120066,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010215)
    end,
    env_sound = 20004
  },
  [2041101022] = {
    id = 2041101022,
    talk_text = function()
      return T_S(20411010220)
    end,
    next_dialog = 2041101023,
    env_sound = 20004
  },
  [2041101023] = {
    id = 2041101023,
    talk_text = function()
      return T_S(20411010230)
    end,
    next_dialog = 2041101024,
    env_sound = 20004
  },
  [2041101024] = {
    id = 2041101024,
    talk_text = function()
      return T_S(20411010240)
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
    next_dialog = 2041101025,
    speak_name = function()
      return T_S(20411010245)
    end,
    env_sound = 20004
  },
  [2041101025] = {
    id = 2041101025,
    talk_text = function()
      return T_S(20411010250)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1066", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041101026,
    speak_name = function()
      return T_S(20411010255)
    end,
    env_sound = 20004
  },
  [2041101026] = {
    id = 2041101026,
    talk_text = function()
      return T_S(20411010260)
    end,
    next_dialog = 2041101027,
    env_sound = 20004
  },
  [2041101027] = {
    id = 2041101027,
    talk_text = function()
      return T_S(20411010270)
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
    next_dialog = 2041101028,
    speak_name = function()
      return T_S(20411010275)
    end,
    env_sound = 20004
  },
  [2041101028] = {
    id = 2041101028,
    talk_text = function()
      return T_S(20411010280)
    end,
    next_dialog = 2041101029,
    env_sound = 20004
  },
  [2041101029] = {
    id = 2041101029,
    talk_text = function()
      return T_S(20411010290)
    end,
    next_dialog = 2041101030,
    env_sound = 20004
  },
  [2041101030] = {
    id = 2041101030,
    talk_text = function()
      return T_S(20411010300)
    end,
    is_master = 1,
    next_dialog = 2041101031,
    env_sound = 20004
  },
  [2041101031] = {
    id = 2041101031,
    talk_text = function()
      return T_S(20411010310)
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
    effect_in_param = {"210"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041101032,
    speak_name = function()
      return T_S(20411010315)
    end,
    env_sound = 20004
  },
  [2041101032] = {
    id = 2041101032,
    talk_text = function()
      return T_S(20411010320)
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
    effect_in_param = {"0", "210"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041101033,
    speak_name = function()
      return T_S(20411010325)
    end,
    env_sound = 20004
  },
  [2041101033] = {
    id = 2041101033,
    talk_text = function()
      return T_S(20411010330)
    end,
    next_dialog = 2041101034,
    env_sound = 20004
  },
  [2041101034] = {
    id = 2041101034,
    talk_text = function()
      return T_S(20411010340)
    end,
    next_dialog = 2041101035,
    env_sound = 20004
  },
  [2041101035] = {
    id = 2041101035,
    talk_text = function()
      return T_S(20411010350)
    end,
    next_dialog = 2041101036,
    env_sound = 20004
  },
  [2041101036] = {
    id = 2041101036,
    talk_text = function()
      return T_S(20411010360)
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
    next_dialog = 2041101037,
    speak_name = function()
      return T_S(20411010365)
    end,
    env_sound = 20004
  },
  [2041101037] = {
    id = 2041101037,
    talk_text = function()
      return T_S(20411010370)
    end,
    next_dialog = 2041101038,
    env_sound = 20004
  },
  [2041101038] = {
    id = 2041101038,
    talk_text = function()
      return T_S(20411010380)
    end,
    next_dialog = 2041101039,
    env_sound = 20004
  },
  [2041101039] = {
    id = 2041101039,
    talk_text = function()
      return T_S(20411010390)
    end,
    is_master = 1,
    next_dialog = 2041101040,
    env_sound = 20004
  },
  [2041101040] = {
    id = 2041101040,
    talk_text = function()
      return T_S(20411010400)
    end,
    next_dialog = 2041101041,
    env_sound = 20004
  },
  [2041101041] = {
    id = 2041101041,
    talk_text = function()
      return T_S(20411010410)
    end,
    next_dialog = 2041101042,
    env_sound = 20004
  },
  [2041101042] = {
    id = 2041101042,
    talk_text = function()
      return T_S(20411010420)
    end,
    is_master = 1,
    next_dialog = 2041101043,
    env_sound = 20004
  },
  [2041101043] = {
    id = 2041101043,
    talk_text = function()
      return T_S(20411010430)
    end,
    next_dialog = 2041101044,
    env_sound = 20004
  },
  [2041101044] = {
    id = 2041101044,
    talk_text = function()
      return T_S(20411010440)
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
    next_dialog = 2041101045,
    speak_name = function()
      return T_S(20411010445)
    end,
    env_sound = 20004
  },
  [2041101045] = {
    id = 2041101045,
    talk_text = function()
      return T_S(20411010450)
    end,
    is_master = 1,
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
    light_role = {1},
    next_dialog = 2041101046,
    env_sound = 20004
  },
  [2041101046] = {
    id = 2041101046,
    talk_text = function()
      return T_S(20411010460)
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
    next_dialog = 2041101047,
    env_sound = 20004
  },
  [2041101047] = {
    id = 2041101047,
    talk_text = function()
      return T_S(20411010470)
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
    effect_in_param = {"0", "180"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041101048,
    speak_name = function()
      return T_S(20411010475)
    end,
    env_sound = 20004
  },
  [2041101048] = {
    id = 2041101048,
    talk_text = function()
      return T_S(20411010480)
    end,
    next_dialog = 2041101049,
    env_sound = 20004
  },
  [2041101049] = {
    id = 2041101049,
    talk_text = function()
      return T_S(20411010490)
    end,
    next_dialog = 2041101050,
    speak_head = 90120055,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20411010495)
    end,
    env_sound = 20004
  },
  [2041101050] = {
    id = 2041101050,
    talk_text = function()
      return T_S(20411010500)
    end,
    is_master = 1,
    next_dialog = 2041101051,
    env_sound = 20004
  },
  [2041101051] = {
    id = 2041101051,
    talk_text = function()
      return T_S(20411010510)
    end,
    next_dialog = 2041101052,
    env_sound = 20004
  },
  [2041101052] = {
    id = 2041101052,
    talk_text = function()
      return T_S(20411010520)
    end,
    next_dialog = 2041101053,
    speak_head = 90120055,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010525)
    end,
    camera_shake = {
      "1",
      "0",
      "1000"
    },
    env_sound = 20004
  },
  [2041101053] = {
    id = 2041101053,
    talk_text = function()
      return T_S(20411010530)
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
    next_dialog = 2041101054,
    speak_name = function()
      return T_S(20411010535)
    end,
    env_sound = 20004
  },
  [2041101054] = {
    id = 2041101054,
    talk_text = function()
      return T_S(20411010540)
    end,
    next_dialog = 2041101055,
    camera_shake = {
      "2",
      "0",
      "1600"
    },
    env_sound = 20004
  },
  [2041101055] = {
    id = 2041101055,
    talk_text = function()
      return T_S(20411010550)
    end,
    next_dialog = 2041101056,
    env_sound = 20004
  },
  [2041101056] = {
    id = 2041101056,
    talk_text = function()
      return T_S(20411010560)
    end,
    next_dialog = 2041101057,
    camera_shake = {
      "3",
      "0",
      "2000"
    },
    env_sound = 20004
  },
  [2041101057] = {
    id = 2041101057,
    talk_text = function()
      return T_S(20411010570)
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
    next_dialog = 2041101058,
    speak_name = function()
      return T_S(20411010575)
    end,
    env_sound = 20004
  },
  [2041101058] = {
    id = 2041101058,
    talk_text = function()
      return T_S(20411010580)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041101059,
    speak_name = function()
      return T_S(20411010585)
    end,
    env_sound = 20004
  },
  [2041101059] = {
    id = 2041101059,
    talk_text = function()
      return T_S(20411010590)
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
    next_dialog = 2041101060,
    speak_name = function()
      return T_S(20411010595)
    end,
    env_sound = 20004
  },
  [2041101060] = {
    id = 2041101060,
    talk_text = function()
      return T_S(20411010600)
    end,
    is_master = 1,
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
    light_role = {1},
    next_dialog = 2041101061,
    env_sound = 20004
  },
  [2041101061] = {
    id = 2041101061,
    talk_text = function()
      return T_S(20411010610)
    end,
    is_master = 1,
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
    light_role = {1},
    next_dialog = 2041101062,
    env_sound = 20004
  },
  [2041101062] = {
    id = 2041101062,
    talk_text = function()
      return T_S(20411010620)
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
    next_dialog = 2041101063,
    env_sound = 20004
  },
  [2041101063] = {
    id = 2041101063,
    talk_text = function()
      return T_S(20411010630)
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
    next_dialog = 2041101064,
    speak_name = function()
      return T_S(20411010635)
    end,
    env_sound = 20004
  },
  [2041101064] = {
    id = 2041101064,
    talk_text = function()
      return T_S(20411010640)
    end,
    is_master = 1,
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
    next_dialog = 2041101065,
    env_sound = 20004
  },
  [2041101065] = {
    id = 2041101065,
    talk_text = function()
      return T_S(20411010650)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041101066,
    speak_name = function()
      return T_S(20411010655)
    end,
    env_sound = 20004
  },
  [2041101066] = {
    id = 2041101066,
    talk_text = function()
      return T_S(20411010660)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2041101067,
    env_sound = 20004
  },
  [2041101067] = {
    id = 2041101067,
    talk_text = function()
      return T_S(20411010670)
    end,
    role_ids = {90110031, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1011", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2041101068,
    speak_name = function()
      return T_S(20411010675)
    end,
    env_sound = 20004
  },
  [2041101068] = {
    id = 2041101068,
    talk_text = function()
      return T_S(20411010680)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2041101069,
    speak_name = function()
      return T_S(20411010685)
    end,
    env_sound = 20004
  },
  [2041101069] = {
    id = 2041101069,
    talk_text = function()
      return T_S(20411010690)
    end,
    is_master = 1,
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2041101070,
    env_sound = 20004
  },
  [2041101070] = {
    id = 2041101070,
    talk_text = function()
      return T_S(20411010700)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041101071,
    speak_name = function()
      return T_S(20411010705)
    end,
    env_sound = 20004
  },
  [2041101071] = {
    id = 2041101071,
    talk_text = function()
      return T_S(20411010710)
    end,
    is_master = 1,
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 2041101072,
    env_sound = 20004
  },
  [2041101072] = {
    id = 2041101072,
    talk_text = function()
      return T_S(20411010720)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2041101073,
    speak_name = function()
      return T_S(20411010725)
    end,
    env_sound = 20004
  },
  [2041101073] = {
    id = 2041101073,
    talk_text = function()
      return T_S(20411010730)
    end,
    next_dialog = 2041101074,
    camera_shake = {
      "1",
      "0",
      "1800"
    },
    env_sound = 20004
  },
  [2041101074] = {
    id = 2041101074,
    talk_text = function()
      return T_S(20411010740)
    end,
    next_dialog = 2041101075,
    env_sound = 20004
  },
  [2041101075] = {
    id = 2041101075,
    talk_text = function()
      return T_S(20411010750)
    end,
    next_dialog = 2041101076,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010755)
    end,
    env_sound = 20004
  },
  [2041101076] = {
    id = 2041101076,
    talk_text = function()
      return T_S(20411010760)
    end,
    next_dialog = 2041101077,
    env_sound = 20004
  },
  [2041101077] = {
    id = 2041101077,
    talk_text = function()
      return T_S(20411010770)
    end,
    next_dialog = 2041101078,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010775)
    end,
    env_sound = 20004
  },
  [2041101078] = {
    id = 2041101078,
    talk_text = function()
      return T_S(20411010780)
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
    next_dialog = 2041101079,
    speak_name = function()
      return T_S(20411010785)
    end,
    env_sound = 20004
  },
  [2041101079] = {
    id = 2041101079,
    talk_text = function()
      return T_S(20411010790)
    end,
    next_dialog = 2041101080,
    env_sound = 20004
  },
  [2041101080] = {
    id = 2041101080,
    talk_text = function()
      return T_S(20411010800)
    end,
    next_dialog = 2041101081,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20411010805)
    end,
    env_sound = 20004
  },
  [2041101081] = {
    id = 2041101081,
    talk_text = function()
      return T_S(20411010810)
    end,
    next_dialog = 2041101082,
    env_sound = 20004
  },
  [2041101082] = {
    id = 2041101082,
    talk_text = function()
      return T_S(20411010820)
    end,
    next_dialog = 2041101083,
    speak_head = 90120040,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010825)
    end,
    env_sound = 20004
  },
  [2041101083] = {
    id = 2041101083,
    talk_text = function()
      return T_S(20411010830)
    end,
    next_dialog = 2041101084,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010835)
    end,
    env_sound = 20004
  },
  [2041101084] = {
    id = 2041101084,
    talk_text = function()
      return T_S(20411010840)
    end,
    next_dialog = 2041101085,
    env_sound = 20004
  },
  [2041101085] = {
    id = 2041101085,
    talk_text = function()
      return T_S(20411010850)
    end,
    next_dialog = 2041101086,
    env_sound = 20004
  },
  [2041101086] = {
    id = 2041101086,
    talk_text = function()
      return T_S(20411010860)
    end,
    next_dialog = 2041101087,
    speak_head = 90120043,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20411010865)
    end,
    env_sound = 20004
  },
  [2041101087] = {
    id = 2041101087,
    talk_text = function()
      return T_S(20411010870)
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
    next_dialog = 2041101088,
    speak_name = function()
      return T_S(20411010875)
    end,
    env_sound = 20004
  },
  [2041101088] = {
    id = 2041101088,
    talk_text = function()
      return T_S(20411010880)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101089,
    env_sound = 20004
  },
  [2041101089] = {
    id = 2041101089,
    talk_text = function()
      return T_S(20411010890)
    end,
    role_ids = {90110031},
    scale = {8000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-838"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101090,
    camera_shake = {
      "2",
      "0",
      "1600"
    },
    env_sound = 20004
  },
  [2041101090] = {
    id = 2041101090,
    talk_text = function()
      return T_S(20411010900)
    end,
    is_master = 1,
    role_ids = {90110031},
    scale = {8000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-838"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101091,
    env_sound = 20004
  },
  [2041101091] = {
    id = 2041101091,
    talk_text = function()
      return T_S(20411010910)
    end,
    role_ids = {90110031},
    scale = {8000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-838"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101092,
    env_sound = 20004
  },
  [2041101092] = {
    id = 2041101092,
    talk_text = function()
      return T_S(20411010920)
    end,
    role_ids = {90110031},
    scale = {8000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-838"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101093,
    env_sound = 20004
  },
  [2041101093] = {
    id = 2041101093,
    talk_text = function()
      return T_S(20411010930)
    end,
    is_master = 1,
    role_ids = {90110031},
    scale = {8000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-838"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101094,
    env_sound = 20004
  },
  [2041101094] = {
    id = 2041101094,
    talk_text = function()
      return T_S(20411010940)
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
    next_dialog = 2041101095,
    env_sound = 20004
  },
  [2041101095] = {
    id = 2041101095,
    talk_text = function()
      return T_S(20411010950)
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
    next_dialog = 2041101096,
    speak_name = function()
      return T_S(20411010955)
    end,
    env_sound = 20004
  },
  [2041101096] = {
    id = 2041101096,
    talk_text = function()
      return T_S(20411010960)
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
    next_dialog = 2041101097,
    env_sound = 20004
  },
  [2041101097] = {
    id = 2041101097,
    talk_text = function()
      return T_S(20411010970)
    end,
    is_master = 1,
    role_ids = {90110031},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1266"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2041101098,
    env_sound = 20004
  },
  [2041101098] = {
    id = 2041101098,
    talk_text = function()
      return T_S(20411010980)
    end,
    role_ids = {90110031},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1266"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101099,
    env_sound = 20004
  },
  [2041101099] = {
    id = 2041101099,
    talk_text = function()
      return T_S(20411010990)
    end,
    role_ids = {90110031},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1266"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101100,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411010995)
    end,
    env_sound = 20004
  },
  [2041101100] = {
    id = 2041101100,
    talk_text = function()
      return T_S(20411011000)
    end,
    role_ids = {90110031},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1266"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101101,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411011005)
    end,
    env_sound = 20004
  },
  [2041101101] = {
    id = 2041101101,
    talk_text = function()
      return T_S(20411011010)
    end,
    role_ids = {90110031},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1266"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101102,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20411011015)
    end,
    env_sound = 20004
  },
  [2041101102] = {
    id = 2041101102,
    talk_text = function()
      return T_S(20411011020)
    end,
    role_ids = {90110031},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1266"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2041101103,
    env_sound = 20004
  },
  [2041101103] = {
    id = 2041101103,
    talk_text = function()
      return T_S(20411011030)
    end,
    role_ids = {90110031},
    scale = {12000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1266"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    env_sound = 20004
  },
  [2041102001] = {
    id = 2041102001,
    talk_text = function()
      return T_S(20411020010)
    end,
    next_dialog = 2041102002,
    env_sound = 20009
  },
  [2041102002] = {
    id = 2041102002,
    talk_text = function()
      return T_S(20411020020)
    end,
    next_dialog = 2041102003,
    env_sound = 20009
  },
  [2041102003] = {
    id = 2041102003,
    talk_text = function()
      return T_S(20411020030)
    end,
    next_dialog = 2041102004,
    env_sound = 20009
  },
  [2041102004] = {
    id = 2041102004,
    talk_text = function()
      return T_S(20411020040)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2041102005,
    speak_name = function()
      return T_S(20411020045)
    end,
    env_sound = 20009
  },
  [2041102005] = {
    id = 2041102005,
    talk_text = function()
      return T_S(20411020050)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041102006,
    speak_name = function()
      return T_S(20411020055)
    end,
    env_sound = 20009
  },
  [2041102006] = {
    id = 2041102006,
    talk_text = function()
      return T_S(20411020060)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2041102006/2041102006_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2041102007,
    speak_name = function()
      return T_S(20411020065)
    end,
    env_sound = 20009
  },
  [2041102007] = {
    id = 2041102007,
    talk_text = function()
      return T_S(20411020070)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2041102008,
    speak_name = function()
      return T_S(20411020075)
    end,
    env_sound = 20009
  },
  [2041102008] = {
    id = 2041102008,
    talk_text = function()
      return T_S(20411020080)
    end,
    is_master = 1,
    next_dialog = 2041102009,
    env_sound = 20009
  },
  [2041102009] = {
    id = 2041102009,
    talk_text = function()
      return T_S(20411020090)
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
    speak_name = function()
      return T_S(20411020095)
    end,
    env_sound = 20009
  }
}
