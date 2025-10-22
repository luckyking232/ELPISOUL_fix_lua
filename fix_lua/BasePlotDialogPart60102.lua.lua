BasePlotDialogPart60102 = {
  [1120305001] = {
    id = 1120305001,
    talk_text = function()
      return T_S(11203050010)
    end,
    next_dialog = 1120305002,
    env_sound = 20004
  },
  [1120305002] = {
    id = 1120305002,
    talk_text = function()
      return T_S(11203050020)
    end,
    next_dialog = 1120305003,
    speak_name = function()
      return T_S(11203050025)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00096",
    text_sound_bank = "bank:/voice_cn/sty/M0019_2",
    env_sound = 20004,
    review_head = "90210001"
  },
  [1120305003] = {
    id = 1120305003,
    talk_text = function()
      return T_S(11203050030)
    end,
    next_dialog = 1120305004,
    speak_name = function()
      return T_S(11203050035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00616",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20004,
    review_head = "90210002"
  },
  [1120305004] = {
    id = 1120305004,
    talk_text = function()
      return T_S(11203050040)
    end,
    next_dialog = 1120305005,
    env_sound = 20004
  },
  [1120305005] = {
    id = 1120305005,
    talk_text = function()
      return T_S(11203050050)
    end,
    next_dialog = 1120305006,
    speak_name = function()
      return T_S(11203050055)
    end,
    text_sound_path = "event:/voice_cn/story/S0114/S0114_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0114",
    env_sound = 20004,
    review_head = "90210001"
  },
  [1120305006] = {
    id = 1120305006,
    talk_text = function()
      return T_S(11203050060)
    end,
    next_dialog = 1120305007,
    env_sound = 20004
  },
  [1120305007] = {
    id = 1120305007,
    talk_text = function()
      return T_S(11203050070)
    end,
    next_dialog = 1120305008,
    env_sound = 20004
  },
  [1120305008] = {
    id = 1120305008,
    talk_text = function()
      return T_S(11203050080)
    end,
    speak_name = function()
      return T_S(11203050085)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00388",
    text_sound_bank = "bank:/voice_cn/sty/M0001_5",
    env_sound = 20004,
    review_head = "90210002"
  },
  [1120306001] = {
    id = 1120306001,
    talk_text = function()
      return T_S(11203060010)
    end,
    next_dialog = 1120306002,
    env_sound = 20004
  },
  [1120306002] = {
    id = 1120306002,
    talk_text = function()
      return T_S(11203060020)
    end,
    is_master = 1,
    next_dialog = 1120306003,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00557",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306003] = {
    id = 1120306003,
    talk_text = function()
      return T_S(11203060030)
    end,
    next_dialog = 1120306004,
    env_sound = 20004
  },
  [1120306004] = {
    id = 1120306004,
    talk_text = function()
      return T_S(11203060040)
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
    next_dialog = 1120306005,
    speak_name = function()
      return T_S(11203060045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00617",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20004
  },
  [1120306005] = {
    id = 1120306005,
    talk_text = function()
      return T_S(11203060050)
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
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120306006,
    speak_name = function()
      return T_S(11203060055)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00246",
    text_sound_bank = "bank:/voice_cn/sty/M0015_4",
    env_sound = 20004
  },
  [1120306006] = {
    id = 1120306006,
    talk_text = function()
      return T_S(11203060060)
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
    next_dialog = 1120306007,
    speak_name = function()
      return T_S(11203060065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00372",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20004
  },
  [1120306007] = {
    id = 1120306007,
    talk_text = function()
      return T_S(11203060070)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1120306008,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00558",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306008] = {
    id = 1120306008,
    talk_text = function()
      return T_S(11203060080)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120306009,
    speak_name = function()
      return T_S(11203060085)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00097",
    text_sound_bank = "bank:/voice_cn/sty/M0019_2",
    env_sound = 20004
  },
  [1120306009] = {
    id = 1120306009,
    talk_text = function()
      return T_S(11203060090)
    end,
    is_master = 1,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1120306010,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00559",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306010] = {
    id = 1120306010,
    talk_text = function()
      return T_S(11203060100)
    end,
    role_ids = {90110005},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"-48:-985"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"3"},
    effect_out_param = {"210"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120306011,
    speak_name = function()
      return T_S(11203060105)
    end,
    text_sound_path = "event:/voice_cn/story/M0019/M0019_story_00098",
    text_sound_bank = "bank:/voice_cn/sty/M0019_2",
    env_sound = 20004
  },
  [1120306011] = {
    id = 1120306011,
    talk_text = function()
      return T_S(11203060110)
    end,
    is_master = 1,
    next_dialog = 1120306012,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00560",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306012] = {
    id = 1120306012,
    talk_text = function()
      return T_S(11203060120)
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
    next_dialog = 1120306013,
    speak_name = function()
      return T_S(11203060125)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00459_01",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20004
  },
  [1120306013] = {
    id = 1120306013,
    talk_text = function()
      return T_S(11203060130)
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
    next_dialog = 1120306014,
    speak_name = function()
      return T_S(11203060135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00460",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20004
  },
  [1120306014] = {
    id = 1120306014,
    talk_text = function()
      return T_S(11203060140)
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
    next_dialog = 1120306015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00561",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306015] = {
    id = 1120306015,
    talk_text = function()
      return T_S(11203060150)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120306015/1120306015_90110004.playable"
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
    next_dialog = 1120306016,
    speak_name = function()
      return T_S(11203060155)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00461",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20004
  },
  [1120306016] = {
    id = 1120306016,
    talk_text = function()
      return T_S(11203060160)
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
    next_dialog = 1120306017,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00561_01",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306017] = {
    id = 1120306017,
    talk_text = function()
      return T_S(11203060170)
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
    next_dialog = 1120306018,
    speak_name = function()
      return T_S(11203060175)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00462",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20004
  },
  [1120306018] = {
    id = 1120306018,
    talk_text = function()
      return T_S(11203060180)
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
    next_dialog = 1120306019,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00562",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306019] = {
    id = 1120306019,
    talk_text = function()
      return T_S(11203060190)
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
    next_dialog = 1120306020,
    env_sound = 20004
  },
  [1120306020] = {
    id = 1120306020,
    talk_text = function()
      return T_S(11203060200)
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
    next_dialog = 1120306021,
    speak_name = function()
      return T_S(11203060205)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00463",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20004
  },
  [1120306021] = {
    id = 1120306021,
    talk_text = function()
      return T_S(11203060210)
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
    next_dialog = 1120306022,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00563",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20004
  },
  [1120306022] = {
    id = 1120306022,
    talk_text = function()
      return T_S(11203060220)
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
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11203060225)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00464",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20004
  }
}
