BasePlotDialogPart545350 = {
  [2090801001] = {
    id = 2090801001,
    talk_text = function()
      return T_S(20908010010)
    end,
    next_dialog = 2090801002,
    env_sound = 20006,
    open_title_1 = function()
      return T_S(20908010018)
    end,
    open_title_2 = function()
      return T_S(20908010019)
    end
  },
  [2090801002] = {
    id = 2090801002,
    talk_text = function()
      return T_S(20908010020)
    end,
    next_dialog = 2090801003,
    env_sound = 20006
  },
  [2090801003] = {
    id = 2090801003,
    talk_text = function()
      return T_S(20908010030)
    end,
    next_dialog = 2090801004,
    env_sound = 20006
  },
  [2090801004] = {
    id = 2090801004,
    talk_text = function()
      return T_S(20908010040)
    end,
    next_dialog = 2090801005,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010045)
    end,
    env_sound = 20006
  },
  [2090801005] = {
    id = 2090801005,
    talk_text = function()
      return T_S(20908010050)
    end,
    next_dialog = 2090801006,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010055)
    end,
    env_sound = 20006
  },
  [2090801006] = {
    id = 2090801006,
    talk_text = function()
      return T_S(20908010060)
    end,
    next_dialog = 2090801007,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010065)
    end,
    env_sound = 20006
  },
  [2090801007] = {
    id = 2090801007,
    talk_text = function()
      return T_S(20908010070)
    end,
    next_dialog = 2090801008,
    env_sound = 20006
  },
  [2090801008] = {
    id = 2090801008,
    talk_text = function()
      return T_S(20908010080)
    end,
    role_ids = {90110037},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801008/2090801008_90110037.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801009,
    speak_name = function()
      return T_S(20908010085)
    end,
    env_sound = 20006
  },
  [2090801009] = {
    id = 2090801009,
    talk_text = function()
      return T_S(20908010090)
    end,
    next_dialog = 2090801010,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010095)
    end,
    env_sound = 20006
  },
  [2090801010] = {
    id = 2090801010,
    talk_text = function()
      return T_S(20908010100)
    end,
    next_dialog = 2090801011,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010105)
    end,
    env_sound = 20006
  },
  [2090801011] = {
    id = 2090801011,
    talk_text = function()
      return T_S(20908010110)
    end,
    next_dialog = 2090801012,
    env_sound = 20006
  },
  [2090801012] = {
    id = 2090801012,
    talk_text = function()
      return T_S(20908010120)
    end,
    role_ids = {90110037},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801012/2090801012_90110037.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801013,
    speak_name = function()
      return T_S(20908010125)
    end,
    env_sound = 20006
  },
  [2090801013] = {
    id = 2090801013,
    talk_text = function()
      return T_S(20908010130)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801014,
    speak_name = function()
      return T_S(20908010135)
    end,
    env_sound = 20006
  },
  [2090801014] = {
    id = 2090801014,
    talk_text = function()
      return T_S(20908010140)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801014/2090801014_90110037.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090801015,
    speak_name = function()
      return T_S(20908010145)
    end,
    env_sound = 20006
  },
  [2090801015] = {
    id = 2090801015,
    talk_text = function()
      return T_S(20908010150)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801015/2090801015_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801016,
    speak_name = function()
      return T_S(20908010155)
    end,
    env_sound = 20006
  },
  [2090801016] = {
    id = 2090801016,
    talk_text = function()
      return T_S(20908010160)
    end,
    next_dialog = 2090801017,
    env_sound = 20006
  },
  [2090801017] = {
    id = 2090801017,
    talk_text = function()
      return T_S(20908010170)
    end,
    next_dialog = 2090801018,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010175)
    end,
    env_sound = 20006
  },
  [2090801018] = {
    id = 2090801018,
    talk_text = function()
      return T_S(20908010180)
    end,
    next_dialog = 2090801019,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010185)
    end,
    env_sound = 20006
  },
  [2090801019] = {
    id = 2090801019,
    talk_text = function()
      return T_S(20908010190)
    end,
    next_dialog = 2090801020,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010195)
    end,
    env_sound = 20006
  },
  [2090801020] = {
    id = 2090801020,
    talk_text = function()
      return T_S(20908010200)
    end,
    next_dialog = 2090801021,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20908010205)
    end,
    env_sound = 20006
  },
  [2090801021] = {
    id = 2090801021,
    talk_text = function()
      return T_S(20908010210)
    end,
    next_dialog = 2090801022,
    env_sound = 20006
  },
  [2090801022] = {
    id = 2090801022,
    talk_text = function()
      return T_S(20908010220)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801023,
    speak_name = function()
      return T_S(20908010225)
    end,
    env_sound = 20006
  },
  [2090801023] = {
    id = 2090801023,
    talk_text = function()
      return T_S(20908010230)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090801024,
    speak_name = function()
      return T_S(20908010235)
    end,
    env_sound = 20006
  },
  [2090801024] = {
    id = 2090801024,
    talk_text = function()
      return T_S(20908010240)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801025,
    speak_name = function()
      return T_S(20908010245)
    end,
    env_sound = 20006
  },
  [2090801025] = {
    id = 2090801025,
    talk_text = function()
      return T_S(20908010250)
    end,
    next_dialog = 2090801026,
    env_sound = 20006
  },
  [2090801026] = {
    id = 2090801026,
    talk_text = function()
      return T_S(20908010260)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801026/2090801026_90110038.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801027,
    speak_name = function()
      return T_S(20908010265)
    end,
    env_sound = 20006
  },
  [2090801027] = {
    id = 2090801027,
    talk_text = function()
      return T_S(20908010270)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801028,
    env_sound = 20006
  },
  [2090801028] = {
    id = 2090801028,
    talk_text = function()
      return T_S(20908010280)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801029,
    env_sound = 20006
  },
  [2090801029] = {
    id = 2090801029,
    talk_text = function()
      return T_S(20908010290)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801030,
    env_sound = 20006
  },
  [2090801030] = {
    id = 2090801030,
    talk_text = function()
      return T_S(20908010300)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801031,
    env_sound = 20006
  },
  [2090801031] = {
    id = 2090801031,
    talk_text = function()
      return T_S(20908010310)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801032,
    env_sound = 20006
  },
  [2090801032] = {
    id = 2090801032,
    talk_text = function()
      return T_S(20908010320)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801033,
    env_sound = 20006
  },
  [2090801033] = {
    id = 2090801033,
    talk_text = function()
      return T_S(20908010330)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801033/2090801033_90110038.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801034,
    speak_name = function()
      return T_S(20908010335)
    end,
    env_sound = 20006
  },
  [2090801034] = {
    id = 2090801034,
    talk_text = function()
      return T_S(20908010340)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801035,
    env_sound = 20006
  },
  [2090801035] = {
    id = 2090801035,
    talk_text = function()
      return T_S(20908010350)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801036,
    env_sound = 20006
  },
  [2090801036] = {
    id = 2090801036,
    talk_text = function()
      return T_S(20908010360)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801037,
    env_sound = 20006
  },
  [2090801037] = {
    id = 2090801037,
    talk_text = function()
      return T_S(20908010370)
    end,
    role_ids = {90110038, 90110036},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801037/2090801037_90110036.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801038,
    speak_name = function()
      return T_S(20908010375)
    end,
    env_sound = 20006
  },
  [2090801038] = {
    id = 2090801038,
    talk_text = function()
      return T_S(20908010380)
    end,
    next_dialog = 2090801039,
    env_sound = 20006
  },
  [2090801039] = {
    id = 2090801039,
    talk_text = function()
      return T_S(20908010390)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801039/2090801039_90110037.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801039/2090801039_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801040,
    speak_name = function()
      return T_S(20908010395)
    end,
    env_sound = 20006
  },
  [2090801040] = {
    id = 2090801040,
    talk_text = function()
      return T_S(20908010400)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090801041,
    env_sound = 20006
  },
  [2090801041] = {
    id = 2090801041,
    talk_text = function()
      return T_S(20908010410)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090801042,
    env_sound = 20006
  },
  [2090801042] = {
    id = 2090801042,
    talk_text = function()
      return T_S(20908010420)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801042/2090801042_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801043,
    speak_name = function()
      return T_S(20908010425)
    end,
    env_sound = 20006
  },
  [2090801043] = {
    id = 2090801043,
    talk_text = function()
      return T_S(20908010430)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090801044,
    speak_name = function()
      return T_S(20908010435)
    end,
    env_sound = 20006
  },
  [2090801044] = {
    id = 2090801044,
    talk_text = function()
      return T_S(20908010440)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801044/2090801044_90110013.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801045,
    speak_name = function()
      return T_S(20908010445)
    end,
    env_sound = 20006
  },
  [2090801045] = {
    id = 2090801045,
    talk_text = function()
      return T_S(20908010450)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090801046,
    env_sound = 20006
  },
  [2090801046] = {
    id = 2090801046,
    talk_text = function()
      return T_S(20908010460)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801047,
    speak_name = function()
      return T_S(20908010465)
    end,
    env_sound = 20006
  },
  [2090801047] = {
    id = 2090801047,
    talk_text = function()
      return T_S(20908010470)
    end,
    role_ids = {90110037, 90110013},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110013/90110013_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110037/90110037_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110013/90110013_0.playable"
    },
    role_position = {"-291:-1158", "270:-1220"},
    role_shake = {"1:0:1100", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090801048,
    speak_name = function()
      return T_S(20908010475)
    end,
    env_sound = 20006
  },
  [2090801048] = {
    id = 2090801048,
    talk_text = function()
      return T_S(20908010480)
    end,
    next_dialog = 2090801049,
    env_sound = 20006
  },
  [2090801049] = {
    id = 2090801049,
    talk_text = function()
      return T_S(20908010490)
    end,
    role_ids = {90110039},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801049/2090801049_90110039.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801050,
    speak_name = function()
      return T_S(20908010495)
    end,
    env_sound = 20006
  },
  [2090801050] = {
    id = 2090801050,
    talk_text = function()
      return T_S(20908010500)
    end,
    next_dialog = 2090801051,
    env_sound = 20006
  },
  [2090801051] = {
    id = 2090801051,
    talk_text = function()
      return T_S(20908010510)
    end,
    next_dialog = 2090801052,
    env_sound = 20006
  },
  [2090801052] = {
    id = 2090801052,
    talk_text = function()
      return T_S(20908010520)
    end,
    is_master = 1,
    next_dialog = 2090801053,
    env_sound = 20006
  },
  [2090801053] = {
    id = 2090801053,
    talk_text = function()
      return T_S(20908010530)
    end,
    is_master = 1,
    next_dialog = 2090801054,
    env_sound = 20006
  },
  [2090801054] = {
    id = 2090801054,
    talk_text = function()
      return T_S(20908010540)
    end,
    is_master = 1,
    next_dialog = 2090801055,
    env_sound = 20006
  },
  [2090801055] = {
    id = 2090801055,
    talk_text = function()
      return T_S(20908010550)
    end,
    is_master = 1,
    next_dialog = 2090801056,
    env_sound = 20006
  },
  [2090801056] = {
    id = 2090801056,
    talk_text = function()
      return T_S(20908010560)
    end,
    is_master = 1,
    next_dialog = 2090801057,
    env_sound = 20006
  },
  [2090801057] = {
    id = 2090801057,
    talk_text = function()
      return T_S(20908010570)
    end,
    role_ids = {90110039},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801057/2090801057_90110039.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801058,
    speak_name = function()
      return T_S(20908010575)
    end,
    env_sound = 20006
  },
  [2090801058] = {
    id = 2090801058,
    talk_text = function()
      return T_S(20908010580)
    end,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 2090801059,
    speak_name = function()
      return T_S(20908010585)
    end,
    env_sound = 20006
  },
  [2090801059] = {
    id = 2090801059,
    talk_text = function()
      return T_S(20908010590)
    end,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090801060,
    env_sound = 20006
  },
  [2090801060] = {
    id = 2090801060,
    talk_text = function()
      return T_S(20908010600)
    end,
    is_os = 1,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801061,
    speak_name = function()
      return T_S(20908010605)
    end,
    env_sound = 20006
  },
  [2090801061] = {
    id = 2090801061,
    talk_text = function()
      return T_S(20908010610)
    end,
    role_ids = {90110039},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801062,
    speak_name = function()
      return T_S(20908010615)
    end,
    env_sound = 20006
  },
  [2090801062] = {
    id = 2090801062,
    talk_text = function()
      return T_S(20908010620)
    end,
    is_master = 1,
    role_ids = {90110039},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801063,
    env_sound = 20006
  },
  [2090801063] = {
    id = 2090801063,
    talk_text = function()
      return T_S(20908010630)
    end,
    next_dialog = 2090801064,
    env_sound = 20006
  },
  [2090801064] = {
    id = 2090801064,
    talk_text = function()
      return T_S(20908010640)
    end,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801064/2090801064_90110036.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090801065,
    speak_name = function()
      return T_S(20908010645)
    end,
    env_sound = 20006
  },
  [2090801065] = {
    id = 2090801065,
    talk_text = function()
      return T_S(20908010650)
    end,
    is_master = 0,
    is_os = 1,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801066,
    speak_name = function()
      return T_S(20908010655)
    end,
    env_sound = 20006
  },
  [2090801066] = {
    id = 2090801066,
    talk_text = function()
      return T_S(20908010660)
    end,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090801067,
    speak_name = function()
      return T_S(20908010665)
    end,
    env_sound = 20006
  },
  [2090801067] = {
    id = 2090801067,
    talk_text = function()
      return T_S(20908010670)
    end,
    is_os = 1,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090801068,
    speak_name = function()
      return T_S(20908010675)
    end,
    env_sound = 20006
  },
  [2090801068] = {
    id = 2090801068,
    talk_text = function()
      return T_S(20908010680)
    end,
    is_master = 1,
    role_ids = {90110036, 90110038},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110036/90110036_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 2090801069,
    env_sound = 20006
  },
  [2090801069] = {
    id = 2090801069,
    talk_text = function()
      return T_S(20908010690)
    end,
    role_ids = {90110039},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801082,
    speak_name = function()
      return T_S(20908010695)
    end,
    env_sound = 20006
  },
  [2090801070] = {
    id = 2090801070,
    talk_text = function()
      return T_S(20908010700)
    end,
    next_dialog = 2090801071,
    env_sound = 20006
  },
  [2090801071] = {
    id = 2090801071,
    talk_text = function()
      return T_S(20908010710)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090801071/2090801071_90110038.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801072,
    env_sound = 20006
  },
  [2090801072] = {
    id = 2090801072,
    talk_text = function()
      return T_S(20908010720)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801073,
    env_sound = 20006
  },
  [2090801073] = {
    id = 2090801073,
    talk_text = function()
      return T_S(20908010730)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801074,
    env_sound = 20006
  },
  [2090801074] = {
    id = 2090801074,
    talk_text = function()
      return T_S(20908010740)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801075,
    env_sound = 20006
  },
  [2090801075] = {
    id = 2090801075,
    talk_text = function()
      return T_S(20908010750)
    end,
    is_master = 1,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801076,
    env_sound = 20006
  },
  [2090801076] = {
    id = 2090801076,
    talk_text = function()
      return T_S(20908010760)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801077,
    env_sound = 20006
  },
  [2090801077] = {
    id = 2090801077,
    talk_text = function()
      return T_S(20908010770)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801078,
    env_sound = 20006
  },
  [2090801078] = {
    id = 2090801078,
    talk_text = function()
      return T_S(20908010780)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801079,
    env_sound = 20006
  },
  [2090801079] = {
    id = 2090801079,
    talk_text = function()
      return T_S(20908010790)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 2090801080,
    speak_name = function()
      return T_S(20908010795)
    end,
    env_sound = 20006,
    review_head = "90210001"
  },
  [2090801080] = {
    id = 2090801080,
    talk_text = function()
      return T_S(20908010800)
    end,
    role_ids = {90110038},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110038/90110038_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110038/90110038_0.playable"
    },
    role_position = {"0:-1080"},
    role_shake = {"2:0:1300"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"2"},
    effect_out_param = {"210"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090801081,
    speak_name = function()
      return T_S(20908010805)
    end,
    env_sound = 20006
  },
  [2090801081] = {
    id = 2090801081,
    talk_text = function()
      return T_S(20908010810)
    end,
    env_sound = 20006
  },
  [2090801082] = {
    id = 2090801082,
    talk_text = function()
      return T_S(20908010820)
    end,
    is_master = 1,
    is_os = 1,
    role_ids = {90110039},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2090801070,
    env_sound = 20006
  }
}
