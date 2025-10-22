BasePlotDialogPart65000 = {
  [1130101001] = {
    id = 1130101001,
    talk_text = function()
      return T_S(11301010010)
    end,
    next_dialog = 1130101002,
    camera_shake = {
      "1",
      "0",
      "1200"
    },
    env_sound = 20001
  },
  [1130101002] = {
    id = 1130101002,
    talk_text = function()
      return T_S(11301010020)
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
    next_dialog = 1130101003,
    speak_name = function()
      return T_S(11301010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00392",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20001
  },
  [1130101003] = {
    id = 1130101003,
    talk_text = function()
      return T_S(11301010030)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130101003/1130101003_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1066", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101004,
    speak_name = function()
      return T_S(11301010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00655",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20001
  },
  [1130101004] = {
    id = 1130101004,
    talk_text = function()
      return T_S(11301010040)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130101004/1130101004_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1066", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130101005,
    speak_name = function()
      return T_S(11301010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00393",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20001
  },
  [1130101005] = {
    id = 1130101005,
    talk_text = function()
      return T_S(11301010050)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1066", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101006,
    speak_name = function()
      return T_S(11301010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00656",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20001
  },
  [1130101006] = {
    id = 1130101006,
    talk_text = function()
      return T_S(11301010060)
    end,
    next_dialog = 1130101007,
    env_sound = 20001
  },
  [1130101007] = {
    id = 1130101007,
    talk_text = function()
      return T_S(11301010070)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130101008,
    speak_name = function()
      return T_S(11301010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00105",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130101008] = {
    id = 1130101008,
    talk_text = function()
      return T_S(11301010080)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-700", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101009,
    speak_name = function()
      return T_S(11301010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00403",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20001
  },
  [1130101009] = {
    id = 1130101009,
    talk_text = function()
      return T_S(11301010090)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130101009/1130101009_90110007.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-700", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130101010,
    speak_name = function()
      return T_S(11301010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00106",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130101010] = {
    id = 1130101010,
    talk_text = function()
      return T_S(11301010100)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130101010/1130101010_90110002.playable"
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
    next_dialog = 1130101011,
    speak_name = function()
      return T_S(11301010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00394",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20001
  },
  [1130101011] = {
    id = 1130101011,
    talk_text = function()
      return T_S(11301010110)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"210:-1066", "-210:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101012,
    speak_name = function()
      return T_S(11301010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00107",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130101012] = {
    id = 1130101012,
    talk_text = function()
      return T_S(11301010120)
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
    next_dialog = 1130101013,
    speak_name = function()
      return T_S(11301010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00657",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20001
  },
  [1130101013] = {
    id = 1130101013,
    talk_text = function()
      return T_S(11301010130)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130101013/1130101013_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130101014,
    speak_name = function()
      return T_S(11301010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00658",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20001
  },
  [1130101014] = {
    id = 1130101014,
    talk_text = function()
      return T_S(11301010140)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"210:-1066", "-210:-700"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101015,
    speak_name = function()
      return T_S(11301010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00107_01",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130101015] = {
    id = 1130101015,
    talk_text = function()
      return T_S(11301010150)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"210:-1066", "-210:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101016,
    speak_name = function()
      return T_S(11301010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00108",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130101016] = {
    id = 1130101016,
    talk_text = function()
      return T_S(11301010160)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"210:-1066", "-210:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130101017,
    speak_name = function()
      return T_S(11301010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00395",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20001
  },
  [1130101017] = {
    id = 1130101017,
    talk_text = function()
      return T_S(11301010170)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130101017/1130101017_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"210:-1066", "-210:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101018,
    speak_name = function()
      return T_S(11301010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00109",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130101018] = {
    id = 1130101018,
    talk_text = function()
      return T_S(11301010180)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130101018/1130101018_90110002.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"210:-1066", "-210:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130101019,
    speak_name = function()
      return T_S(11301010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00396",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20001
  },
  [1130101019] = {
    id = 1130101019,
    talk_text = function()
      return T_S(11301010190)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"210:-1066", "-210:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130101020,
    speak_name = function()
      return T_S(11301010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00397",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20001
  },
  [1130101020] = {
    id = 1130101020,
    talk_text = function()
      return T_S(11301010200)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130101021,
    speak_name = function()
      return T_S(11301010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00404",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20001
  },
  [1130101021] = {
    id = 1130101021,
    talk_text = function()
      return T_S(11301010210)
    end,
    next_dialog = 1130101022,
    camera_shake = {
      "2",
      "0",
      "1300"
    },
    env_sound = 20001
  },
  [1130101022] = {
    id = 1130101022,
    talk_text = function()
      return T_S(11301010220)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130101023,
    speak_name = function()
      return T_S(11301010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00110",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130101023] = {
    id = 1130101023,
    talk_text = function()
      return T_S(11301010230)
    end,
    role_ids = {90110007, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-700", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130101024,
    speak_name = function()
      return T_S(11301010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00405",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20001
  },
  [1130101024] = {
    id = 1130101024,
    talk_text = function()
      return T_S(11301010240)
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
    next_dialog = 1130101025,
    speak_name = function()
      return T_S(11301010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00398",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20001
  },
  [1130101025] = {
    id = 1130101025,
    talk_text = function()
      return T_S(11301010250)
    end,
    role_ids = {90110002, 90110007},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"270:-1066", "-270:-700"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(11301010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00111",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20001
  },
  [1130102001] = {
    id = 1130102001,
    talk_text = function()
      return T_S(11301020010)
    end,
    next_dialog = 1130102002,
    speak_head = 90120008,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11301020015)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00056",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102002] = {
    id = 1130102002,
    talk_text = function()
      return T_S(11301020020)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130102002/1130102002_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102003,
    speak_name = function()
      return T_S(11301020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00112",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102003] = {
    id = 1130102003,
    talk_text = function()
      return T_S(11301020030)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130102004,
    speak_name = function()
      return T_S(11301020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00057",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102004] = {
    id = 1130102004,
    talk_text = function()
      return T_S(11301020040)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102005,
    speak_name = function()
      return T_S(11301020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00113",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102005] = {
    id = 1130102005,
    talk_text = function()
      return T_S(11301020050)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130102006,
    speak_name = function()
      return T_S(11301020055)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00058",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102006] = {
    id = 1130102006,
    talk_text = function()
      return T_S(11301020060)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130102006/1130102006_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102007,
    speak_name = function()
      return T_S(11301020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00114",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102007] = {
    id = 1130102007,
    talk_text = function()
      return T_S(11301020070)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130102008,
    speak_name = function()
      return T_S(11301020075)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00059",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102008] = {
    id = 1130102008,
    talk_text = function()
      return T_S(11301020080)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102009,
    speak_name = function()
      return T_S(11301020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00115",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102009] = {
    id = 1130102009,
    talk_text = function()
      return T_S(11301020090)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102010,
    speak_name = function()
      return T_S(11301020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00116",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102010] = {
    id = 1130102010,
    talk_text = function()
      return T_S(11301020100)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102011,
    speak_name = function()
      return T_S(11301020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00117",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102011] = {
    id = 1130102011,
    talk_text = function()
      return T_S(11301020110)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130102012,
    speak_name = function()
      return T_S(11301020115)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00060",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102012] = {
    id = 1130102012,
    talk_text = function()
      return T_S(11301020120)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130102012/1130102012_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102013,
    speak_name = function()
      return T_S(11301020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00118",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102013] = {
    id = 1130102013,
    talk_text = function()
      return T_S(11301020130)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130102014,
    speak_name = function()
      return T_S(11301020135)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102014] = {
    id = 1130102014,
    talk_text = function()
      return T_S(11301020140)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130102014/1130102014_90110007.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102015,
    speak_name = function()
      return T_S(11301020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00119",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102015] = {
    id = 1130102015,
    talk_text = function()
      return T_S(11301020150)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130102016,
    speak_name = function()
      return T_S(11301020155)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102016] = {
    id = 1130102016,
    talk_text = function()
      return T_S(11301020160)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130102017,
    speak_name = function()
      return T_S(11301020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00120",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  },
  [1130102017] = {
    id = 1130102017,
    talk_text = function()
      return T_S(11301020170)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130102018,
    speak_name = function()
      return T_S(11301020175)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00063",
    text_sound_bank = "bank:/voice_cn/sty/S0020_2",
    env_sound = 20009
  },
  [1130102018] = {
    id = 1130102018,
    talk_text = function()
      return T_S(11301020180)
    end,
    role_ids = {90110007},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable"
    },
    role_position = {"0:-700"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11301020185)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00121",
    text_sound_bank = "bank:/voice_cn/sty/M0017_3",
    env_sound = 20009
  }
}
