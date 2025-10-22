BasePlotDialogPart65050 = {
  [1130201001] = {
    id = 1130201001,
    talk_text = function()
      return T_S(11302010010)
    end,
    next_dialog = 1130201002,
    env_sound = 20005,
    open_title_1 = function()
      return T_S(11302010018)
    end,
    open_title_2 = function()
      return T_S(11302010019)
    end
  },
  [1130201002] = {
    id = 1130201002,
    talk_text = function()
      return T_S(11302010020)
    end,
    next_dialog = 1130201003,
    speak_head = 90120018,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010025)
    end,
    text_sound_path = "event:/voice_cn/story/S0120/S0120_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0120",
    env_sound = 20005
  },
  [1130201003] = {
    id = 1130201003,
    talk_text = function()
      return T_S(11302010030)
    end,
    next_dialog = 1130201004,
    speak_head = 90120018,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010035)
    end,
    text_sound_path = "event:/voice_cn/story/S0120/S0120_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0120",
    env_sound = 20005
  },
  [1130201004] = {
    id = 1130201004,
    talk_text = function()
      return T_S(11302010040)
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
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130201005,
    speak_name = function()
      return T_S(11302010045)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00101",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201005] = {
    id = 1130201005,
    talk_text = function()
      return T_S(11302010050)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201006,
    env_sound = 20005
  },
  [1130201006] = {
    id = 1130201006,
    talk_text = function()
      return T_S(11302010060)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201007,
    speak_head = 90120018,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11302010065)
    end,
    text_sound_path = "event:/voice_cn/story/S0120/S0120_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/S0120",
    env_sound = 20005
  },
  [1130201007] = {
    id = 1130201007,
    talk_text = function()
      return T_S(11302010070)
    end,
    is_os = 1,
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201008,
    speak_head = 90120018,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11302010075)
    end,
    text_sound_path = "event:/voice_cn/story/S0120/S0120_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/S0120",
    env_sound = 20005
  },
  [1130201008] = {
    id = 1130201008,
    talk_text = function()
      return T_S(11302010080)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201009,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010085)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201009] = {
    id = 1130201009,
    talk_text = function()
      return T_S(11302010090)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201010,
    env_sound = 20005
  },
  [1130201010] = {
    id = 1130201010,
    talk_text = function()
      return T_S(11302010100)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_2.playable"
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
    next_dialog = 1130201011,
    speak_name = function()
      return T_S(11302010105)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00102",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201011] = {
    id = 1130201011,
    talk_text = function()
      return T_S(11302010110)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201012,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010115)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201012] = {
    id = 1130201012,
    talk_text = function()
      return T_S(11302010120)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201013,
    env_sound = 20005
  },
  [1130201013] = {
    id = 1130201013,
    talk_text = function()
      return T_S(11302010130)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201014,
    env_sound = 20005
  },
  [1130201014] = {
    id = 1130201014,
    talk_text = function()
      return T_S(11302010140)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201015,
    env_sound = 20005
  },
  [1130201015] = {
    id = 1130201015,
    talk_text = function()
      return T_S(11302010150)
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
    next_dialog = 1130201016,
    speak_name = function()
      return T_S(11302010155)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00103",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201016] = {
    id = 1130201016,
    talk_text = function()
      return T_S(11302010160)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201017,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010165)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00003",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201017] = {
    id = 1130201017,
    talk_text = function()
      return T_S(11302010170)
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
    next_dialog = 1130201018,
    speak_name = function()
      return T_S(11302010175)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00104",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201018] = {
    id = 1130201018,
    talk_text = function()
      return T_S(11302010180)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201019,
    speak_head = 90120070,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11302010185)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00004",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201019] = {
    id = 1130201019,
    talk_text = function()
      return T_S(11302010190)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130201019/1130201019_90110011.playable"
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
    next_dialog = 1130201020,
    speak_name = function()
      return T_S(11302010195)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00105",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201020] = {
    id = 1130201020,
    talk_text = function()
      return T_S(11302010200)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201021,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010205)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00005",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201021] = {
    id = 1130201021,
    talk_text = function()
      return T_S(11302010210)
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
    next_dialog = 1130201022,
    speak_name = function()
      return T_S(11302010215)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00106",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201022] = {
    id = 1130201022,
    talk_text = function()
      return T_S(11302010220)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201023,
    env_sound = 20005
  },
  [1130201023] = {
    id = 1130201023,
    talk_text = function()
      return T_S(11302010230)
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
    next_dialog = 1130201024,
    speak_name = function()
      return T_S(11302010235)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00107",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201024] = {
    id = 1130201024,
    talk_text = function()
      return T_S(11302010240)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201025,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010245)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00006",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201025] = {
    id = 1130201025,
    talk_text = function()
      return T_S(11302010250)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_2.playable"
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
    next_dialog = 1130201026,
    speak_name = function()
      return T_S(11302010255)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00108",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201026] = {
    id = 1130201026,
    talk_text = function()
      return T_S(11302010260)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201027,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010265)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00006_01",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201027] = {
    id = 1130201027,
    talk_text = function()
      return T_S(11302010270)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201028,
    speak_head = 90120070,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11302010275)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00007",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201028] = {
    id = 1130201028,
    talk_text = function()
      return T_S(11302010280)
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
    next_dialog = 1130201029,
    speak_name = function()
      return T_S(11302010285)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00109",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201029] = {
    id = 1130201029,
    talk_text = function()
      return T_S(11302010290)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201030,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010295)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00008",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201030] = {
    id = 1130201030,
    talk_text = function()
      return T_S(11302010300)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201031,
    env_sound = 20005
  },
  [1130201031] = {
    id = 1130201031,
    talk_text = function()
      return T_S(11302010310)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130201031/1130201031_90110011.playable"
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
    next_dialog = 1130201032,
    speak_name = function()
      return T_S(11302010315)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00110",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201032] = {
    id = 1130201032,
    talk_text = function()
      return T_S(11302010320)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201033,
    speak_head = 90120070,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11302010325)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00009",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201033] = {
    id = 1130201033,
    talk_text = function()
      return T_S(11302010330)
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
    next_dialog = 1130201034,
    speak_name = function()
      return T_S(11302010335)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00111",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201034] = {
    id = 1130201034,
    talk_text = function()
      return T_S(11302010340)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201035,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010345)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00010",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201035] = {
    id = 1130201035,
    talk_text = function()
      return T_S(11302010350)
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
    next_dialog = 1130201036,
    speak_name = function()
      return T_S(11302010355)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00112",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201036] = {
    id = 1130201036,
    talk_text = function()
      return T_S(11302010360)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201037,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010365)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00011",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201037] = {
    id = 1130201037,
    talk_text = function()
      return T_S(11302010370)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201038,
    env_sound = 20005
  },
  [1130201038] = {
    id = 1130201038,
    talk_text = function()
      return T_S(11302010380)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201039,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010385)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00012",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201039] = {
    id = 1130201039,
    talk_text = function()
      return T_S(11302010390)
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
    next_dialog = 1130201040,
    speak_name = function()
      return T_S(11302010395)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00112_01",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201040] = {
    id = 1130201040,
    talk_text = function()
      return T_S(11302010400)
    end,
    role_ids = {90110011},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110011/90110011_1.playable"
    },
    role_position = {"-48:-1033"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130201041,
    speak_name = function()
      return T_S(11302010405)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00113",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201041] = {
    id = 1130201041,
    talk_text = function()
      return T_S(11302010410)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201042,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010415)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00013",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201042] = {
    id = 1130201042,
    talk_text = function()
      return T_S(11302010420)
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
    next_dialog = 1130201043,
    speak_name = function()
      return T_S(11302010425)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00114",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130201043] = {
    id = 1130201043,
    talk_text = function()
      return T_S(11302010430)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201044,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010435)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00014",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201044] = {
    id = 1130201044,
    talk_text = function()
      return T_S(11302010440)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1130201045,
    speak_head = 90120070,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11302010445)
    end,
    text_sound_path = "event:/voice_cn/story/M0027/M0027_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/M0027",
    env_sound = 20005
  },
  [1130201045] = {
    id = 1130201045,
    talk_text = function()
      return T_S(11302010450)
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
      return T_S(11302010455)
    end,
    text_sound_path = "event:/voice_cn/story/M0018/M0018_story_00115",
    text_sound_bank = "bank:/voice_cn/sty/M0018_1",
    env_sound = 20005
  },
  [1130202001] = {
    id = 1130202001,
    talk_text = function()
      return T_S(11302020010)
    end,
    next_dialog = 1130202002,
    env_sound = 20007
  },
  [1130202002] = {
    id = 1130202002,
    talk_text = function()
      return T_S(11302020020)
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
    next_dialog = 1130202003,
    speak_name = function()
      return T_S(11302020025)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00665",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202003] = {
    id = 1130202003,
    talk_text = function()
      return T_S(11302020030)
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
    next_dialog = 1130202004,
    speak_name = function()
      return T_S(11302020035)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00666",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202004] = {
    id = 1130202004,
    talk_text = function()
      return T_S(11302020040)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202004/1130202004_90110002.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-300:-980", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130202005,
    speak_name = function()
      return T_S(11302020045)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00409",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20007
  },
  [1130202005] = {
    id = 1130202005,
    talk_text = function()
      return T_S(11302020050)
    end,
    role_ids = {90110003, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202005/1130202005_90110003.playable",
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130202006,
    speak_name = function()
      return T_S(11302020055)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00667",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202006] = {
    id = 1130202006,
    talk_text = function()
      return T_S(11302020060)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130202007,
    speak_name = function()
      return T_S(11302020065)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00410",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20007
  },
  [1130202007] = {
    id = 1130202007,
    talk_text = function()
      return T_S(11302020070)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202007/1130202007_90110004.playable"
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
    next_dialog = 1130202008,
    speak_name = function()
      return T_S(11302020075)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00485",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130202008] = {
    id = 1130202008,
    talk_text = function()
      return T_S(11302020080)
    end,
    role_ids = {90110004, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202008/1130202008_90110009.playable"
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
    next_dialog = 1130202009,
    speak_name = function()
      return T_S(11302020085)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00276",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20007
  },
  [1130202009] = {
    id = 1130202009,
    talk_text = function()
      return T_S(11302020090)
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
    next_dialog = 1130202010,
    env_sound = 20007
  },
  [1130202010] = {
    id = 1130202010,
    talk_text = function()
      return T_S(11302020100)
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130202011,
    speak_name = function()
      return T_S(11302020105)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00486",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130202011] = {
    id = 1130202011,
    talk_text = function()
      return T_S(11302020110)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130202012,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00635",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130202012] = {
    id = 1130202012,
    talk_text = function()
      return T_S(11302020120)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202012/1130202012_90110001.playable"
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
    next_dialog = 1130202013,
    speak_name = function()
      return T_S(11302020125)
    end,
    text_sound_path = "event:/voice_cn/story/M0001/M0001_story_00412",
    text_sound_bank = "bank:/voice_cn/sty/M0001_6",
    env_sound = 20007
  },
  [1130202013] = {
    id = 1130202013,
    talk_text = function()
      return T_S(11302020130)
    end,
    next_dialog = 1130202014,
    env_sound = 20007
  },
  [1130202014] = {
    id = 1130202014,
    talk_text = function()
      return T_S(11302020140)
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
    effect_in = {"2"},
    effect_in_param = {"150"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1130202015,
    speak_name = function()
      return T_S(11302020145)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00668",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202015] = {
    id = 1130202015,
    talk_text = function()
      return T_S(11302020150)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202015/1130202015_90110009.playable"
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
    next_dialog = 1130202016,
    speak_name = function()
      return T_S(11302020155)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00277",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20007
  },
  [1130202016] = {
    id = 1130202016,
    talk_text = function()
      return T_S(11302020160)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202016/1130202016_90110003.playable",
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130202017,
    speak_name = function()
      return T_S(11302020165)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00669",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202017] = {
    id = 1130202017,
    talk_text = function()
      return T_S(11302020170)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202017/1130202017_90110002.playable"
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
    next_dialog = 1130202018,
    speak_name = function()
      return T_S(11302020175)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00411",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20007
  },
  [1130202018] = {
    id = 1130202018,
    talk_text = function()
      return T_S(11302020180)
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
    next_dialog = 1130202019,
    speak_name = function()
      return T_S(11302020185)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00487",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130202019] = {
    id = 1130202019,
    talk_text = function()
      return T_S(11302020190)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130202020,
    env_sound = 20007
  },
  [1130202020] = {
    id = 1130202020,
    talk_text = function()
      return T_S(11302020200)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202020/1130202020_90110002.playable",
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130202021,
    speak_name = function()
      return T_S(11302020205)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00488",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130202021] = {
    id = 1130202021,
    talk_text = function()
      return T_S(11302020210)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130202022,
    speak_name = function()
      return T_S(11302020215)
    end,
    text_sound_path = "event:/voice_cn/story/M0004/M0004_story_00489",
    text_sound_bank = "bank:/voice_cn/sty/M0004_7",
    env_sound = 20007
  },
  [1130202022] = {
    id = 1130202022,
    talk_text = function()
      return T_S(11302020220)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1130202023,
    text_sound_path = "event:/voice_cn/story/M0000/M0000_story_00636",
    text_sound_bank = "bank:/voice_cn/sty/M0000_7",
    env_sound = 20007
  },
  [1130202023] = {
    id = 1130202023,
    talk_text = function()
      return T_S(11302020230)
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
    next_dialog = 1130202024,
    speak_name = function()
      return T_S(11302020235)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00412",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20007
  },
  [1130202024] = {
    id = 1130202024,
    talk_text = function()
      return T_S(11302020240)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202024/1130202024_90110003.playable",
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
    next_dialog = 1130202025,
    speak_name = function()
      return T_S(11302020245)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00670",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202025] = {
    id = 1130202025,
    talk_text = function()
      return T_S(11302020250)
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
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130202026,
    speak_name = function()
      return T_S(11302020255)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00671",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202026] = {
    id = 1130202026,
    talk_text = function()
      return T_S(11302020260)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202026/1130202026_90110009.playable"
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
    next_dialog = 1130202027,
    speak_name = function()
      return T_S(11302020265)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00278",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20007
  },
  [1130202027] = {
    id = 1130202027,
    talk_text = function()
      return T_S(11302020270)
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
    next_dialog = 1130202028,
    env_sound = 20007
  },
  [1130202028] = {
    id = 1130202028,
    talk_text = function()
      return T_S(11302020280)
    end,
    role_ids = {90110003, 90110009},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202028/1130202028_90110003.playable",
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1130202029,
    speak_name = function()
      return T_S(11302020285)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00672",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202029] = {
    id = 1130202029,
    talk_text = function()
      return T_S(11302020290)
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
    next_dialog = 1130202030,
    speak_name = function()
      return T_S(11302020295)
    end,
    text_sound_path = "event:/voice_cn/story/M0002/M0002_story_00413",
    text_sound_bank = "bank:/voice_cn/sty/M0002_6",
    env_sound = 20007
  },
  [1130202030] = {
    id = 1130202030,
    talk_text = function()
      return T_S(11302020300)
    end,
    role_ids = {90110002, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1130202030/1130202030_90110003.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1066", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1130202031,
    speak_name = function()
      return T_S(11302020305)
    end,
    text_sound_path = "event:/voice_cn/story/M0003/M0003_story_00673",
    text_sound_bank = "bank:/voice_cn/sty/M0003_8",
    env_sound = 20007
  },
  [1130202031] = {
    id = 1130202031,
    talk_text = function()
      return T_S(11302020310)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(11302020315)
    end,
    text_sound_path = "event:/voice_cn/story/M0015/M0015_story_00279",
    text_sound_bank = "bank:/voice_cn/sty/M0015_5",
    env_sound = 20007,
    force_auto = 1
  }
}
