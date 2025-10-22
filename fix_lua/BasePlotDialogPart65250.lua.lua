BasePlotDialogPart65250 = {
  [1130601001] = {
    id = 1130601001,
    talk_text = function()
      return T_S(11306010010)
    end,
    next_dialog = 1130601002,
    env_sound = 20006,
    open_title_1 = function()
      return T_S(11306010018)
    end,
    open_title_2 = function()
      return T_S(11306010019)
    end
  },
  [1130601002] = {
    id = 1130601002,
    talk_text = function()
      return T_S(11306010020)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601002/1130601002_90110003.playable"
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
    next_dialog = 1130601003,
    speak_name = function()
      return T_S(11306010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00719",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20006
  },
  [1130601003] = {
    id = 1130601003,
    talk_text = function()
      return T_S(11306010030)
    end,
    next_dialog = 1130601004,
    env_sound = 20006
  },
  [1130601004] = {
    id = 1130601004,
    talk_text = function()
      return T_S(11306010040)
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
    next_dialog = 1130601005,
    speak_name = function()
      return T_S(11306010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00306",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20006
  },
  [1130601005] = {
    id = 1130601005,
    talk_text = function()
      return T_S(11306010050)
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
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130601006,
    speak_name = function()
      return T_S(11306010055)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00437",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20006
  },
  [1130601006] = {
    id = 1130601006,
    talk_text = function()
      return T_S(11306010060)
    end,
    role_ids = {90110009, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601006/1130601006_90110009.playable",
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130601007,
    speak_name = function()
      return T_S(11306010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00307",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20006
  },
  [1130601007] = {
    id = 1130601007,
    talk_text = function()
      return T_S(11306010070)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1130601008,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00671",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20006
  },
  [1130601008] = {
    id = 1130601008,
    talk_text = function()
      return T_S(11306010080)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1130601009,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00672",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20006
  },
  [1130601009] = {
    id = 1130601009,
    talk_text = function()
      return T_S(11306010090)
    end,
    role_ids = {90110009, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601009/1130601009_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601009/1130601009_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1080", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130601010,
    camera_shake = {
      "2",
      "0",
      "1600"
    },
    env_sound = 20006
  },
  [1130601010] = {
    id = 1130601010,
    talk_text = function()
      return T_S(11306010100)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130601011,
    speak_name = function()
      return T_S(11306010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00438",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20006
  },
  [1130601011] = {
    id = 1130601011,
    talk_text = function()
      return T_S(11306010110)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130601012,
    speak_name = function()
      return T_S(11306010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00308",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20006
  },
  [1130601012] = {
    id = 1130601012,
    talk_text = function()
      return T_S(11306010120)
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
    next_dialog = 1130601013,
    speak_name = function()
      return T_S(11306010125)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00069",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20006
  },
  [1130601013] = {
    id = 1130601013,
    talk_text = function()
      return T_S(11306010130)
    end,
    role_ids = {90110010, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601013/1130601013_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-958", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130601014,
    speak_name = function()
      return T_S(11306010135)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00309",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20006
  },
  [1130601014] = {
    id = 1130601014,
    talk_text = function()
      return T_S(11306010140)
    end,
    role_ids = {90110010, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-958", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130601015,
    speak_name = function()
      return T_S(11306010145)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00070",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20006
  },
  [1130601015] = {
    id = 1130601015,
    talk_text = function()
      return T_S(11306010150)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601015/1130601015_90110001.playable"
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
    next_dialog = 1130601016,
    speak_name = function()
      return T_S(11306010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00433",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20006
  },
  [1130601016] = {
    id = 1130601016,
    talk_text = function()
      return T_S(11306010160)
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
    next_dialog = 1130601017,
    env_sound = 20006
  },
  [1130601017] = {
    id = 1130601017,
    talk_text = function()
      return T_S(11306010170)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130601018,
    speak_name = function()
      return T_S(11306010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00434",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20006
  },
  [1130601018] = {
    id = 1130601018,
    talk_text = function()
      return T_S(11306010180)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601018/1130601018_90110003.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601018/1130601018_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130601019,
    speak_name = function()
      return T_S(11306010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00720",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20006
  },
  [1130601019] = {
    id = 1130601019,
    talk_text = function()
      return T_S(11306010190)
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
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130601020,
    speak_name = function()
      return T_S(11306010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00439",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20006
  },
  [1130601020] = {
    id = 1130601020,
    talk_text = function()
      return T_S(11306010200)
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
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130601021,
    speak_name = function()
      return T_S(11306010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00721",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20006
  },
  [1130601021] = {
    id = 1130601021,
    talk_text = function()
      return T_S(11306010210)
    end,
    next_dialog = 1130601022,
    env_sound = 20006
  },
  [1130601022] = {
    id = 1130601022,
    talk_text = function()
      return T_S(11306010220)
    end,
    next_dialog = 1130601023,
    env_sound = 20006
  },
  [1130601023] = {
    id = 1130601023,
    talk_text = function()
      return T_S(11306010230)
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
    next_dialog = 1130601024,
    speak_name = function()
      return T_S(11306010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00071",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20006
  },
  [1130601024] = {
    id = 1130601024,
    talk_text = function()
      return T_S(11306010240)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130601025,
    speak_name = function()
      return T_S(11306010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00722",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20006
  },
  [1130601025] = {
    id = 1130601025,
    talk_text = function()
      return T_S(11306010250)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130601025/1130601025_90110009.playable"
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
    next_dialog = 1130601026,
    speak_name = function()
      return T_S(11306010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00310",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20006
  },
  [1130601026] = {
    id = 1130601026,
    talk_text = function()
      return T_S(11306010260)
    end,
    is_master = 1,
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
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00673",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20006
  },
  [1130602001] = {
    id = 1130602001,
    talk_text = function()
      return T_S(11306020010)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602001/1130602001_90110003.playable"
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
    next_dialog = 1130602002,
    speak_name = function()
      return T_S(11306020015)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00723",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602002] = {
    id = 1130602002,
    talk_text = function()
      return T_S(11306020020)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602003,
    speak_name = function()
      return T_S(11306020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00440",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20003
  },
  [1130602003] = {
    id = 1130602003,
    talk_text = function()
      return T_S(11306020030)
    end,
    next_dialog = 1130602004,
    camera_shake = {
      "3",
      "0",
      "1500"
    },
    env_sound = 20003
  },
  [1130602004] = {
    id = 1130602004,
    talk_text = function()
      return T_S(11306020040)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602004/1130602004_90110001.playable"
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
    next_dialog = 1130602005,
    speak_name = function()
      return T_S(11306020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00435",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20003
  },
  [1130602005] = {
    id = 1130602005,
    talk_text = function()
      return T_S(11306020050)
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
    next_dialog = 1130602006,
    env_sound = 20003
  },
  [1130602006] = {
    id = 1130602006,
    talk_text = function()
      return T_S(11306020060)
    end,
    role_ids = {90110001, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602006/1130602006_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"-270:-1000", "270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602007,
    speak_name = function()
      return T_S(11306020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00311",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602007] = {
    id = 1130602007,
    talk_text = function()
      return T_S(11306020070)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602007/1130602007_90110003.playable"
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
    next_dialog = 1130602008,
    speak_name = function()
      return T_S(11306020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00724",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602008] = {
    id = 1130602008,
    talk_text = function()
      return T_S(11306020080)
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
    next_dialog = 1130602009,
    env_sound = 20003
  },
  [1130602009] = {
    id = 1130602009,
    talk_text = function()
      return T_S(11306020090)
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
    next_dialog = 1130602010,
    speak_head = 90120018,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11306020095)
    end,
    text_sound_path = "event:/voice_cn/story/S0124/S0124_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0124",
    env_sound = 20003
  },
  [1130602010] = {
    id = 1130602010,
    talk_text = function()
      return T_S(11306020100)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602010/1130602010_90110003.playable"
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
    next_dialog = 1130602011,
    speak_name = function()
      return T_S(11306020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00725",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602011] = {
    id = 1130602011,
    talk_text = function()
      return T_S(11306020110)
    end,
    next_dialog = 1130602012,
    speak_name = function()
      return T_S(11306020115)
    end,
    camera_shake = {
      "2",
      "0",
      "1800"
    },
    env_sound = 20003,
    review_head = "90210001"
  },
  [1130602012] = {
    id = 1130602012,
    talk_text = function()
      return T_S(11306020120)
    end,
    next_dialog = 1130602013,
    env_sound = 20003
  },
  [1130602013] = {
    id = 1130602013,
    talk_text = function()
      return T_S(11306020130)
    end,
    next_dialog = 1130602014,
    env_sound = 20003
  },
  [1130602014] = {
    id = 1130602014,
    talk_text = function()
      return T_S(11306020140)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602014/1130602014_90110009.playable"
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
    next_dialog = 1130602015,
    speak_name = function()
      return T_S(11306020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00312",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602015] = {
    id = 1130602015,
    talk_text = function()
      return T_S(11306020150)
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
    next_dialog = 1130602016,
    speak_head = 90120018,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11306020155)
    end,
    text_sound_path = "event:/voice_cn/story/S0124/S0124_story_00016",
    text_sound_bank = "bank:/voice_cn/sty/S0124",
    env_sound = 20003
  },
  [1130602016] = {
    id = 1130602016,
    talk_text = function()
      return T_S(11306020160)
    end,
    next_dialog = 1130602017,
    camera_shake = {
      "2",
      "0",
      "1200"
    },
    env_sound = 20003
  },
  [1130602017] = {
    id = 1130602017,
    talk_text = function()
      return T_S(11306020170)
    end,
    next_dialog = 1130602018,
    env_sound = 20003
  },
  [1130602018] = {
    id = 1130602018,
    talk_text = function()
      return T_S(11306020180)
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
    next_dialog = 1130602019,
    speak_name = function()
      return T_S(11306020185)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00441",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20003
  },
  [1130602019] = {
    id = 1130602019,
    talk_text = function()
      return T_S(11306020190)
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
    next_dialog = 1130602020,
    speak_head = 90120024,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11306020195)
    end,
    text_sound_path = "event:/voice_cn/story/S0123/S0123_story_00021_01",
    text_sound_bank = "bank:/voice_cn/sty/S0123",
    env_sound = 20003
  },
  [1130602020] = {
    id = 1130602020,
    talk_text = function()
      return T_S(11306020200)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602021,
    speak_name = function()
      return T_S(11306020205)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00517",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20003
  },
  [1130602021] = {
    id = 1130602021,
    talk_text = function()
      return T_S(11306020210)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130602022,
    speak_name = function()
      return T_S(11306020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00441_01",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20003
  },
  [1130602022] = {
    id = 1130602022,
    talk_text = function()
      return T_S(11306020220)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602022/1130602022_90110001.playable"
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
    next_dialog = 1130602023,
    speak_name = function()
      return T_S(11306020225)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00436",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20003
  },
  [1130602023] = {
    id = 1130602023,
    talk_text = function()
      return T_S(11306020230)
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
    next_dialog = 1130602024,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00674",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602024] = {
    id = 1130602024,
    talk_text = function()
      return T_S(11306020240)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602024/1130602024_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602025,
    speak_name = function()
      return T_S(11306020245)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00726",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602025] = {
    id = 1130602025,
    talk_text = function()
      return T_S(11306020250)
    end,
    next_dialog = 1130602026,
    env_sound = 20003
  },
  [1130602026] = {
    id = 1130602026,
    talk_text = function()
      return T_S(11306020260)
    end,
    next_dialog = 1130602027,
    speak_head = 90120063,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11306020265)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20003
  },
  [1130602027] = {
    id = 1130602027,
    talk_text = function()
      return T_S(11306020270)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602027/1130602027_90110003.playable"
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
    next_dialog = 1130602028,
    speak_name = function()
      return T_S(11306020275)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00727",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602028] = {
    id = 1130602028,
    talk_text = function()
      return T_S(11306020280)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602029,
    speak_name = function()
      return T_S(11306020285)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00442",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20003
  },
  [1130602029] = {
    id = 1130602029,
    talk_text = function()
      return T_S(11306020290)
    end,
    next_dialog = 1130602030,
    speak_head = 90120024,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11306020295)
    end,
    text_sound_path = "event:/voice_cn/story/S0123/S0123_story_00022",
    text_sound_bank = "bank:/voice_cn/sty/S0123",
    env_sound = 20003
  },
  [1130602030] = {
    id = 1130602030,
    talk_text = function()
      return T_S(11306020300)
    end,
    next_dialog = 1130602031,
    env_sound = 20003
  },
  [1130602031] = {
    id = 1130602031,
    talk_text = function()
      return T_S(11306020310)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602031/1130602031_90110001.playable"
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
    next_dialog = 1130602032,
    speak_name = function()
      return T_S(11306020315)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00437",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20003
  },
  [1130602032] = {
    id = 1130602032,
    talk_text = function()
      return T_S(11306020320)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130602033,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00675",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602033] = {
    id = 1130602033,
    talk_text = function()
      return T_S(11306020330)
    end,
    next_dialog = 1130602034,
    env_sound = 20003
  },
  [1130602034] = {
    id = 1130602034,
    talk_text = function()
      return T_S(11306020340)
    end,
    next_dialog = 1130602035,
    speak_head = 90120021,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11306020345)
    end,
    text_sound_path = "event:/voice_cn/story/S0122/S0122_story_00025",
    text_sound_bank = "bank:/voice_cn/sty/S0122",
    env_sound = 20003
  },
  [1130602035] = {
    id = 1130602035,
    talk_text = function()
      return T_S(11306020350)
    end,
    next_dialog = 1130602036,
    env_sound = 20003
  },
  [1130602036] = {
    id = 1130602036,
    talk_text = function()
      return T_S(11306020360)
    end,
    is_master = 1,
    next_dialog = 1130602037,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00676",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602037] = {
    id = 1130602037,
    talk_text = function()
      return T_S(11306020370)
    end,
    next_dialog = 1130602038,
    speak_head = 90120063,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11306020375)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20003
  },
  [1130602038] = {
    id = 1130602038,
    talk_text = function()
      return T_S(11306020380)
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
    next_dialog = 1130602039,
    speak_name = function()
      return T_S(11306020385)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00518",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20003
  },
  [1130602039] = {
    id = 1130602039,
    talk_text = function()
      return T_S(11306020390)
    end,
    role_ids = {90110004, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-308:-1165", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602040,
    speak_name = function()
      return T_S(11306020395)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00443",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20003
  },
  [1130602040] = {
    id = 1130602040,
    talk_text = function()
      return T_S(11306020400)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602040/1130602040_90110001.playable"
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
    next_dialog = 1130602041,
    speak_name = function()
      return T_S(11306020405)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00438",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20003
  },
  [1130602041] = {
    id = 1130602041,
    talk_text = function()
      return T_S(11306020410)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602041/1130602041_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602042,
    speak_name = function()
      return T_S(11306020415)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00728",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602042] = {
    id = 1130602042,
    talk_text = function()
      return T_S(11306020420)
    end,
    next_dialog = 1130602043,
    env_sound = 20003
  },
  [1130602043] = {
    id = 1130602043,
    talk_text = function()
      return T_S(11306020430)
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
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 1130602044,
    speak_name = function()
      return T_S(11306020435)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00072",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20003
  },
  [1130602044] = {
    id = 1130602044,
    talk_text = function()
      return T_S(11306020440)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602044/1130602044_90110009.playable",
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130602045,
    speak_name = function()
      return T_S(11306020445)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00313",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602045] = {
    id = 1130602045,
    talk_text = function()
      return T_S(11306020450)
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
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "3"},
    effect_out_param = {"0", "210"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1130602046,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00677",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602046] = {
    id = 1130602046,
    talk_text = function()
      return T_S(11306020460)
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
    next_dialog = 1130602047,
    speak_name = function()
      return T_S(11306020465)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00314",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602047] = {
    id = 1130602047,
    talk_text = function()
      return T_S(11306020470)
    end,
    is_master = 1,
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
    light_role = {1},
    next_dialog = 1130602048,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00678",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602048] = {
    id = 1130602048,
    talk_text = function()
      return T_S(11306020480)
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
    next_dialog = 1130602049,
    speak_name = function()
      return T_S(11306020485)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00315",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602049] = {
    id = 1130602049,
    talk_text = function()
      return T_S(11306020490)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602049/1130602049_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"0:-1080"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130602050,
    speak_name = function()
      return T_S(11306020495)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00316",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602050] = {
    id = 1130602050,
    talk_text = function()
      return T_S(11306020500)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130602051,
    speak_name = function()
      return T_S(11306020505)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00729",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602051] = {
    id = 1130602051,
    talk_text = function()
      return T_S(11306020510)
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
    effect_out = {"3", "3"},
    effect_out_param = {"150", "240"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602052,
    speak_name = function()
      return T_S(11306020515)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00519",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20003
  },
  [1130602052] = {
    id = 1130602052,
    talk_text = function()
      return T_S(11306020520)
    end,
    next_dialog = 1130602053,
    camera_shake = {
      "3",
      "0",
      "2000"
    },
    env_sound = 20003
  },
  [1130602053] = {
    id = 1130602053,
    talk_text = function()
      return T_S(11306020530)
    end,
    next_dialog = 1130602054,
    env_sound = 20003
  },
  [1130602054] = {
    id = 1130602054,
    talk_text = function()
      return T_S(11306020540)
    end,
    next_dialog = 1130602055,
    env_sound = 20003
  },
  [1130602055] = {
    id = 1130602055,
    talk_text = function()
      return T_S(11306020550)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602055/1130602055_90110001.playable"
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
    next_dialog = 1130602056,
    speak_name = function()
      return T_S(11306020555)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00439",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20003
  },
  [1130602056] = {
    id = 1130602056,
    talk_text = function()
      return T_S(11306020560)
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
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602057,
    speak_name = function()
      return T_S(11306020565)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00073",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20003
  },
  [1130602057] = {
    id = 1130602057,
    talk_text = function()
      return T_S(11306020570)
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
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1130602058,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00679",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602058] = {
    id = 1130602058,
    talk_text = function()
      return T_S(11306020580)
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
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1130602059,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00680",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602059] = {
    id = 1130602059,
    talk_text = function()
      return T_S(11306020590)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602059/1130602059_90110009.playable",
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130602060,
    speak_name = function()
      return T_S(11306020595)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00317",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602060] = {
    id = 1130602060,
    talk_text = function()
      return T_S(11306020600)
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
    next_dialog = 1130602061,
    speak_name = function()
      return T_S(11306020605)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00730",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602061] = {
    id = 1130602061,
    talk_text = function()
      return T_S(11306020610)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602061/1130602061_90110003.playable"
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
    next_dialog = 1130602062,
    speak_name = function()
      return T_S(11306020615)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00731",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602062] = {
    id = 1130602062,
    talk_text = function()
      return T_S(11306020620)
    end,
    role_ids = {90110003, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602062/1130602062_90110001.playable"
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
    next_dialog = 1130602063,
    speak_name = function()
      return T_S(11306020625)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00440",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20003
  },
  [1130602063] = {
    id = 1130602063,
    talk_text = function()
      return T_S(11306020630)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130602064,
    speak_name = function()
      return T_S(11306020635)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00732",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602064] = {
    id = 1130602064,
    talk_text = function()
      return T_S(11306020640)
    end,
    role_ids = {90110009, 90110010},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602064/1130602064_90110010.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"-270:-1080", "270:-958"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602065,
    speak_name = function()
      return T_S(11306020645)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00074",
    text_sound_bank = "bank:/voice_cn/sty/M0016_3",
    env_sound = 20003
  },
  [1130602065] = {
    id = 1130602065,
    talk_text = function()
      return T_S(11306020650)
    end,
    next_dialog = 1130602066,
    env_sound = 20003
  },
  [1130602066] = {
    id = 1130602066,
    talk_text = function()
      return T_S(11306020660)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602066/1130602066_90110001.playable"
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
    next_dialog = 1130602067,
    speak_name = function()
      return T_S(11306020665)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00441",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20003
  },
  [1130602067] = {
    id = 1130602067,
    talk_text = function()
      return T_S(11306020670)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602067/1130602067_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"180:-1000", "-180:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602068,
    speak_name = function()
      return T_S(11306020675)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00444",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20003
  },
  [1130602068] = {
    id = 1130602068,
    talk_text = function()
      return T_S(11306020680)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602068/1130602068_90110004.playable"
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
    next_dialog = 1130602069,
    speak_name = function()
      return T_S(11306020685)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00520",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20003
  },
  [1130602069] = {
    id = 1130602069,
    talk_text = function()
      return T_S(11306020690)
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
    next_dialog = 1130602070,
    env_sound = 20003
  },
  [1130602070] = {
    id = 1130602070,
    talk_text = function()
      return T_S(11306020700)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602070/1130602070_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"-308:-1165", "240:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130602071,
    speak_name = function()
      return T_S(11306020705)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00733",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602071] = {
    id = 1130602071,
    talk_text = function()
      return T_S(11306020710)
    end,
    next_dialog = 1130602072,
    env_sound = 20003
  },
  [1130602072] = {
    id = 1130602072,
    talk_text = function()
      return T_S(11306020720)
    end,
    next_dialog = 1130602073,
    speak_head = 90120072,
    speak_head_actions = {
      "idle",
      "animation",
      "talk"
    },
    speak_name = function()
      return T_S(11306020725)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0126",
    env_sound = 20003
  },
  [1130602073] = {
    id = 1130602073,
    talk_text = function()
      return T_S(11306020730)
    end,
    is_master = 1,
    next_dialog = 1130602074,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00681",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20003
  },
  [1130602074] = {
    id = 1130602074,
    talk_text = function()
      return T_S(11306020740)
    end,
    next_dialog = 1130602075,
    speak_head = 90120072,
    speak_head_actions = {
      "idle",
      "animation",
      "talk"
    },
    speak_name = function()
      return T_S(11306020745)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0126",
    env_sound = 20003
  },
  [1130602075] = {
    id = 1130602075,
    talk_text = function()
      return T_S(11306020750)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602075/1130602075_90110009.playable"
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
    next_dialog = 1130602076,
    speak_name = function()
      return T_S(11306020755)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00318",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20003
  },
  [1130602076] = {
    id = 1130602076,
    talk_text = function()
      return T_S(11306020760)
    end,
    role_ids = {90110009, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602076/1130602076_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
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
    next_dialog = 1130602077,
    speak_name = function()
      return T_S(11306020765)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00445",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20003
  },
  [1130602077] = {
    id = 1130602077,
    talk_text = function()
      return T_S(11306020770)
    end,
    role_ids = {90110003},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130602077/1130602077_90110003.playable"
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
    next_dialog = 1130602078,
    speak_name = function()
      return T_S(11306020775)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00734",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20003
  },
  [1130602078] = {
    id = 1130602078,
    talk_text = function()
      return T_S(11306020780)
    end,
    next_dialog = 1130602079,
    env_sound = 20003
  },
  [1130602079] = {
    id = 1130602079,
    talk_text = function()
      return T_S(11306020790)
    end,
    next_dialog = 1130602080,
    env_sound = 20003
  },
  [1130602080] = {
    id = 1130602080,
    talk_text = function()
      return T_S(11306020800)
    end,
    speak_head = 90120063,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11306020805)
    end,
    text_sound_path = "event:/voice_cn/story/S0121/S0121_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/S0121",
    env_sound = 20003
  }
}
