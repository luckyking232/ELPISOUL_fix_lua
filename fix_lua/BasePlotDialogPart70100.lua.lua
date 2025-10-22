BasePlotDialogPart70100 = {
  [1140301001] = {
    id = 1140301001,
    talk_text = function()
      return T_S(11403010010)
    end,
    next_dialog = 1140301002,
    env_sound = 20003,
    open_title_1 = function()
      return T_S(11403010018)
    end,
    open_title_2 = function()
      return T_S(11403010019)
    end
  },
  [1140301002] = {
    id = 1140301002,
    talk_text = function()
      return T_S(11403010020)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_2.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140301003,
    speak_name = function()
      return T_S(11403010025)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00119",
    text_sound_bank = "bank:/voice_cn/sty/M0018_2_14th",
    env_sound = 20003
  },
  [1140301003] = {
    id = 1140301003,
    talk_text = function()
      return T_S(11403010030)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140301004,
    env_sound = 20003
  },
  [1140301004] = {
    id = 1140301004,
    talk_text = function()
      return T_S(11403010040)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"crazy"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140301005,
    env_sound = 20003
  },
  [1140301005] = {
    id = 1140301005,
    talk_text = function()
      return T_S(11403010050)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1140301005/1140301005_90110011.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1140301006,
    env_sound = 20003
  },
  [1140301006] = {
    id = 1140301006,
    talk_text = function()
      return T_S(11403010060)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1140301007,
    speak_name = function()
      return T_S(11403010065)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00120",
    text_sound_bank = "bank:/voice_cn/sty/M0018_2_14th",
    env_sound = 20003
  },
  [1140301007] = {
    id = 1140301007,
    talk_text = function()
      return T_S(11403010070)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110011/90110011_0.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11403010075)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00121",
    text_sound_bank = "bank:/voice_cn/sty/M0018_2_14th",
    env_sound = 20003
  },
  [1140302001] = {
    id = 1140302001,
    talk_text = function()
      return T_S(11403020010)
    end,
    next_dialog = 1140302002,
    speak_head = 90120033,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11403020015)
    end,
    text_sound_path = "event:/voice_cn/story/S0122/S0122_story_00026",
    text_sound_bank = "bank:/voice_cn/sty/S0122_1_14th",
    env_sound = 20003
  },
  [1140302002] = {
    id = 1140302002,
    talk_text = function()
      return T_S(11403020020)
    end,
    next_dialog = 1140302003,
    speak_head = 90120033,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11403020025)
    end,
    text_sound_path = "event:/voice_cn/story/S0122/S0122_story_00027",
    text_sound_bank = "bank:/voice_cn/sty/S0122_1_14th",
    env_sound = 20003
  },
  [1140302003] = {
    id = 1140302003,
    talk_text = function()
      return T_S(11403020030)
    end,
    next_dialog = 1140302004,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11403020035)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00061",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20003
  },
  [1140302004] = {
    id = 1140302004,
    talk_text = function()
      return T_S(11403020040)
    end,
    speak_head = 90120072,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11403020045)
    end,
    text_sound_path = "event:/voice_cn/story/S0126/S0126_story_00062",
    text_sound_bank = "bank:/voice_cn/sty/S0126_1_14th",
    env_sound = 20003
  }
}
