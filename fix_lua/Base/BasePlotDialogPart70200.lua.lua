BasePlotDialogPart70200 = {
  [1140501001] = {
    id = 1140501001,
    talk_text = function()
      return T_S(11405010010)
    end,
    next_dialog = 1140501002,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010015)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00028",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501002] = {
    id = 1140501002,
    talk_text = function()
      return T_S(11405010020)
    end,
    next_dialog = 1140501003,
    env_sound = 20003
  },
  [1140501003] = {
    id = 1140501003,
    talk_text = function()
      return T_S(11405010030)
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
    next_dialog = 1140501004,
    speak_name = function()
      return T_S(11405010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00773",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501004] = {
    id = 1140501004,
    talk_text = function()
      return T_S(11405010040)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501005,
    speak_name = function()
      return T_S(11405010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00462",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20003
  },
  [1140501005] = {
    id = 1140501005,
    talk_text = function()
      return T_S(11405010050)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501005/1140501005_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501006,
    speak_name = function()
      return T_S(11405010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00547",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140501006] = {
    id = 1140501006,
    talk_text = function()
      return T_S(11405010060)
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
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140501007,
    speak_head = 90120043,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11405010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00774",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501007] = {
    id = 1140501007,
    talk_text = function()
      return T_S(11405010070)
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
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501008,
    speak_name = function()
      return T_S(11405010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00548",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140501008] = {
    id = 1140501008,
    talk_text = function()
      return T_S(11405010080)
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
    next_dialog = 1140501009,
    speak_name = function()
      return T_S(11405010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00463",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20003
  },
  [1140501009] = {
    id = 1140501009,
    talk_text = function()
      return T_S(11405010090)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501010,
    speak_name = function()
      return T_S(11405010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00470",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20003
  },
  [1140501010] = {
    id = 1140501010,
    talk_text = function()
      return T_S(11405010100)
    end,
    is_master = 1,
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140501011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00742",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20003
  },
  [1140501011] = {
    id = 1140501011,
    talk_text = function()
      return T_S(11405010110)
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
    next_dialog = 1140501012,
    speak_name = function()
      return T_S(11405010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00359",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20003
  },
  [1140501012] = {
    id = 1140501012,
    talk_text = function()
      return T_S(11405010120)
    end,
    is_master = 1,
    is_os = 1,
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
    next_dialog = 1140501013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00743",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20003
  },
  [1140501013] = {
    id = 1140501013,
    talk_text = function()
      return T_S(11405010130)
    end,
    role_ids = {90110009, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      ""
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      ""
    },
    role_position = {"-270:-1080", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501014,
    speak_name = function()
      return T_S(11405010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00471",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20003
  },
  [1140501014] = {
    id = 1140501014,
    talk_text = function()
      return T_S(11405010140)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501014/1140501014_90110003.playable"
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
    next_dialog = 1140501015,
    speak_name = function()
      return T_S(11405010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00775",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501015] = {
    id = 1140501015,
    talk_text = function()
      return T_S(11405010150)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501015/1140501015_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501016,
    speak_name = function()
      return T_S(11405010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00360",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20003
  },
  [1140501016] = {
    id = 1140501016,
    talk_text = function()
      return T_S(11405010160)
    end,
    next_dialog = 1140501017,
    env_sound = 20003
  },
  [1140501017] = {
    id = 1140501017,
    talk_text = function()
      return T_S(11405010170)
    end,
    next_dialog = 1140501018,
    env_sound = 20003
  },
  [1140501018] = {
    id = 1140501018,
    talk_text = function()
      return T_S(11405010180)
    end,
    next_dialog = 1140501019,
    speak_head = 90120064,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11405010185)
    end,
    camera_shake = {
      "1",
      "0",
      "1100"
    },
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00029",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003,
    top_effect = {"", "0"}
  },
  [1140501019] = {
    id = 1140501019,
    talk_text = function()
      return T_S(11405010190)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140501020,
    speak_name = function()
      return T_S(11405010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00776",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501020] = {
    id = 1140501020,
    talk_text = function()
      return T_S(11405010200)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501021,
    speak_name = function()
      return T_S(11405010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00361",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20003
  },
  [1140501021] = {
    id = 1140501021,
    talk_text = function()
      return T_S(11405010210)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140501022,
    speak_name = function()
      return T_S(11405010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00777",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501022] = {
    id = 1140501022,
    talk_text = function()
      return T_S(11405010220)
    end,
    next_dialog = 1140501023,
    env_sound = 20003
  },
  [1140501023] = {
    id = 1140501023,
    talk_text = function()
      return T_S(11405010230)
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
    role_position = {"-38:-1160"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501024,
    speak_name = function()
      return T_S(11405010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00549",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140501024] = {
    id = 1140501024,
    talk_text = function()
      return T_S(11405010240)
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
    role_position = {"-308:-1160", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501025,
    speak_name = function()
      return T_S(11405010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00362",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20003
  },
  [1140501025] = {
    id = 1140501025,
    talk_text = function()
      return T_S(11405010250)
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
    role_position = {"-308:-1160", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "180"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1140501026,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00744",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20003
  },
  [1140501026] = {
    id = 1140501026,
    talk_text = function()
      return T_S(11405010260)
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
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501027,
    speak_name = function()
      return T_S(11405010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00550",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140501027] = {
    id = 1140501027,
    talk_text = function()
      return T_S(11405010270)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501027/1140501027_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501028,
    speak_name = function()
      return T_S(11405010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00778",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501028] = {
    id = 1140501028,
    talk_text = function()
      return T_S(11405010280)
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
    role_position = {"-308:-1160", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140501029,
    env_sound = 20003
  },
  [1140501029] = {
    id = 1140501029,
    talk_text = function()
      return T_S(11405010290)
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
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1160", "240:-980"},
    role_shake = {"", "1:0:800"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501030,
    speak_name = function()
      return T_S(11405010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00779",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501030] = {
    id = 1140501030,
    talk_text = function()
      return T_S(11405010300)
    end,
    next_dialog = 1140501031,
    env_sound = 20003
  },
  [1140501031] = {
    id = 1140501031,
    talk_text = function()
      return T_S(11405010310)
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
    next_dialog = 1140501032,
    speak_name = function()
      return T_S(11405010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00472",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20003
  },
  [1140501032] = {
    id = 1140501032,
    talk_text = function()
      return T_S(11405010320)
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
    next_dialog = 1140501033,
    speak_name = function()
      return T_S(11405010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00551",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140501033] = {
    id = 1140501033,
    talk_text = function()
      return T_S(11405010330)
    end,
    next_dialog = 1140501034,
    speak_head = 90120064,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11405010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00030",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501034] = {
    id = 1140501034,
    talk_text = function()
      return T_S(11405010340)
    end,
    next_dialog = 1140501035,
    speak_head = 90120064,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11405010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00031",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501035] = {
    id = 1140501035,
    talk_text = function()
      return T_S(11405010350)
    end,
    next_dialog = 1140501036,
    env_sound = 20003
  },
  [1140501036] = {
    id = 1140501036,
    talk_text = function()
      return T_S(11405010360)
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
    role_position = {"-38:-1160"},
    role_shake = {"2:0:1200"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501037,
    speak_name = function()
      return T_S(11405010365)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00552",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140501037] = {
    id = 1140501037,
    talk_text = function()
      return T_S(11405010370)
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
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1140501038,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00745",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20003
  },
  [1140501038] = {
    id = 1140501038,
    talk_text = function()
      return T_S(11405010380)
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
    role_position = {"-38:-1160"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501039,
    speak_name = function()
      return T_S(11405010385)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00553",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140501039] = {
    id = 1140501039,
    talk_text = function()
      return T_S(11405010390)
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
    next_dialog = 1140501040,
    speak_name = function()
      return T_S(11405010395)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00780",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501040] = {
    id = 1140501040,
    talk_text = function()
      return T_S(11405010400)
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
    next_dialog = 1140501041,
    env_sound = 20003
  },
  [1140501041] = {
    id = 1140501041,
    talk_text = function()
      return T_S(11405010410)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501042,
    speak_name = function()
      return T_S(11405010415)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00363",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20003
  },
  [1140501042] = {
    id = 1140501042,
    talk_text = function()
      return T_S(11405010420)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501042/1140501042_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140501043,
    speak_name = function()
      return T_S(11405010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00781",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501043] = {
    id = 1140501043,
    talk_text = function()
      return T_S(11405010430)
    end,
    next_dialog = 1140501044,
    env_sound = 20003
  },
  [1140501044] = {
    id = 1140501044,
    talk_text = function()
      return T_S(11405010440)
    end,
    next_dialog = 1140501045,
    speak_head = 90120042,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11405010445)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00473",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20003
  },
  [1140501045] = {
    id = 1140501045,
    talk_text = function()
      return T_S(11405010450)
    end,
    next_dialog = 1140501046,
    env_sound = 20003
  },
  [1140501046] = {
    id = 1140501046,
    talk_text = function()
      return T_S(11405010460)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501046/1140501046_90110003.playable"
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
    next_dialog = 1140501047,
    speak_name = function()
      return T_S(11405010465)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00782",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501047] = {
    id = 1140501047,
    talk_text = function()
      return T_S(11405010470)
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
    next_dialog = 1140501048,
    camera_shake = {
      "1",
      "0",
      "800"
    },
    env_sound = 20003
  },
  [1140501048] = {
    id = 1140501048,
    talk_text = function()
      return T_S(11405010480)
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
    next_dialog = 1140501049,
    env_sound = 20003
  },
  [1140501049] = {
    id = 1140501049,
    talk_text = function()
      return T_S(11405010490)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501049/1140501049_90110003.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501050,
    speak_name = function()
      return T_S(11405010495)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00783",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501050] = {
    id = 1140501050,
    talk_text = function()
      return T_S(11405010500)
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
    role_position = {"-200:-1120", "170:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140501051,
    env_sound = 20003
  },
  [1140501051] = {
    id = 1140501051,
    talk_text = function()
      return T_S(11405010510)
    end,
    is_os = 1,
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
    role_position = {"-200:-1120", "170:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140501052,
    speak_name = function()
      return T_S(11405010515)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00784",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501052] = {
    id = 1140501052,
    talk_text = function()
      return T_S(11405010520)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140501052/1140501052_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"0:-1000"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140501053,
    speak_name = function()
      return T_S(11405010525)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00464",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20003
  },
  [1140501053] = {
    id = 1140501053,
    talk_text = function()
      return T_S(11405010530)
    end,
    next_dialog = 1140501054,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010535)
    end,
    camera_shake = {
      "1",
      "0",
      "1800"
    },
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00032",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501054] = {
    id = 1140501054,
    talk_text = function()
      return T_S(11405010540)
    end,
    next_dialog = 1140501055,
    env_sound = 20003
  },
  [1140501055] = {
    id = 1140501055,
    talk_text = function()
      return T_S(11405010550)
    end,
    next_dialog = 1140501056,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010555)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00033",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501056] = {
    id = 1140501056,
    talk_text = function()
      return T_S(11405010560)
    end,
    next_dialog = 1140501057,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010565)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00034",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501057] = {
    id = 1140501057,
    talk_text = function()
      return T_S(11405010570)
    end,
    next_dialog = 1140501058,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010575)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00035",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501058] = {
    id = 1140501058,
    talk_text = function()
      return T_S(11405010580)
    end,
    next_dialog = 1140501059,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010585)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00036",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501059] = {
    id = 1140501059,
    talk_text = function()
      return T_S(11405010590)
    end,
    next_dialog = 1140501060,
    speak_head = 90120067,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11405010595)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00037",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501060] = {
    id = 1140501060,
    talk_text = function()
      return T_S(11405010600)
    end,
    next_dialog = 1140501061,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010605)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00038",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501061] = {
    id = 1140501061,
    talk_text = function()
      return T_S(11405010610)
    end,
    next_dialog = 1140501062,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010615)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00039",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501062] = {
    id = 1140501062,
    talk_text = function()
      return T_S(11405010620)
    end,
    next_dialog = 1140501063,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010625)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00040",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501063] = {
    id = 1140501063,
    talk_text = function()
      return T_S(11405010630)
    end,
    next_dialog = 1140501064,
    speak_head = 90120067,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11405010635)
    end,
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00041",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003
  },
  [1140501064] = {
    id = 1140501064,
    talk_text = function()
      return T_S(11405010640)
    end,
    is_master = 1,
    next_dialog = 1140501065,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00746",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20003
  },
  [1140501065] = {
    id = 1140501065,
    talk_text = function()
      return T_S(11405010650)
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
    next_dialog = 1140501066,
    speak_name = function()
      return T_S(11405010655)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00785",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20003
  },
  [1140501066] = {
    id = 1140501066,
    talk_text = function()
      return T_S(11405010660)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140501067,
    speak_name = function()
      return T_S(11405010665)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00465",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20003
  },
  [1140501067] = {
    id = 1140501067,
    talk_text = function()
      return T_S(11405010670)
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
    next_dialog = 1140501068,
    speak_name = function()
      return T_S(11405010675)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00474",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20003
  },
  [1140501068] = {
    id = 1140501068,
    talk_text = function()
      return T_S(11405010680)
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
    speak_name = function()
      return T_S(11405010685)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00554",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20003
  },
  [1140502001] = {
    id = 1140502001,
    middle_text = function()
      return T_S(11405020013)
    end,
    speak_name = function()
      return T_S(11405020015)
    end,
    camera_shake = {
      "2",
      "0",
      "1800"
    },
    text_sound_path = "event:/voice_cn/story/M0028/M0028_story_00042",
    text_sound_bank = "bank:/voice_cn/sty/M0028_14th",
    env_sound = 20003,
    review_head = "90210001"
  }
}
