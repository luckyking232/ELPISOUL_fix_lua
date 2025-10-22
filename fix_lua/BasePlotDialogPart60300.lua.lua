BasePlotDialogPart60300 = {
  [1120701001] = {
    id = 1120701001,
    talk_text = function()
      return T_S(11207010010)
    end,
    next_dialog = 1120701002,
    env_sound = 20002,
    open_title_1 = function()
      return T_S(11207010018)
    end,
    open_title_2 = function()
      return T_S(11207010019)
    end
  },
  [1120701002] = {
    id = 1120701002,
    talk_text = function()
      return T_S(11207010020)
    end,
    next_dialog = 1120701003,
    speak_head = 90120043,
    speak_head_actions = {
      "talk",
      "idle",
      "blink"
    },
    speak_name = function()
      return T_S(11207010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00630",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20002
  },
  [1120701003] = {
    id = 1120701003,
    talk_text = function()
      return T_S(11207010030)
    end,
    next_dialog = 1120701004,
    env_sound = 20002
  },
  [1120701004] = {
    id = 1120701004,
    talk_text = function()
      return T_S(11207010040)
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
    effect_in = {"2"},
    effect_in_param = {"120"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120701005,
    speak_name = function()
      return T_S(11207010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00396",
    text_sound_bank = "bank:/voice_cn/sty/M0001_5",
    env_sound = 20002
  },
  [1120701005] = {
    id = 1120701005,
    talk_text = function()
      return T_S(11207010050)
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
    role_shake = {"", "1:0:1200"},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "200"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120701006,
    speak_name = function()
      return T_S(11207010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00631",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20002
  },
  [1120701006] = {
    id = 1120701006,
    talk_text = function()
      return T_S(11207010060)
    end,
    next_dialog = 1120701007,
    env_sound = 20002
  },
  [1120701007] = {
    id = 1120701007,
    talk_text = function()
      return T_S(11207010070)
    end,
    role_ids = {90110007, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-700", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120701008,
    speak_name = function()
      return T_S(11207010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00097",
    text_sound_bank = "bank:/voice_cn/sty/M0017_2",
    env_sound = 20002
  },
  [1120701008] = {
    id = 1120701008,
    talk_text = function()
      return T_S(11207010080)
    end,
    role_ids = {90110007, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      ""
    },
    role_position = {"-270:-700", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120701009,
    speak_name = function()
      return T_S(11207010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00383",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20002
  },
  [1120701009] = {
    id = 1120701009,
    talk_text = function()
      return T_S(11207010090)
    end,
    role_ids = {90110007, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-700", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1120701010,
    speak_name = function()
      return T_S(11207010095)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00098",
    text_sound_bank = "bank:/voice_cn/sty/M0017_2",
    env_sound = 20002
  },
  [1120701010] = {
    id = 1120701010,
    talk_text = function()
      return T_S(11207010100)
    end,
    role_ids = {90110007, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-700", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120701011,
    speak_name = function()
      return T_S(11207010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00384",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20002
  },
  [1120701011] = {
    id = 1120701011,
    talk_text = function()
      return T_S(11207010110)
    end,
    next_dialog = 1120701012,
    env_sound = 20002
  },
  [1120701012] = {
    id = 1120701012,
    talk_text = function()
      return T_S(11207010120)
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
    next_dialog = 1120701013,
    speak_name = function()
      return T_S(11207010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00632",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20002
  },
  [1120701013] = {
    id = 1120701013,
    talk_text = function()
      return T_S(11207010130)
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
    next_dialog = 1120701014,
    speak_name = function()
      return T_S(11207010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00469",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  },
  [1120701014] = {
    id = 1120701014,
    talk_text = function()
      return T_S(11207010140)
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
    next_dialog = 1120701015,
    speak_name = function()
      return T_S(11207010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00633",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20002
  },
  [1120701015] = {
    id = 1120701015,
    talk_text = function()
      return T_S(11207010150)
    end,
    role_ids = {90110007, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-700", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120701016,
    speak_name = function()
      return T_S(11207010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00385",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20002
  },
  [1120701016] = {
    id = 1120701016,
    talk_text = function()
      return T_S(11207010160)
    end,
    role_ids = {90110007, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-700", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1120701017,
    speak_head = 90120008,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11207010165)
    end,
    text_sound_path = "event:/voice_cn/story/S0020/S0020_story_00055",
    text_sound_bank = "bank:/voice_cn/sty/S0020_1",
    env_sound = 20002
  },
  [1120701017] = {
    id = 1120701017,
    talk_text = function()
      return T_S(11207010170)
    end,
    role_ids = {90110007, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110007/90110007_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-700", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(11207010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0017/M0017_story_00099",
    text_sound_bank = "bank:/voice_cn/sty/M0017_2",
    env_sound = 20002
  },
  [1120702001] = {
    id = 1120702001,
    talk_text = function()
      return T_S(11207020010)
    end,
    next_dialog = 1120702002,
    speak_head = 90120033,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11207020015)
    end,
    text_sound_path = "event:/voice_cn/story/S0105/S0105_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0105",
    env_sound = 20002
  },
  [1120702002] = {
    id = 1120702002,
    talk_text = function()
      return T_S(11207020020)
    end,
    next_dialog = 1120702003,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11207020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0104/S0104_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0104",
    env_sound = 20002
  },
  [1120702003] = {
    id = 1120702003,
    talk_text = function()
      return T_S(11207020030)
    end,
    next_dialog = 1120702004,
    speak_head = 90120033,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11207020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0105/S0105_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0105",
    env_sound = 20002
  },
  [1120702004] = {
    id = 1120702004,
    talk_text = function()
      return T_S(11207020040)
    end,
    next_dialog = 1120702005,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11207020045)
    end,
    text_sound_path = "event:/voice_cn/story/S0104/S0104_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0104",
    env_sound = 20002
  },
  [1120702005] = {
    id = 1120702005,
    talk_text = function()
      return T_S(11207020050)
    end,
    is_master = 1,
    next_dialog = 1120702006,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00617",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20002
  },
  [1120702006] = {
    id = 1120702006,
    talk_text = function()
      return T_S(11207020060)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120702007,
    speak_name = function()
      return T_S(11207020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0014/M0014_story_00129",
    text_sound_bank = "bank:/voice_cn/sty/M0014_2",
    env_sound = 20002
  },
  [1120702007] = {
    id = 1120702007,
    talk_text = function()
      return T_S(11207020070)
    end,
    role_ids = {90110012, 90110001},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110012/90110012_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-291:-1158", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120702008,
    speak_name = function()
      return T_S(11207020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00397",
    text_sound_bank = "bank:/voice_cn/sty/M0001_5",
    env_sound = 20002
  },
  [1120702008] = {
    id = 1120702008,
    talk_text = function()
      return T_S(11207020080)
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
    next_dialog = 1120702009,
    speak_name = function()
      return T_S(11207020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00634",
    text_sound_bank = "bank:/voice_cn/sty/M0003_7",
    env_sound = 20002
  },
  [1120702009] = {
    id = 1120702009,
    talk_text = function()
      return T_S(11207020090)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120702009/1120702009_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1120702010,
    speak_name = function()
      return T_S(11207020095)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00386",
    text_sound_bank = "bank:/voice_cn/sty/M0002_5",
    env_sound = 20002
  },
  [1120702010] = {
    id = 1120702010,
    talk_text = function()
      return T_S(11207020100)
    end,
    next_dialog = 1120702011,
    env_sound = 20002
  },
  [1120702011] = {
    id = 1120702011,
    talk_text = function()
      return T_S(11207020110)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120702011/1120702011_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120702012,
    speak_name = function()
      return T_S(11207020115)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00470",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  },
  [1120702012] = {
    id = 1120702012,
    talk_text = function()
      return T_S(11207020120)
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
    next_dialog = 1120702013,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00618",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20002
  },
  [1120702013] = {
    id = 1120702013,
    talk_text = function()
      return T_S(11207020130)
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
    next_dialog = 1120702014,
    speak_name = function()
      return T_S(11207020135)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00471",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  },
  [1120702014] = {
    id = 1120702014,
    talk_text = function()
      return T_S(11207020140)
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
    next_dialog = 1120702015,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00619",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20002
  },
  [1120702015] = {
    id = 1120702015,
    talk_text = function()
      return T_S(11207020150)
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
    next_dialog = 1120702016,
    speak_name = function()
      return T_S(11207020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00472",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  },
  [1120702016] = {
    id = 1120702016,
    talk_text = function()
      return T_S(11207020160)
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
    next_dialog = 1120702017,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00620",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20002
  },
  [1120702017] = {
    id = 1120702017,
    talk_text = function()
      return T_S(11207020170)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1120702017/1120702017_90110004.playable"
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
    next_dialog = 1120702018,
    speak_name = function()
      return T_S(11207020175)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00473",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  },
  [1120702018] = {
    id = 1120702018,
    talk_text = function()
      return T_S(11207020180)
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
    next_dialog = 1120702019,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00620_01",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20002
  },
  [1120702019] = {
    id = 1120702019,
    talk_text = function()
      return T_S(11207020190)
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
    next_dialog = 1120702020,
    speak_name = function()
      return T_S(11207020195)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00474",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  },
  [1120702020] = {
    id = 1120702020,
    talk_text = function()
      return T_S(11207020200)
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
    next_dialog = 1120702021,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00621",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20002
  },
  [1120702021] = {
    id = 1120702021,
    talk_text = function()
      return T_S(11207020210)
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
    next_dialog = 1120702022,
    speak_name = function()
      return T_S(11207020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00475",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  },
  [1120702022] = {
    id = 1120702022,
    talk_text = function()
      return T_S(11207020220)
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
    next_dialog = 1120702023,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00622",
    text_sound_bank = "bank:/voice_cn/sty/M0000_6",
    env_sound = 20002
  },
  [1120702023] = {
    id = 1120702023,
    talk_text = function()
      return T_S(11207020230)
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
      return T_S(11207020235)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00476",
    text_sound_bank = "bank:/voice_cn/sty/M0004_6",
    env_sound = 20002
  }
}
