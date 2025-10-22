BasePlotDialogPart65151 = {
  [1130403001] = {
    id = 1130403001,
    talk_text = function()
      return T_S(11304030010)
    end,
    next_dialog = 1130403002,
    env_sound = 20005
  },
  [1130403002] = {
    id = 1130403002,
    talk_text = function()
      return T_S(11304030020)
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
    next_dialog = 1130403003,
    speak_name = function()
      return T_S(11304030025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00426",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20005
  },
  [1130403003] = {
    id = 1130403003,
    talk_text = function()
      return T_S(11304030030)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130403003/1130403003_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130403004,
    speak_name = function()
      return T_S(11304030035)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00422",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20005
  },
  [1130403004] = {
    id = 1130403004,
    talk_text = function()
      return T_S(11304030040)
    end,
    is_master = 1,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130403005,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00657",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20005
  },
  [1130403005] = {
    id = 1130403005,
    talk_text = function()
      return T_S(11304030050)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130403005/1130403005_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-30:-980"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"2"},
    effect_out_param = {"180"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130403006,
    speak_name = function()
      return T_S(11304030055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00699",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20005
  },
  [1130403006] = {
    id = 1130403006,
    talk_text = function()
      return T_S(11304030060)
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
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130403007,
    speak_name = function()
      return T_S(11304030065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00427",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20005
  },
  [1130403007] = {
    id = 1130403007,
    talk_text = function()
      return T_S(11304030070)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-1066", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130403008,
    speak_name = function()
      return T_S(11304030075)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00423",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20005
  },
  [1130403008] = {
    id = 1130403008,
    talk_text = function()
      return T_S(11304030080)
    end,
    is_master = 1,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-1066", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130403009,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00658",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20005
  },
  [1130403009] = {
    id = 1130403009,
    talk_text = function()
      return T_S(11304030090)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-270:-1066", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "2"},
    effect_out_param = {"150", "210"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130403010,
    speak_name = function()
      return T_S(11304030095)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00424",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20005
  },
  [1130403010] = {
    id = 1130403010,
    talk_text = function()
      return T_S(11304030100)
    end,
    is_master = 1,
    next_dialog = 1130403011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00659",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20005
  },
  [1130403011] = {
    id = 1130403011,
    talk_text = function()
      return T_S(11304030110)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130403012,
    speak_name = function()
      return T_S(11304030115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00500",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20005
  },
  [1130403012] = {
    id = 1130403012,
    talk_text = function()
      return T_S(11304030120)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130403012/1130403012_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130403013,
    speak_name = function()
      return T_S(11304030125)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00293",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20005
  },
  [1130403013] = {
    id = 1130403013,
    talk_text = function()
      return T_S(11304030130)
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
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(11304030135)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00063",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20005
  },
  [1130404001] = {
    id = 1130404001,
    talk_text = function()
      return T_S(11304040010)
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
    next_dialog = 1130404002,
    speak_name = function()
      return T_S(11304040015)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00501",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404002] = {
    id = 1130404002,
    talk_text = function()
      return T_S(11304040020)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130404002/1130404002_90110004.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130404003,
    speak_name = function()
      return T_S(11304040025)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00502",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404003] = {
    id = 1130404003,
    talk_text = function()
      return T_S(11304040030)
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
    next_dialog = 1130404004,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00660",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130404004] = {
    id = 1130404004,
    talk_text = function()
      return T_S(11304040040)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130404005,
    speak_name = function()
      return T_S(11304040045)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00503",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404005] = {
    id = 1130404005,
    talk_text = function()
      return T_S(11304040050)
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
    next_dialog = 1130404006,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00661",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130404006] = {
    id = 1130404006,
    talk_text = function()
      return T_S(11304040060)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130404006/1130404006_90110004.playable"
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130404007,
    speak_name = function()
      return T_S(11304040065)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00504",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404007] = {
    id = 1130404007,
    talk_text = function()
      return T_S(11304040070)
    end,
    next_dialog = 1130404008,
    env_sound = 20007
  },
  [1130404008] = {
    id = 1130404008,
    talk_text = function()
      return T_S(11304040080)
    end,
    next_dialog = 1130404009,
    env_sound = 20007
  },
  [1130404009] = {
    id = 1130404009,
    talk_text = function()
      return T_S(11304040090)
    end,
    next_dialog = 1130404010,
    env_sound = 20007
  },
  [1130404010] = {
    id = 1130404010,
    talk_text = function()
      return T_S(11304040100)
    end,
    next_dialog = 1130404011,
    env_sound = 20007
  },
  [1130404011] = {
    id = 1130404011,
    talk_text = function()
      return T_S(11304040110)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130404011/1130404011_90110004.playable"
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
    next_dialog = 1130404012,
    speak_name = function()
      return T_S(11304040115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00505",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404012] = {
    id = 1130404012,
    talk_text = function()
      return T_S(11304040120)
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
    next_dialog = 1130404013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00662",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130404013] = {
    id = 1130404013,
    talk_text = function()
      return T_S(11304040130)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130404014,
    speak_name = function()
      return T_S(11304040135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00506",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404014] = {
    id = 1130404014,
    talk_text = function()
      return T_S(11304040140)
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
    next_dialog = 1130404015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00663",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130404015] = {
    id = 1130404015,
    talk_text = function()
      return T_S(11304040150)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130404016,
    speak_name = function()
      return T_S(11304040155)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00506_01",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404016] = {
    id = 1130404016,
    talk_text = function()
      return T_S(11304040160)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130404016/1130404016_90110004.playable"
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
    next_dialog = 1130404017,
    env_sound = 20007
  },
  [1130404017] = {
    id = 1130404017,
    talk_text = function()
      return T_S(11304040170)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130404018,
    speak_name = function()
      return T_S(11304040175)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00507",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404018] = {
    id = 1130404018,
    talk_text = function()
      return T_S(11304040180)
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
    next_dialog = 1130404019,
    env_sound = 20007
  },
  [1130404019] = {
    id = 1130404019,
    talk_text = function()
      return T_S(11304040190)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130404020,
    speak_name = function()
      return T_S(11304040195)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00508",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130404020] = {
    id = 1130404020,
    talk_text = function()
      return T_S(11304040200)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1130404021,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00664",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130404021] = {
    id = 1130404021,
    talk_text = function()
      return T_S(11304040210)
    end,
    next_dialog = 1130404022,
    env_sound = 20007
  },
  [1130404022] = {
    id = 1130404022,
    talk_text = function()
      return T_S(11304040220)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00665",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  }
}
