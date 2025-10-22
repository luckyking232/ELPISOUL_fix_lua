BasePlotDialogPart70000 = {
  [1140101001] = {
    id = 1140101001,
    talk_text = function()
      return T_S(11401010010)
    end,
    next_dialog = 1140101002,
    env_sound = 20009
  },
  [1140101002] = {
    id = 1140101002,
    talk_text = function()
      return T_S(11401010020)
    end,
    next_dialog = 1140101003,
    env_sound = 20009
  },
  [1140101003] = {
    id = 1140101003,
    talk_text = function()
      return T_S(11401010030)
    end,
    next_dialog = 1140101004,
    env_sound = 20009
  },
  [1140101004] = {
    id = 1140101004,
    talk_text = function()
      return T_S(11401010040)
    end,
    next_dialog = 1140101005,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010045)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101005] = {
    id = 1140101005,
    talk_text = function()
      return T_S(11401010050)
    end,
    next_dialog = 1140101006,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010055)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101006] = {
    id = 1140101006,
    talk_text = function()
      return T_S(11401010060)
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
    next_dialog = 1140101007,
    speak_name = function()
      return T_S(11401010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00319",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101007] = {
    id = 1140101007,
    talk_text = function()
      return T_S(11401010070)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101007/1140101007_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1080", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101008,
    speak_name = function()
      return T_S(11401010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00735",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101008] = {
    id = 1140101008,
    talk_text = function()
      return T_S(11401010080)
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
    next_dialog = 1140101009,
    speak_name = function()
      return T_S(11401010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00521",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20009
  },
  [1140101009] = {
    id = 1140101009,
    talk_text = function()
      return T_S(11401010090)
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
    next_dialog = 1140101010,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010095)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101010] = {
    id = 1140101010,
    talk_text = function()
      return T_S(11401010100)
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
    next_dialog = 1140101011,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010105)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101011] = {
    id = 1140101011,
    talk_text = function()
      return T_S(11401010110)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101011/1140101011_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101012,
    speak_name = function()
      return T_S(11401010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00736",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101012] = {
    id = 1140101012,
    talk_text = function()
      return T_S(11401010120)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101013,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010125)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101013] = {
    id = 1140101013,
    talk_text = function()
      return T_S(11401010130)
    end,
    is_master = 1,
    next_dialog = 1140101014,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00682",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101014] = {
    id = 1140101014,
    talk_text = function()
      return T_S(11401010140)
    end,
    next_dialog = 1140101015,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010145)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101015] = {
    id = 1140101015,
    talk_text = function()
      return T_S(11401010150)
    end,
    next_dialog = 1140101016,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010155)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101016] = {
    id = 1140101016,
    talk_text = function()
      return T_S(11401010160)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101016/1140101016_90110002.playable"
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
    next_dialog = 1140101017,
    speak_name = function()
      return T_S(11401010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00446",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20009
  },
  [1140101017] = {
    id = 1140101017,
    talk_text = function()
      return T_S(11401010170)
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
    next_dialog = 1140101018,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010175)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101018] = {
    id = 1140101018,
    talk_text = function()
      return T_S(11401010180)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140101019,
    speak_name = function()
      return T_S(11401010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00447",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20009
  },
  [1140101019] = {
    id = 1140101019,
    talk_text = function()
      return T_S(11401010190)
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
    next_dialog = 1140101020,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010195)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101020] = {
    id = 1140101020,
    talk_text = function()
      return T_S(11401010200)
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
    next_dialog = 1140101021,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010205)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101021] = {
    id = 1140101021,
    talk_text = function()
      return T_S(11401010210)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101021/1140101021_90110002.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140101022,
    speak_name = function()
      return T_S(11401010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00448",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20009
  },
  [1140101022] = {
    id = 1140101022,
    talk_text = function()
      return T_S(11401010220)
    end,
    role_ids = {90110002, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101022/1140101022_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-1066", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101023,
    speak_name = function()
      return T_S(11401010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00320",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101023] = {
    id = 1140101023,
    talk_text = function()
      return T_S(11401010230)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101024,
    speak_name = function()
      return T_S(11401010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00321",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101024] = {
    id = 1140101024,
    talk_text = function()
      return T_S(11401010240)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101025,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010245)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101025] = {
    id = 1140101025,
    talk_text = function()
      return T_S(11401010250)
    end,
    next_dialog = 1140101026,
    env_sound = 20009
  },
  [1140101026] = {
    id = 1140101026,
    talk_text = function()
      return T_S(11401010260)
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
    next_dialog = 1140101027,
    speak_name = function()
      return T_S(11401010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00522",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20009
  },
  [1140101027] = {
    id = 1140101027,
    talk_text = function()
      return T_S(11401010270)
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
    next_dialog = 1140101028,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010275)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101028] = {
    id = 1140101028,
    talk_text = function()
      return T_S(11401010280)
    end,
    next_dialog = 1140101029,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010285)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101029] = {
    id = 1140101029,
    talk_text = function()
      return T_S(11401010290)
    end,
    next_dialog = 1140101030,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010295)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101030] = {
    id = 1140101030,
    talk_text = function()
      return T_S(11401010300)
    end,
    next_dialog = 1140101031,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010305)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00017",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101031] = {
    id = 1140101031,
    talk_text = function()
      return T_S(11401010310)
    end,
    next_dialog = 1140101032,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010315)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00018",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101032] = {
    id = 1140101032,
    talk_text = function()
      return T_S(11401010320)
    end,
    next_dialog = 1140101033,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010325)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00019",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101033] = {
    id = 1140101033,
    talk_text = function()
      return T_S(11401010330)
    end,
    next_dialog = 1140101034,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010335)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00020",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101034] = {
    id = 1140101034,
    talk_text = function()
      return T_S(11401010340)
    end,
    next_dialog = 1140101035,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010345)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00021",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101035] = {
    id = 1140101035,
    talk_text = function()
      return T_S(11401010350)
    end,
    next_dialog = 1140101036,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010355)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101036] = {
    id = 1140101036,
    talk_text = function()
      return T_S(11401010360)
    end,
    is_master = 1,
    next_dialog = 1140101037,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00683",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101037] = {
    id = 1140101037,
    talk_text = function()
      return T_S(11401010370)
    end,
    is_master = 1,
    next_dialog = 1140101038,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00684",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101038] = {
    id = 1140101038,
    talk_text = function()
      return T_S(11401010380)
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
    next_dialog = 1140101039,
    speak_name = function()
      return T_S(11401010385)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00737",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101039] = {
    id = 1140101039,
    talk_text = function()
      return T_S(11401010390)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101040,
    speak_name = function()
      return T_S(11401010395)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00523",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20009
  },
  [1140101040] = {
    id = 1140101040,
    talk_text = function()
      return T_S(11401010400)
    end,
    role_ids = {90110003, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"240:-980", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140101041,
    speak_name = function()
      return T_S(11401010405)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00738",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101041] = {
    id = 1140101041,
    talk_text = function()
      return T_S(11401010410)
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
    next_dialog = 1140101042,
    speak_name = function()
      return T_S(11401010415)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00442",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20009
  },
  [1140101042] = {
    id = 1140101042,
    talk_text = function()
      return T_S(11401010420)
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
    next_dialog = 1140101043,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010425)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00023",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101043] = {
    id = 1140101043,
    talk_text = function()
      return T_S(11401010430)
    end,
    is_master = 1,
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
    next_dialog = 1140101044,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00685",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101044] = {
    id = 1140101044,
    talk_text = function()
      return T_S(11401010440)
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
    next_dialog = 1140101045,
    env_sound = 20009
  },
  [1140101045] = {
    id = 1140101045,
    talk_text = function()
      return T_S(11401010450)
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
    next_dialog = 1140101046,
    env_sound = 20009
  },
  [1140101046] = {
    id = 1140101046,
    talk_text = function()
      return T_S(11401010460)
    end,
    is_master = 1,
    is_os = 1,
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
    next_dialog = 1140101047,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00686",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101047] = {
    id = 1140101047,
    talk_text = function()
      return T_S(11401010470)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140101048,
    speak_name = function()
      return T_S(11401010475)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00443",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20009
  },
  [1140101048] = {
    id = 1140101048,
    talk_text = function()
      return T_S(11401010480)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101049,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010485)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00024",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101049] = {
    id = 1140101049,
    talk_text = function()
      return T_S(11401010490)
    end,
    next_dialog = 1140101050,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010495)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00025",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101050] = {
    id = 1140101050,
    talk_text = function()
      return T_S(11401010500)
    end,
    next_dialog = 1140101051,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010505)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101051] = {
    id = 1140101051,
    talk_text = function()
      return T_S(11401010510)
    end,
    next_dialog = 1140101052,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010515)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101052] = {
    id = 1140101052,
    talk_text = function()
      return T_S(11401010520)
    end,
    next_dialog = 1140101053,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010525)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101053] = {
    id = 1140101053,
    talk_text = function()
      return T_S(11401010530)
    end,
    next_dialog = 1140101054,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010535)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00029",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101054] = {
    id = 1140101054,
    talk_text = function()
      return T_S(11401010540)
    end,
    next_dialog = 1140101055,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010545)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101055] = {
    id = 1140101055,
    talk_text = function()
      return T_S(11401010550)
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
    next_dialog = 1140101056,
    speak_name = function()
      return T_S(11401010555)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00322",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101056] = {
    id = 1140101056,
    talk_text = function()
      return T_S(11401010560)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140101057,
    speak_name = function()
      return T_S(11401010565)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00323",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101057] = {
    id = 1140101057,
    talk_text = function()
      return T_S(11401010570)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101058,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010575)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00031",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101058] = {
    id = 1140101058,
    talk_text = function()
      return T_S(11401010580)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101059,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010585)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101059] = {
    id = 1140101059,
    talk_text = function()
      return T_S(11401010590)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101060,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010595)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00033",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101060] = {
    id = 1140101060,
    talk_text = function()
      return T_S(11401010600)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101060/1140101060_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140101061,
    speak_name = function()
      return T_S(11401010605)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00324",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101061] = {
    id = 1140101061,
    talk_text = function()
      return T_S(11401010610)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101062,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010615)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00034",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101062] = {
    id = 1140101062,
    talk_text = function()
      return T_S(11401010620)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101063,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010625)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00035",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101063] = {
    id = 1140101063,
    talk_text = function()
      return T_S(11401010630)
    end,
    next_dialog = 1140101064,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010635)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101064] = {
    id = 1140101064,
    talk_text = function()
      return T_S(11401010640)
    end,
    next_dialog = 1140101065,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010645)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00037",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101065] = {
    id = 1140101065,
    talk_text = function()
      return T_S(11401010650)
    end,
    next_dialog = 1140101066,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010655)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00038",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101066] = {
    id = 1140101066,
    talk_text = function()
      return T_S(11401010660)
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
    next_dialog = 1140101067,
    speak_name = function()
      return T_S(11401010665)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00449",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20009
  },
  [1140101067] = {
    id = 1140101067,
    talk_text = function()
      return T_S(11401010670)
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
    next_dialog = 1140101068,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010675)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00039",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101068] = {
    id = 1140101068,
    talk_text = function()
      return T_S(11401010680)
    end,
    next_dialog = 1140101069,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010685)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00040",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101069] = {
    id = 1140101069,
    talk_text = function()
      return T_S(11401010690)
    end,
    next_dialog = 1140101070,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010695)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00041",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101070] = {
    id = 1140101070,
    talk_text = function()
      return T_S(11401010700)
    end,
    is_master = 1,
    next_dialog = 1140101071,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00687",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101071] = {
    id = 1140101071,
    talk_text = function()
      return T_S(11401010710)
    end,
    is_master = 1,
    next_dialog = 1140101072,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00688",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101072] = {
    id = 1140101072,
    talk_text = function()
      return T_S(11401010720)
    end,
    next_dialog = 1140101073,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010725)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00042",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101073] = {
    id = 1140101073,
    talk_text = function()
      return T_S(11401010730)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101073/1140101073_90110003.playable"
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
    next_dialog = 1140101074,
    speak_name = function()
      return T_S(11401010735)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00739",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101074] = {
    id = 1140101074,
    talk_text = function()
      return T_S(11401010740)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101075,
    speak_name = function()
      return T_S(11401010745)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00325",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101075] = {
    id = 1140101075,
    talk_text = function()
      return T_S(11401010750)
    end,
    role_ids = {90110009, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1080", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101076,
    speak_name = function()
      return T_S(11401010755)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00450",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20009
  },
  [1140101076] = {
    id = 1140101076,
    talk_text = function()
      return T_S(11401010760)
    end,
    role_ids = {90110009, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1080", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140101077,
    speak_name = function()
      return T_S(11401010765)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00326",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101077] = {
    id = 1140101077,
    talk_text = function()
      return T_S(11401010770)
    end,
    is_master = 1,
    next_dialog = 1140101078,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00689",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101078] = {
    id = 1140101078,
    talk_text = function()
      return T_S(11401010780)
    end,
    next_dialog = 1140101079,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010785)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00043",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101079] = {
    id = 1140101079,
    talk_text = function()
      return T_S(11401010790)
    end,
    is_master = 1,
    next_dialog = 1140101080,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00690",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101080] = {
    id = 1140101080,
    talk_text = function()
      return T_S(11401010800)
    end,
    next_dialog = 1140101081,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010805)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00044",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101081] = {
    id = 1140101081,
    talk_text = function()
      return T_S(11401010810)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101081/1140101081_90110003.playable"
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
    next_dialog = 1140101082,
    speak_name = function()
      return T_S(11401010815)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00740",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101082] = {
    id = 1140101082,
    talk_text = function()
      return T_S(11401010820)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101083,
    speak_name = function()
      return T_S(11401010825)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00444",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20009
  },
  [1140101083] = {
    id = 1140101083,
    talk_text = function()
      return T_S(11401010830)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101084,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010835)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00045",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101084] = {
    id = 1140101084,
    talk_text = function()
      return T_S(11401010840)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101085,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010845)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00046",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101085] = {
    id = 1140101085,
    talk_text = function()
      return T_S(11401010850)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101085/1140101085_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140101086,
    speak_name = function()
      return T_S(11401010855)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00741",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101086] = {
    id = 1140101086,
    talk_text = function()
      return T_S(11401010860)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101087,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010865)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00047",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101087] = {
    id = 1140101087,
    talk_text = function()
      return T_S(11401010870)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140101088,
    speak_name = function()
      return T_S(11401010875)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00742",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101088] = {
    id = 1140101088,
    talk_text = function()
      return T_S(11401010880)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101089,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010885)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00048",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101089] = {
    id = 1140101089,
    talk_text = function()
      return T_S(11401010890)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101090,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010895)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00049",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101090] = {
    id = 1140101090,
    talk_text = function()
      return T_S(11401010900)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101090/1140101090_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140101091,
    speak_name = function()
      return T_S(11401010905)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00743",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20009
  },
  [1140101091] = {
    id = 1140101091,
    talk_text = function()
      return T_S(11401010910)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101092,
    speak_name = function()
      return T_S(11401010915)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00445",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20009
  },
  [1140101092] = {
    id = 1140101092,
    talk_text = function()
      return T_S(11401010920)
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
    role_position = {"-300:-980", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101093,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010925)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00050",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101093] = {
    id = 1140101093,
    talk_text = function()
      return T_S(11401010930)
    end,
    next_dialog = 1140101094,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401010935)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00051",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101094] = {
    id = 1140101094,
    talk_text = function()
      return T_S(11401010940)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101094/1140101094_90110009.playable"
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
    next_dialog = 1140101095,
    speak_name = function()
      return T_S(11401010945)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00327",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101095] = {
    id = 1140101095,
    talk_text = function()
      return T_S(11401010950)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101096,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010955)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00052",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101096] = {
    id = 1140101096,
    talk_text = function()
      return T_S(11401010960)
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
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140101097,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010965)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00053",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101097] = {
    id = 1140101097,
    talk_text = function()
      return T_S(11401010970)
    end,
    is_master = 1,
    next_dialog = 1140101098,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00691",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101098] = {
    id = 1140101098,
    talk_text = function()
      return T_S(11401010980)
    end,
    is_master = 1,
    next_dialog = 1140101099,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00692",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  },
  [1140101099] = {
    id = 1140101099,
    talk_text = function()
      return T_S(11401010990)
    end,
    next_dialog = 1140101100,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401010995)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00054",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101100] = {
    id = 1140101100,
    talk_text = function()
      return T_S(11401011000)
    end,
    next_dialog = 1140101101,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401011005)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00055",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101101] = {
    id = 1140101101,
    talk_text = function()
      return T_S(11401011010)
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
    next_dialog = 1140101102,
    speak_name = function()
      return T_S(11401011015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00524",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20009
  },
  [1140101102] = {
    id = 1140101102,
    talk_text = function()
      return T_S(11401011020)
    end,
    role_ids = {90110004, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140101102/1140101102_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-308:-1165", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101103,
    speak_name = function()
      return T_S(11401011025)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00328",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101103] = {
    id = 1140101103,
    talk_text = function()
      return T_S(11401011030)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140101104,
    speak_name = function()
      return T_S(11401011035)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00329",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20009
  },
  [1140101104] = {
    id = 1140101104,
    talk_text = function()
      return T_S(11401011040)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101105,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11401011045)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101105] = {
    id = 1140101105,
    talk_text = function()
      return T_S(11401011050)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140101106,
    speak_head = 90120072,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11401011055)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20009
  },
  [1140101106] = {
    id = 1140101106,
    talk_text = function()
      return T_S(11401011060)
    end,
    is_master = 1,
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00693",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20009
  }
}
