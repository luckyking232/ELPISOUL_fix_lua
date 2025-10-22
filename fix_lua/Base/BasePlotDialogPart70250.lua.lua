BasePlotDialogPart70250 = {
  [1140601001] = {
    id = 1140601001,
    talk_text = function()
      return T_S(11406010010)
    end,
    next_dialog = 1140601002,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010015)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008,
    open_title_1 = function()
      return T_S(11406010018)
    end,
    open_title_2 = function()
      return T_S(11406010019)
    end
  },
  [1140601002] = {
    id = 1140601002,
    talk_text = function()
      return T_S(11406010020)
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
    next_dialog = 1140601003,
    speak_name = function()
      return T_S(11406010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00792",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20008
  },
  [1140601003] = {
    id = 1140601003,
    talk_text = function()
      return T_S(11406010030)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140601004,
    speak_name = function()
      return T_S(11406010035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00793",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20008
  },
  [1140601004] = {
    id = 1140601004,
    talk_text = function()
      return T_S(11406010040)
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
    next_dialog = 1140601005,
    speak_name = function()
      return T_S(11406010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00373",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20008
  },
  [1140601005] = {
    id = 1140601005,
    talk_text = function()
      return T_S(11406010050)
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140601006,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010055)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601006] = {
    id = 1140601006,
    talk_text = function()
      return T_S(11406010060)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-300:-980", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140601007,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010065)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601007] = {
    id = 1140601007,
    talk_text = function()
      return T_S(11406010070)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140601007/1140601007_90110003.playable",
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1140601008,
    speak_name = function()
      return T_S(11406010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00794",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20008
  },
  [1140601008] = {
    id = 1140601008,
    talk_text = function()
      return T_S(11406010080)
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
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140601009,
    speak_name = function()
      return T_S(11406010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00374",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20008
  },
  [1140601009] = {
    id = 1140601009,
    talk_text = function()
      return T_S(11406010090)
    end,
    next_dialog = 1140601010,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010095)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601010] = {
    id = 1140601010,
    talk_text = function()
      return T_S(11406010100)
    end,
    next_dialog = 1140601011,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010105)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601011] = {
    id = 1140601011,
    talk_text = function()
      return T_S(11406010110)
    end,
    next_dialog = 1140601012,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010115)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601012] = {
    id = 1140601012,
    talk_text = function()
      return T_S(11406010120)
    end,
    next_dialog = 1140601013,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010125)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601013] = {
    id = 1140601013,
    talk_text = function()
      return T_S(11406010130)
    end,
    next_dialog = 1140601014,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010135)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601014] = {
    id = 1140601014,
    talk_text = function()
      return T_S(11406010140)
    end,
    next_dialog = 1140601015,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010145)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601015] = {
    id = 1140601015,
    talk_text = function()
      return T_S(11406010150)
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
    next_dialog = 1140601016,
    speak_name = function()
      return T_S(11406010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00479",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20008
  },
  [1140601016] = {
    id = 1140601016,
    talk_text = function()
      return T_S(11406010160)
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
    next_dialog = 1140601017,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010165)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601017] = {
    id = 1140601017,
    talk_text = function()
      return T_S(11406010170)
    end,
    next_dialog = 1140601018,
    speak_head = 90120064,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11406010175)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601018] = {
    id = 1140601018,
    talk_text = function()
      return T_S(11406010180)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 1140601019,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00754",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20008
  },
  [1140601019] = {
    id = 1140601019,
    talk_text = function()
      return T_S(11406010190)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 1140601020,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00755",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20008
  },
  [1140601020] = {
    id = 1140601020,
    talk_text = function()
      return T_S(11406010200)
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
    next_dialog = 1140601021,
    speak_name = function()
      return T_S(11406010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00795",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20008
  },
  [1140601021] = {
    id = 1140601021,
    talk_text = function()
      return T_S(11406010210)
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
    next_dialog = 1140601022,
    speak_head = 90120064,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11406010215)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601022] = {
    id = 1140601022,
    talk_text = function()
      return T_S(11406010220)
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
    next_dialog = 1140601023,
    speak_name = function()
      return T_S(11406010225)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00375",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20008
  },
  [1140601023] = {
    id = 1140601023,
    talk_text = function()
      return T_S(11406010230)
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140601024,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010235)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601024] = {
    id = 1140601024,
    talk_text = function()
      return T_S(11406010240)
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1140601025,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406010245)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  },
  [1140601025] = {
    id = 1140601025,
    talk_text = function()
      return T_S(11406010250)
    end,
    env_sound = 20008
  },
  [1140602001] = {
    id = 1140602001,
    talk_text = function()
      return T_S(11406020010)
    end,
    next_dialog = 1140602002,
    env_sound = 20008
  },
  [1140602002] = {
    id = 1140602002,
    talk_text = function()
      return T_S(11406020020)
    end,
    next_dialog = 1140602003,
    env_sound = 20008
  },
  [1140602003] = {
    id = 1140602003,
    talk_text = function()
      return T_S(11406020030)
    end,
    speak_head = 90120064,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11406020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0134/S0134_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0134_14th",
    env_sound = 20008
  }
}
