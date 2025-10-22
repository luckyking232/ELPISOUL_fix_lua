BasePlotDialogPart65100 = {
  [1130301001] = {
    id = 1130301001,
    talk_text = function()
      return T_S(11303010010)
    end,
    next_dialog = 1130301002,
    env_sound = 20004
  },
  [1130301002] = {
    id = 1130301002,
    talk_text = function()
      return T_S(11303010020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301002/1130301002_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301003,
    speak_name = function()
      return T_S(11303010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00678",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20004
  },
  [1130301003] = {
    id = 1130301003,
    talk_text = function()
      return T_S(11303010030)
    end,
    next_dialog = 1130301004,
    env_sound = 20004
  },
  [1130301004] = {
    id = 1130301004,
    talk_text = function()
      return T_S(11303010040)
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
    next_dialog = 1130301005,
    speak_name = function()
      return T_S(11303010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00417",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20004
  },
  [1130301005] = {
    id = 1130301005,
    talk_text = function()
      return T_S(11303010050)
    end,
    next_dialog = 1130301006,
    env_sound = 20004
  },
  [1130301006] = {
    id = 1130301006,
    talk_text = function()
      return T_S(11303010060)
    end,
    next_dialog = 1130301007,
    env_sound = 20004
  },
  [1130301007] = {
    id = 1130301007,
    talk_text = function()
      return T_S(11303010070)
    end,
    next_dialog = 1130301008,
    env_sound = 20004
  },
  [1130301008] = {
    id = 1130301008,
    talk_text = function()
      return T_S(11303010080)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301009,
    speak_name = function()
      return T_S(11303010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00284",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20004
  },
  [1130301009] = {
    id = 1130301009,
    talk_text = function()
      return T_S(11303010090)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130301010,
    speak_name = function()
      return T_S(11303010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00492",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20004
  },
  [1130301010] = {
    id = 1130301010,
    talk_text = function()
      return T_S(11303010100)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301010/1130301010_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130301011,
    speak_name = function()
      return T_S(11303010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00285",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20004
  },
  [1130301011] = {
    id = 1130301011,
    talk_text = function()
      return T_S(11303010110)
    end,
    is_master = 1,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130301012,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00639",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20004
  },
  [1130301012] = {
    id = 1130301012,
    talk_text = function()
      return T_S(11303010120)
    end,
    role_ids = {90110010},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301012/1130301012_90110010.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"0:-958"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301013,
    speak_name = function()
      return T_S(11303010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00055",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20004
  },
  [1130301013] = {
    id = 1130301013,
    talk_text = function()
      return T_S(11303010130)
    end,
    next_dialog = 1130301014,
    env_sound = 20004
  },
  [1130301014] = {
    id = 1130301014,
    talk_text = function()
      return T_S(11303010140)
    end,
    next_dialog = 1130301015,
    env_sound = 20004
  },
  [1130301015] = {
    id = 1130301015,
    talk_text = function()
      return T_S(11303010150)
    end,
    next_dialog = 1130301016,
    env_sound = 20004
  },
  [1130301016] = {
    id = 1130301016,
    talk_text = function()
      return T_S(11303010160)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301016/1130301016_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301017,
    speak_name = function()
      return T_S(11303010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00415",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20004
  },
  [1130301017] = {
    id = 1130301017,
    talk_text = function()
      return T_S(11303010170)
    end,
    role_ids = {90110001, 90110010},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301017/1130301017_90110010.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"-270:-1000", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130301018,
    speak_name = function()
      return T_S(11303010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20004
  },
  [1130301018] = {
    id = 1130301018,
    talk_text = function()
      return T_S(11303010180)
    end,
    next_dialog = 1130301019,
    env_sound = 20004
  },
  [1130301019] = {
    id = 1130301019,
    talk_text = function()
      return T_S(11303010190)
    end,
    next_dialog = 1130301020,
    env_sound = 20004
  },
  [1130301020] = {
    id = 1130301020,
    talk_text = function()
      return T_S(11303010200)
    end,
    next_dialog = 1130301021,
    env_sound = 20004
  },
  [1130301021] = {
    id = 1130301021,
    talk_text = function()
      return T_S(11303010210)
    end,
    next_dialog = 1130301022,
    env_sound = 20004
  },
  [1130301022] = {
    id = 1130301022,
    talk_text = function()
      return T_S(11303010220)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301022/1130301022_90110003.playable"
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
    next_dialog = 1130301023,
    speak_name = function()
      return T_S(11303010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00679",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20004
  },
  [1130301023] = {
    id = 1130301023,
    talk_text = function()
      return T_S(11303010230)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130301024,
    speak_head = 90120063,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11303010235)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20004
  },
  [1130301024] = {
    id = 1130301024,
    talk_text = function()
      return T_S(11303010240)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301024/1130301024_90110002.playable"
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
    next_dialog = 1130301025,
    speak_name = function()
      return T_S(11303010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00418",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20004
  },
  [1130301025] = {
    id = 1130301025,
    talk_text = function()
      return T_S(11303010250)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130301026,
    speak_head = 90120063,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11303010255)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20004
  },
  [1130301026] = {
    id = 1130301026,
    talk_text = function()
      return T_S(11303010260)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130301027,
    camera_shake = {
      "2",
      "0",
      "1600"
    },
    env_sound = 20004
  },
  [1130301027] = {
    id = 1130301027,
    talk_text = function()
      return T_S(11303010270)
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
    role_position = {"-300:-980", "120:-1066"},
    role_shake = {"", "2:0:1200"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130301028,
    speak_name = function()
      return T_S(11303010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00419",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20004
  },
  [1130301028] = {
    id = 1130301028,
    talk_text = function()
      return T_S(11303010280)
    end,
    next_dialog = 1130301029,
    env_sound = 20004
  },
  [1130301029] = {
    id = 1130301029,
    talk_text = function()
      return T_S(11303010290)
    end,
    next_dialog = 1130301030,
    env_sound = 20004
  },
  [1130301030] = {
    id = 1130301030,
    talk_text = function()
      return T_S(11303010300)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301030/1130301030_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301031,
    speak_name = function()
      return T_S(11303010305)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00416",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20004
  },
  [1130301031] = {
    id = 1130301031,
    talk_text = function()
      return T_S(11303010310)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301031/1130301031_90110002.playable"
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
    next_dialog = 1130301032,
    speak_name = function()
      return T_S(11303010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00420",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20004
  },
  [1130301032] = {
    id = 1130301032,
    talk_text = function()
      return T_S(11303010320)
    end,
    role_ids = {90110002, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301032/1130301032_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-270:-1066", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130301033,
    speak_name = function()
      return T_S(11303010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00286",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20004
  },
  [1130301033] = {
    id = 1130301033,
    talk_text = function()
      return T_S(11303010330)
    end,
    next_dialog = 1130301034,
    camera_shake = {
      "2",
      "0",
      "1200"
    },
    env_sound = 20004
  },
  [1130301034] = {
    id = 1130301034,
    talk_text = function()
      return T_S(11303010340)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301034/1130301034_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"2"},
    effect_out_param = {"210"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301035,
    speak_name = function()
      return T_S(11303010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00287",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20004
  },
  [1130301035] = {
    id = 1130301035,
    talk_text = function()
      return T_S(11303010350)
    end,
    is_master = 1,
    scale = {10000},
    next_dialog = 1130301036,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00640",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20004
  },
  [1130301036] = {
    id = 1130301036,
    talk_text = function()
      return T_S(11303010360)
    end,
    next_dialog = 1130301037,
    env_sound = 20004
  },
  [1130301037] = {
    id = 1130301037,
    talk_text = function()
      return T_S(11303010370)
    end,
    next_dialog = 1130301038,
    env_sound = 20004
  },
  [1130301038] = {
    id = 1130301038,
    talk_text = function()
      return T_S(11303010380)
    end,
    next_dialog = 1130301039,
    env_sound = 20004
  },
  [1130301039] = {
    id = 1130301039,
    talk_text = function()
      return T_S(11303010390)
    end,
    is_master = 1,
    next_dialog = 1130301040,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00641",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20004
  },
  [1130301040] = {
    id = 1130301040,
    talk_text = function()
      return T_S(11303010400)
    end,
    next_dialog = 1130301041,
    env_sound = 20004
  },
  [1130301041] = {
    id = 1130301041,
    talk_text = function()
      return T_S(11303010410)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301041/1130301041_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"0:-1066"},
    effect_in = {"3"},
    effect_in_param = {"180"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301042,
    speak_name = function()
      return T_S(11303010415)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00421",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20004
  },
  [1130301042] = {
    id = 1130301042,
    talk_text = function()
      return T_S(11303010420)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301042/1130301042_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1066", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130301043,
    speak_name = function()
      return T_S(11303010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00493",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20004
  },
  [1130301043] = {
    id = 1130301043,
    talk_text = function()
      return T_S(11303010430)
    end,
    next_dialog = 1130301044,
    env_sound = 20004
  },
  [1130301044] = {
    id = 1130301044,
    talk_text = function()
      return T_S(11303010440)
    end,
    next_dialog = 1130301045,
    env_sound = 20004
  },
  [1130301045] = {
    id = 1130301045,
    talk_text = function()
      return T_S(11303010450)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301045/1130301045_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301046,
    speak_name = function()
      return T_S(11303010455)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00680",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20004
  },
  [1130301046] = {
    id = 1130301046,
    talk_text = function()
      return T_S(11303010460)
    end,
    next_dialog = 1130301047,
    env_sound = 20004
  },
  [1130301047] = {
    id = 1130301047,
    talk_text = function()
      return T_S(11303010470)
    end,
    next_dialog = 1130301048,
    env_sound = 20004
  },
  [1130301048] = {
    id = 1130301048,
    talk_text = function()
      return T_S(11303010480)
    end,
    next_dialog = 1130301049,
    speak_head = 90120063,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11303010485)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20004
  },
  [1130301049] = {
    id = 1130301049,
    talk_text = function()
      return T_S(11303010490)
    end,
    next_dialog = 1130301050,
    env_sound = 20004
  },
  [1130301050] = {
    id = 1130301050,
    talk_text = function()
      return T_S(11303010500)
    end,
    next_dialog = 1130301051,
    env_sound = 20004
  },
  [1130301051] = {
    id = 1130301051,
    talk_text = function()
      return T_S(11303010510)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301051/1130301051_90110003.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"1:0:1500"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301052,
    speak_name = function()
      return T_S(11303010515)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00681",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20004
  },
  [1130301052] = {
    id = 1130301052,
    talk_text = function()
      return T_S(11303010520)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"200:-980", "-230:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130301053,
    speak_name = function()
      return T_S(11303010525)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00417",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20004
  },
  [1130301053] = {
    id = 1130301053,
    talk_text = function()
      return T_S(11303010530)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301053/1130301053_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301054,
    speak_name = function()
      return T_S(11303010535)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00288",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20004
  },
  [1130301054] = {
    id = 1130301054,
    talk_text = function()
      return T_S(11303010540)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301054/1130301054_90110010.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"-200:-1080", "200:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130301055,
    speak_name = function()
      return T_S(11303010545)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20004
  },
  [1130301055] = {
    id = 1130301055,
    talk_text = function()
      return T_S(11303010550)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"-200:-1080", "200:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130301056,
    speak_name = function()
      return T_S(11303010555)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00289",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20004
  },
  [1130301056] = {
    id = 1130301056,
    talk_text = function()
      return T_S(11303010560)
    end,
    is_master = 1,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"-200:-1080", "200:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1130301057,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00642",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20004
  },
  [1130301057] = {
    id = 1130301057,
    talk_text = function()
      return T_S(11303010570)
    end,
    next_dialog = 1130301058,
    env_sound = 20004
  },
  [1130301058] = {
    id = 1130301058,
    talk_text = function()
      return T_S(11303010580)
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
    effect_out = {"3"},
    effect_out_param = {"180"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301059,
    speak_name = function()
      return T_S(11303010585)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00494",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20004
  },
  [1130301059] = {
    id = 1130301059,
    talk_text = function()
      return T_S(11303010590)
    end,
    next_dialog = 1130301060,
    env_sound = 20004
  },
  [1130301060] = {
    id = 1130301060,
    talk_text = function()
      return T_S(11303010600)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130301060/1130301060_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301061,
    speak_name = function()
      return T_S(11303010605)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00682",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20004
  },
  [1130301061] = {
    id = 1130301061,
    talk_text = function()
      return T_S(11303010610)
    end,
    next_dialog = 1130301062,
    env_sound = 20004
  },
  [1130301062] = {
    id = 1130301062,
    talk_text = function()
      return T_S(11303010620)
    end,
    is_master = 0,
    next_dialog = 1130301063,
    speak_head = 90120063,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11303010625)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20004
  },
  [1130301063] = {
    id = 1130301063,
    talk_text = function()
      return T_S(11303010630)
    end,
    next_dialog = 1130301064,
    env_sound = 20004
  },
  [1130301064] = {
    id = 1130301064,
    talk_text = function()
      return T_S(11303010640)
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
    effect_out = {"3"},
    effect_out_param = {"180"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130301065,
    speak_name = function()
      return T_S(11303010645)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00683",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20004
  },
  [1130301065] = {
    id = 1130301065,
    talk_text = function()
      return T_S(11303010650)
    end,
    next_dialog = 1130301066,
    env_sound = 20004
  },
  [1130301066] = {
    id = 1130301066,
    talk_text = function()
      return T_S(11303010660)
    end,
    is_master = 1,
    next_dialog = 1130301067,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00643",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20004
  },
  [1130301067] = {
    id = 1130301067,
    talk_text = function()
      return T_S(11303010670)
    end,
    next_dialog = 1130301068,
    speak_head = 90120063,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11303010675)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20004
  },
  [1130301068] = {
    id = 1130301068,
    talk_text = function()
      return T_S(11303010680)
    end,
    next_dialog = 1130301069,
    env_sound = 20004
  },
  [1130301069] = {
    id = 1130301069,
    talk_text = function()
      return T_S(11303010690)
    end,
    next_dialog = 1130301070,
    speak_head = 90120043,
    speak_head_actions = {
      "talk",
      "angry",
      "idle"
    },
    speak_name = function()
      return T_S(11303010695)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00684",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20004
  },
  [1130301070] = {
    id = 1130301070,
    talk_text = function()
      return T_S(11303010700)
    end,
    next_dialog = 1130301071,
    camera_shake = {
      "3",
      "0",
      "2000"
    },
    env_sound = 20004
  },
  [1130301071] = {
    id = 1130301071,
    talk_text = function()
      return T_S(11303010710)
    end,
    next_dialog = 1130301072,
    env_sound = 20004
  },
  [1130301072] = {
    id = 1130301072,
    talk_text = function()
      return T_S(11303010720)
    end,
    next_dialog = 1130301073,
    env_sound = 20004
  },
  [1130301073] = {
    id = 1130301073,
    talk_text = function()
      return T_S(11303010730)
    end,
    next_dialog = 1130301074,
    env_sound = 20004
  },
  [1130301074] = {
    id = 1130301074,
    talk_text = function()
      return T_S(11303010740)
    end,
    env_sound = 20004
  },
  [1130302001] = {
    id = 1130302001,
    talk_text = function()
      return T_S(11303020010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130302001/1130302001_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130302002,
    speak_name = function()
      return T_S(11303020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00685",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130302002] = {
    id = 1130302002,
    talk_text = function()
      return T_S(11303020020)
    end,
    is_master = 1,
    scale = {10000},
    next_dialog = 1130302003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00644",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130302003] = {
    id = 1130302003,
    talk_text = function()
      return T_S(11303020030)
    end,
    role_ids = {90110010},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"0:-958"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130302004,
    speak_name = function()
      return T_S(11303020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20007
  },
  [1130302004] = {
    id = 1130302004,
    talk_text = function()
      return T_S(11303020040)
    end,
    role_ids = {90110010, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130302004/1130302004_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-958", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130302005,
    speak_name = function()
      return T_S(11303020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00418",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20007
  },
  [1130302005] = {
    id = 1130302005,
    talk_text = function()
      return T_S(11303020050)
    end,
    role_ids = {90110010, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-958", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130302006,
    speak_name = function()
      return T_S(11303020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20007
  },
  [1130302006] = {
    id = 1130302006,
    talk_text = function()
      return T_S(11303020060)
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
    next_dialog = 1130302007,
    speak_name = function()
      return T_S(11303020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00422",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20007
  },
  [1130302007] = {
    id = 1130302007,
    talk_text = function()
      return T_S(11303020070)
    end,
    role_ids = {90110002, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-270:-1066", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130302008,
    speak_name = function()
      return T_S(11303020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00290",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20007
  },
  [1130302008] = {
    id = 1130302008,
    talk_text = function()
      return T_S(11303020080)
    end,
    role_ids = {90110010},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"0:-958"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130302009,
    speak_name = function()
      return T_S(11303020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20007
  },
  [1130302009] = {
    id = 1130302009,
    talk_text = function()
      return T_S(11303020090)
    end,
    role_ids = {90110010, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-958", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130302010,
    speak_name = function()
      return T_S(11303020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00686",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130302010] = {
    id = 1130302010,
    talk_text = function()
      return T_S(11303020100)
    end,
    role_ids = {90110010, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-958", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130302011,
    speak_name = function()
      return T_S(11303020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20007
  },
  [1130302011] = {
    id = 1130302011,
    talk_text = function()
      return T_S(11303020110)
    end,
    next_dialog = 1130302012,
    env_sound = 20007
  },
  [1130302012] = {
    id = 1130302012,
    talk_text = function()
      return T_S(11303020120)
    end,
    next_dialog = 1130302013,
    env_sound = 20007
  },
  [1130302013] = {
    id = 1130302013,
    talk_text = function()
      return T_S(11303020130)
    end,
    role_ids = {90110010},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"0:-958"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130302014,
    speak_name = function()
      return T_S(11303020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20007
  },
  [1130302014] = {
    id = 1130302014,
    talk_text = function()
      return T_S(11303020140)
    end,
    role_ids = {90110010, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-958", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130302015,
    speak_name = function()
      return T_S(11303020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00687",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130302015] = {
    id = 1130302015,
    talk_text = function()
      return T_S(11303020150)
    end,
    is_master = 1,
    next_dialog = 1130302016,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00645",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130302016] = {
    id = 1130302016,
    talk_text = function()
      return T_S(11303020160)
    end,
    next_dialog = 1130302017,
    env_sound = 20007
  },
  [1130302017] = {
    id = 1130302017,
    talk_text = function()
      return T_S(11303020170)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130302017/1130302017_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130302018,
    speak_name = function()
      return T_S(11303020175)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00291",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20007
  },
  [1130302018] = {
    id = 1130302018,
    talk_text = function()
      return T_S(11303020180)
    end,
    role_ids = {90110009, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130302018/1130302018_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1080", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130302019,
    speak_name = function()
      return T_S(11303020185)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00495",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130302019] = {
    id = 1130302019,
    talk_text = function()
      return T_S(11303020190)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130302019/1130302019_90110002.playable"
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
    next_dialog = 1130302020,
    speak_name = function()
      return T_S(11303020195)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00423",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20007
  },
  [1130302020] = {
    id = 1130302020,
    talk_text = function()
      return T_S(11303020200)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130302020/1130302020_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130302021,
    speak_name = function()
      return T_S(11303020205)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00419",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20007
  },
  [1130302021] = {
    id = 1130302021,
    talk_text = function()
      return T_S(11303020210)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130302021/1130302021_90110003.playable"
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
    next_dialog = 1130302022,
    speak_name = function()
      return T_S(11303020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00688",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130302022] = {
    id = 1130302022,
    talk_text = function()
      return T_S(11303020220)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130302023,
    speak_name = function()
      return T_S(11303020225)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00689",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130302023] = {
    id = 1130302023,
    talk_text = function()
      return T_S(11303020230)
    end,
    is_master = 1,
    scale = {10000},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00646",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  }
}
