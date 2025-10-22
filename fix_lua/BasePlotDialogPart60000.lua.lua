BasePlotDialogPart60000 = {
  [1120101001] = {
    id = 1120101001,
    talk_text = function()
      return T_S(11201010010)
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
    next_dialog = 1120101002,
    speak_name = function()
      return T_S(11201010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00591",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20003
  },
  [1120101002] = {
    id = 1120101002,
    talk_text = function()
      return T_S(11201010020)
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
    role_position = {"-300.:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101003,
    speak_name = function()
      return T_S(11201010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00371",
    text_sound_bank = "bank:/voice_cn/sty/M0001_5",
    env_sound = 20003
  },
  [1120101003] = {
    id = 1120101003,
    talk_text = function()
      return T_S(11201010030)
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
    next_dialog = 1120101004,
    speak_name = function()
      return T_S(11201010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00351",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20003
  },
  [1120101004] = {
    id = 1120101004,
    talk_text = function()
      return T_S(11201010040)
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
    role_position = {"270:-1066", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101005,
    speak_name = function()
      return T_S(11201010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00231",
    text_sound_bank = "bank:/voice_cn/sty/M0015_4",
    env_sound = 20003
  },
  [1120101005] = {
    id = 1120101005,
    talk_text = function()
      return T_S(11201010050)
    end,
    next_dialog = 1120101006,
    speak_head = 90120023,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11201010055)
    end,
    text_sound_path = "event:/voice_cn/story/S0103/S0103_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0103",
    env_sound = 20003
  },
  [1120101006] = {
    id = 1120101006,
    talk_text = function()
      return T_S(11201010060)
    end,
    next_dialog = 1120101007,
    env_sound = 20003
  },
  [1120101007] = {
    id = 1120101007,
    talk_text = function()
      return T_S(11201010070)
    end,
    next_dialog = 1120101008,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11201010075)
    end,
    text_sound_path = "event:/voice_cn/story/S0104/S0104_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0104",
    env_sound = 20003
  },
  [1120101008] = {
    id = 1120101008,
    talk_text = function()
      return T_S(11201010080)
    end,
    next_dialog = 1120101009,
    env_sound = 20003
  },
  [1120101009] = {
    id = 1120101009,
    talk_text = function()
      return T_S(11201010090)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120101009/1120101009_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    role_shake = {"1:0:1200"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120101010,
    speak_name = function()
      return T_S(11201010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00592",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20003
  },
  [1120101010] = {
    id = 1120101010,
    talk_text = function()
      return T_S(11201010100)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1120101011,
    env_sound = 20003
  },
  [1120101011] = {
    id = 1120101011,
    talk_text = function()
      return T_S(11201010110)
    end,
    next_dialog = 1120101012,
    speak_head = 90120033,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11201010115)
    end,
    text_sound_path = "event:/voice_cn/story/S0105/S0105_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0105",
    env_sound = 20003
  },
  [1120101012] = {
    id = 1120101012,
    talk_text = function()
      return T_S(11201010120)
    end,
    next_dialog = 1120101013,
    env_sound = 20003
  },
  [1120101013] = {
    id = 1120101013,
    talk_text = function()
      return T_S(11201010130)
    end,
    role_ids = {90110012},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable"
    },
    role_position = {"-21:-1158"},
    effect_in = {"2"},
    effect_in_param = {"180"},
    effect_out = {"3"},
    effect_out_param = {"240"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120101014,
    speak_name = function()
      return T_S(11201010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00101",
    text_sound_bank = "bank:/voice_cn/sty/M0014_2",
    env_sound = 20003
  },
  [1120101014] = {
    id = 1120101014,
    talk_text = function()
      return T_S(11201010140)
    end,
    next_dialog = 1120101015,
    env_sound = 20003
  },
  [1120101015] = {
    id = 1120101015,
    talk_text = function()
      return T_S(11201010150)
    end,
    role_ids = {90110002, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120101015/1120101015_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-1066", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101016,
    speak_name = function()
      return T_S(11201010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00232",
    text_sound_bank = "bank:/voice_cn/sty/M0015_4",
    env_sound = 20003
  },
  [1120101016] = {
    id = 1120101016,
    talk_text = function()
      return T_S(11201010160)
    end,
    is_master = 0,
    role_ids = {90110002, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120101016/1120101016_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-1066", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120101017,
    speak_name = function()
      return T_S(11201010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00352",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20003
  },
  [1120101017] = {
    id = 1120101017,
    talk_text = function()
      return T_S(11201010170)
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
    next_dialog = 1120101018,
    speak_name = function()
      return T_S(11201010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00441",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20003
  },
  [1120101018] = {
    id = 1120101018,
    talk_text = function()
      return T_S(11201010180)
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
    next_dialog = 1120101019,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00531",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20003
  },
  [1120101019] = {
    id = 1120101019,
    talk_text = function()
      return T_S(11201010190)
    end,
    role_ids = {90110004, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101020,
    speak_name = function()
      return T_S(11201010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00233",
    text_sound_bank = "bank:/voice_cn/sty/M0015_4",
    env_sound = 20003
  },
  [1120101020] = {
    id = 1120101020,
    talk_text = function()
      return T_S(11201010200)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
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
    next_dialog = 1120101021,
    speak_name = function()
      return T_S(11201010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00372",
    text_sound_bank = "bank:/voice_cn/sty/M0001_5",
    env_sound = 20003
  },
  [1120101021] = {
    id = 1120101021,
    talk_text = function()
      return T_S(11201010210)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101022,
    speak_name = function()
      return T_S(11201010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00593",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20003
  },
  [1120101022] = {
    id = 1120101022,
    talk_text = function()
      return T_S(11201010220)
    end,
    is_master = 1,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-270:-1000", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1120101023,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00532",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20003
  },
  [1120101023] = {
    id = 1120101023,
    talk_text = function()
      return T_S(11201010230)
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
    next_dialog = 1120101024,
    speak_name = function()
      return T_S(11201010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00442",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20003
  },
  [1120101024] = {
    id = 1120101024,
    talk_text = function()
      return T_S(11201010240)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1120101025,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00533",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20003
  },
  [1120101025] = {
    id = 1120101025,
    talk_text = function()
      return T_S(11201010250)
    end,
    next_dialog = 1120101026,
    env_sound = 20003
  },
  [1120101026] = {
    id = 1120101026,
    talk_text = function()
      return T_S(11201010260)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1000", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120101027,
    speak_name = function()
      return T_S(11201010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00373",
    text_sound_bank = "bank:/voice_cn/sty/M0001_5",
    env_sound = 20003
  },
  [1120101027] = {
    id = 1120101027,
    talk_text = function()
      return T_S(11201010270)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1000", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "210"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101028,
    speak_name = function()
      return T_S(11201010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00353",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20003
  },
  [1120101028] = {
    id = 1120101028,
    talk_text = function()
      return T_S(11201010280)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1120101029,
    env_sound = 20003
  },
  [1120101029] = {
    id = 1120101029,
    talk_text = function()
      return T_S(11201010290)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101030,
    speak_name = function()
      return T_S(11201010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00594",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20003
  },
  [1120101030] = {
    id = 1120101030,
    talk_text = function()
      return T_S(11201010300)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120101031,
    speak_name = function()
      return T_S(11201010305)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00374",
    text_sound_bank = "bank:/voice_cn/sty/M0001_5",
    env_sound = 20003
  },
  [1120101031] = {
    id = 1120101031,
    talk_text = function()
      return T_S(11201010310)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"270:-1080", "-270:-985"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120101032,
    speak_name = function()
      return T_S(11201010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00233_01",
    text_sound_bank = "bank:/voice_cn/sty/M0015_4",
    env_sound = 20003
  },
  [1120101032] = {
    id = 1120101032,
    talk_text = function()
      return T_S(11201010320)
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
    role_position = {"270:-1080", "-270:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120101033,
    speak_name = function()
      return T_S(11201010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00051",
    text_sound_bank = "bank:/voice_cn/sty/M0016_2",
    env_sound = 20003
  },
  [1120101033] = {
    id = 1120101033,
    talk_text = function()
      return T_S(11201010330)
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
    role_position = {"270:-1080", "-270:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120101034,
    speak_name = function()
      return T_S(11201010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00234",
    text_sound_bank = "bank:/voice_cn/sty/M0015_4",
    env_sound = 20003
  },
  [1120101034] = {
    id = 1120101034,
    talk_text = function()
      return T_S(11201010340)
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
    role_position = {"270:-1080", "-270:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(11201010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00052",
    text_sound_bank = "bank:/voice_cn/sty/M0016_2",
    env_sound = 20003
  },
  [1120102001] = {
    id = 1120102001,
    talk_text = function()
      return T_S(11201020010)
    end,
    role_ids = {90110008},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable"
    },
    role_position = {"0:-1170"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120102002,
    speak_name = function()
      return T_S(11201020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0011/M0011_story_00051",
    text_sound_bank = "bank:/voice_cn/sty/M0011_2",
    env_sound = 20003
  },
  [1120102002] = {
    id = 1120102002,
    talk_text = function()
      return T_S(11201020020)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120102003,
    speak_name = function()
      return T_S(11201020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00443",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20003
  },
  [1120102003] = {
    id = 1120102003,
    talk_text = function()
      return T_S(11201020030)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1120102004,
    env_sound = 20003
  },
  [1120102004] = {
    id = 1120102004,
    talk_text = function()
      return T_S(11201020040)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120102005,
    speak_name = function()
      return T_S(11201020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0011/M0011_story_00052",
    text_sound_bank = "bank:/voice_cn/sty/M0011_2",
    env_sound = 20003
  },
  [1120102005] = {
    id = 1120102005,
    talk_text = function()
      return T_S(11201020050)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120102006,
    speak_name = function()
      return T_S(11201020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00444",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20003
  },
  [1120102006] = {
    id = 1120102006,
    talk_text = function()
      return T_S(11201020060)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120102006/1120102006_90110008.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120102007,
    speak_name = function()
      return T_S(11201020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0011/M0011_story_00053",
    text_sound_bank = "bank:/voice_cn/sty/M0011_2",
    env_sound = 20003
  },
  [1120102007] = {
    id = 1120102007,
    talk_text = function()
      return T_S(11201020070)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120102007/1120102007_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120102008,
    speak_name = function()
      return T_S(11201020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00445",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20003
  },
  [1120102008] = {
    id = 1120102008,
    talk_text = function()
      return T_S(11201020080)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120102008/1120102008_90110008.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120102009,
    speak_name = function()
      return T_S(11201020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0011/M0011_story_00054",
    text_sound_bank = "bank:/voice_cn/sty/M0011_2",
    env_sound = 20003
  },
  [1120102009] = {
    id = 1120102009,
    talk_text = function()
      return T_S(11201020090)
    end,
    is_master = 1,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1120102010,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00534",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20003
  },
  [1120102010] = {
    id = 1120102010,
    talk_text = function()
      return T_S(11201020100)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120102011,
    speak_name = function()
      return T_S(11201020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00446",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20003
  },
  [1120102011] = {
    id = 1120102011,
    talk_text = function()
      return T_S(11201020110)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120102012,
    speak_name = function()
      return T_S(11201020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0011/M0011_story_00055",
    text_sound_bank = "bank:/voice_cn/sty/M0011_2",
    env_sound = 20003
  },
  [1120102012] = {
    id = 1120102012,
    talk_text = function()
      return T_S(11201020120)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120102012/1120102012_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120102013,
    speak_name = function()
      return T_S(11201020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00447",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20003
  },
  [1120102013] = {
    id = 1120102013,
    talk_text = function()
      return T_S(11201020130)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120102014,
    speak_name = function()
      return T_S(11201020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0011/M0011_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/M0011_2",
    env_sound = 20003
  },
  [1120102014] = {
    id = 1120102014,
    talk_text = function()
      return T_S(11201020140)
    end,
    is_master = 1,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1120102015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00535",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20003
  },
  [1120102015] = {
    id = 1120102015,
    talk_text = function()
      return T_S(11201020150)
    end,
    role_ids = {90110008, 90110004},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120102015/1120102015_90110008.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110008/90110008_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-270:-1170", "235:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(11201020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0011/M0011_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/M0011_2",
    env_sound = 20003
  }
}
