BasePlotDialogPart70053 = {
  [1140207001] = {
    id = 1140207001,
    talk_text = function()
      return T_S(11402070010)
    end,
    is_master = 1,
    next_dialog = 1140207002,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00711",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20005
  },
  [1140207002] = {
    id = 1140207002,
    talk_text = function()
      return T_S(11402070020)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00712",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20005
  },
  [1140208001] = {
    id = 1140208001,
    talk_text = function()
      return T_S(11402080010)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140208001/1140208001_90110001.playable"
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
    next_dialog = 1140208002,
    speak_name = function()
      return T_S(11402080015)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00446",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20008
  },
  [1140208002] = {
    id = 1140208002,
    talk_text = function()
      return T_S(11402080020)
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
    next_dialog = 1140208003,
    env_sound = 20008
  },
  [1140208003] = {
    id = 1140208003,
    talk_text = function()
      return T_S(11402080030)
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
    light_role = {1},
    next_dialog = 1140208004,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00713",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20008
  },
  [1140208004] = {
    id = 1140208004,
    talk_text = function()
      return T_S(11402080040)
    end,
    role_ids = {90110001, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140208004/1140208004_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1000", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140208005,
    speak_name = function()
      return T_S(11402080045)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00746",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20008
  },
  [1140208005] = {
    id = 1140208005,
    talk_text = function()
      return T_S(11402080050)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140208005/1140208005_90110004.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140208006,
    speak_name = function()
      return T_S(11402080055)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00526",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20008
  },
  [1140208006] = {
    id = 1140208006,
    talk_text = function()
      return T_S(11402080060)
    end,
    next_dialog = 1140208007,
    env_sound = 20008
  },
  [1140208007] = {
    id = 1140208007,
    talk_text = function()
      return T_S(11402080070)
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
    next_dialog = 1140208008,
    speak_name = function()
      return T_S(11402080075)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00331",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20008
  },
  [1140208008] = {
    id = 1140208008,
    talk_text = function()
      return T_S(11402080080)
    end,
    role_ids = {90110009, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
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
    next_dialog = 1140208009,
    speak_name = function()
      return T_S(11402080085)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00747",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20008
  },
  [1140208009] = {
    id = 1140208009,
    talk_text = function()
      return T_S(11402080090)
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
    next_dialog = 1140208010,
    speak_name = function()
      return T_S(11402080095)
    end,
    text_sound_path = "event:/voice_cn/story/M0016/M0016_story_00075",
    text_sound_bank = "bank:/voice_cn/sty/M0016_4_14th",
    env_sound = 20008
  },
  [1140208010] = {
    id = 1140208010,
    talk_text = function()
      return T_S(11402080100)
    end,
    is_master = 1,
    role_ids = {90110010},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable"
    },
    role_position = {"0:-958"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    next_dialog = 1140208011,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00714",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20008
  },
  [1140208011] = {
    id = 1140208011,
    talk_text = function()
      return T_S(11402080110)
    end,
    role_ids = {90110010, 90110009},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140208011/1140208011_90110009.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110010/90110010_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable"
    },
    role_position = {"270:-958", "-270:-1080"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140208012,
    speak_name = function()
      return T_S(11402080115)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00332",
    text_sound_bank = "bank:/voice_cn/sty/M0015_6_14th",
    env_sound = 20008
  },
  [1140208012] = {
    id = 1140208012,
    talk_text = function()
      return T_S(11402080120)
    end,
    next_dialog = 1140208013,
    env_sound = 20008
  },
  [1140208013] = {
    id = 1140208013,
    talk_text = function()
      return T_S(11402080130)
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
    next_dialog = 1140208014,
    speak_name = function()
      return T_S(11402080135)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00447",
    text_sound_bank = "bank:/voice_cn/sty/M0001_7_14th",
    env_sound = 20008
  },
  [1140208014] = {
    id = 1140208014,
    talk_text = function()
      return T_S(11402080140)
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
    role_position = {"270:-1000", "-270:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1140208015,
    speak_name = function()
      return T_S(11402080145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00748",
    text_sound_bank = "bank:/voice_cn/sty/M0003_9_14th",
    env_sound = 20008
  },
  [1140208015] = {
    id = 1140208015,
    talk_text = function()
      return T_S(11402080150)
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
    next_dialog = 1140208016,
    speak_name = function()
      return T_S(11402080155)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00451",
    text_sound_bank = "bank:/voice_cn/sty/M0002_7_14th",
    env_sound = 20008
  },
  [1140208016] = {
    id = 1140208016,
    talk_text = function()
      return T_S(11402080160)
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
    next_dialog = 1140208017,
    speak_name = function()
      return T_S(11402080165)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00527",
    text_sound_bank = "bank:/voice_cn/sty/M0004_8_14th",
    env_sound = 20008
  },
  [1140208017] = {
    id = 1140208017,
    talk_text = function()
      return T_S(11402080170)
    end,
    is_master = 1,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00715",
    text_sound_bank = "bank:/voice_cn/sty/M0000_8_14th",
    env_sound = 20008
  }
}
