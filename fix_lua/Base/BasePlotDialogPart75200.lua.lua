BasePlotDialogPart75200 = {
  [1150501001] = {
    id = 1150501001,
    talk_text = function()
      return T_S(11505010010)
    end,
    next_dialog = 1150501002,
    speak_head = 90120031,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11505010015)
    end,
    env_sound = 20009,
    open_title_1 = function()
      return T_S(11505010018)
    end,
    open_title_2 = function()
      return T_S(11505010019)
    end
  },
  [1150501002] = {
    id = 1150501002,
    talk_text = function()
      return T_S(11505010020)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501002/1150501002_90110002.playable"
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
    next_dialog = 1150501003,
    speak_name = function()
      return T_S(11505010025)
    end,
    env_sound = 20008
  },
  [1150501003] = {
    id = 1150501003,
    talk_text = function()
      return T_S(11505010030)
    end,
    role_ids = {90110002, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501003/1150501003_90110004.playable"
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
    next_dialog = 1150501004,
    speak_name = function()
      return T_S(11505010035)
    end,
    env_sound = 20008
  },
  [1150501004] = {
    id = 1150501004,
    talk_text = function()
      return T_S(11505010040)
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
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 1150501005,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010045)
    end,
    env_sound = 20008
  },
  [1150501005] = {
    id = 1150501005,
    talk_text = function()
      return T_S(11505010050)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501005/1150501005_90110001.playable"
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
    next_dialog = 1150501006,
    speak_name = function()
      return T_S(11505010055)
    end,
    env_sound = 20008
  },
  [1150501006] = {
    id = 1150501006,
    talk_text = function()
      return T_S(11505010060)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1150501007,
    speak_name = function()
      return T_S(11505010065)
    end,
    env_sound = 20008
  },
  [1150501007] = {
    id = 1150501007,
    talk_text = function()
      return T_S(11505010070)
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
    next_dialog = 1150501008,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010075)
    end,
    env_sound = 20008
  },
  [1150501008] = {
    id = 1150501008,
    talk_text = function()
      return T_S(11505010080)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 1150501009,
    env_sound = 20008
  },
  [1150501009] = {
    id = 1150501009,
    talk_text = function()
      return T_S(11505010090)
    end,
    next_dialog = 1150501010,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010095)
    end,
    env_sound = 20008
  },
  [1150501010] = {
    id = 1150501010,
    talk_text = function()
      return T_S(11505010100)
    end,
    next_dialog = 1150501011,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010105)
    end,
    env_sound = 20008
  },
  [1150501011] = {
    id = 1150501011,
    talk_text = function()
      return T_S(11505010110)
    end,
    next_dialog = 1150501012,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010115)
    end,
    env_sound = 20008
  },
  [1150501012] = {
    id = 1150501012,
    talk_text = function()
      return T_S(11505010120)
    end,
    next_dialog = 1150501013,
    speak_head = 90120031,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(11505010125)
    end,
    env_sound = 20008
  },
  [1150501013] = {
    id = 1150501013,
    talk_text = function()
      return T_S(11505010130)
    end,
    next_dialog = 1150501014,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010135)
    end,
    env_sound = 20008
  },
  [1150501014] = {
    id = 1150501014,
    talk_text = function()
      return T_S(11505010140)
    end,
    next_dialog = 1150501015,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010145)
    end,
    env_sound = 20008
  },
  [1150501015] = {
    id = 1150501015,
    talk_text = function()
      return T_S(11505010150)
    end,
    next_dialog = 1150501016,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010155)
    end,
    env_sound = 20008
  },
  [1150501016] = {
    id = 1150501016,
    talk_text = function()
      return T_S(11505010160)
    end,
    next_dialog = 1150501017,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010165)
    end,
    env_sound = 20008
  },
  [1150501017] = {
    id = 1150501017,
    talk_text = function()
      return T_S(11505010170)
    end,
    next_dialog = 1150501018,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010175)
    end,
    env_sound = 20008
  },
  [1150501018] = {
    id = 1150501018,
    talk_text = function()
      return T_S(11505010180)
    end,
    next_dialog = 1150501019,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010185)
    end,
    env_sound = 20008
  },
  [1150501019] = {
    id = 1150501019,
    talk_text = function()
      return T_S(11505010190)
    end,
    next_dialog = 1150501020,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010195)
    end,
    env_sound = 20008
  },
  [1150501020] = {
    id = 1150501020,
    talk_text = function()
      return T_S(11505010200)
    end,
    next_dialog = 1150501021,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010205)
    end,
    env_sound = 20008
  },
  [1150501021] = {
    id = 1150501021,
    talk_text = function()
      return T_S(11505010210)
    end,
    next_dialog = 1150501022,
    env_sound = 20008
  },
  [1150501022] = {
    id = 1150501022,
    talk_text = function()
      return T_S(11505010220)
    end,
    next_dialog = 1150501023,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010225)
    end,
    env_sound = 20008
  },
  [1150501023] = {
    id = 1150501023,
    talk_text = function()
      return T_S(11505010230)
    end,
    is_master = 1,
    next_dialog = 1150501024,
    env_sound = 20008
  },
  [1150501024] = {
    id = 1150501024,
    talk_text = function()
      return T_S(11505010240)
    end,
    next_dialog = 1150501025,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010245)
    end,
    env_sound = 20008
  },
  [1150501025] = {
    id = 1150501025,
    talk_text = function()
      return T_S(11505010250)
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
    next_dialog = 1150501026,
    speak_name = function()
      return T_S(11505010255)
    end,
    env_sound = 20008
  },
  [1150501026] = {
    id = 1150501026,
    talk_text = function()
      return T_S(11505010260)
    end,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-308:-1165", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501027,
    speak_name = function()
      return T_S(11505010265)
    end,
    env_sound = 20008
  },
  [1150501027] = {
    id = 1150501027,
    talk_text = function()
      return T_S(11505010270)
    end,
    is_master = 1,
    role_ids = {90110004, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"-308:-1165", "270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 1150501028,
    env_sound = 20008
  },
  [1150501028] = {
    id = 1150501028,
    talk_text = function()
      return T_S(11505010280)
    end,
    next_dialog = 1150501029,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010285)
    end,
    env_sound = 20008
  },
  [1150501029] = {
    id = 1150501029,
    talk_text = function()
      return T_S(11505010290)
    end,
    is_master = 1,
    next_dialog = 1150501030,
    env_sound = 20008
  },
  [1150501030] = {
    id = 1150501030,
    talk_text = function()
      return T_S(11505010300)
    end,
    is_master = 1,
    next_dialog = 1150501031,
    env_sound = 20008
  },
  [1150501031] = {
    id = 1150501031,
    talk_text = function()
      return T_S(11505010310)
    end,
    next_dialog = 1150501032,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010315)
    end,
    env_sound = 20008
  },
  [1150501032] = {
    id = 1150501032,
    talk_text = function()
      return T_S(11505010320)
    end,
    next_dialog = 1150501033,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010325)
    end,
    env_sound = 20008
  },
  [1150501033] = {
    id = 1150501033,
    talk_text = function()
      return T_S(11505010330)
    end,
    next_dialog = 1150501034,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010335)
    end,
    env_sound = 20008
  },
  [1150501034] = {
    id = 1150501034,
    talk_text = function()
      return T_S(11505010340)
    end,
    is_master = 1,
    next_dialog = 1150501035,
    env_sound = 20008
  },
  [1150501035] = {
    id = 1150501035,
    talk_text = function()
      return T_S(11505010350)
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
    next_dialog = 1150501036,
    speak_name = function()
      return T_S(11505010355)
    end,
    env_sound = 20008
  },
  [1150501036] = {
    id = 1150501036,
    talk_text = function()
      return T_S(11505010360)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1150501037,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010365)
    end,
    env_sound = 20008
  },
  [1150501037] = {
    id = 1150501037,
    talk_text = function()
      return T_S(11505010370)
    end,
    next_dialog = 1150501038,
    env_sound = 20008
  },
  [1150501038] = {
    id = 1150501038,
    talk_text = function()
      return T_S(11505010380)
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
    next_dialog = 1150501039,
    speak_name = function()
      return T_S(11505010385)
    end,
    env_sound = 20008
  },
  [1150501039] = {
    id = 1150501039,
    talk_text = function()
      return T_S(11505010390)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 1150501040,
    speak_name = function()
      return T_S(11505010395)
    end,
    env_sound = 20008
  },
  [1150501040] = {
    id = 1150501040,
    talk_text = function()
      return T_S(11505010400)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501040/1150501040_90110002.playable"
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
    next_dialog = 1150501041,
    speak_name = function()
      return T_S(11505010405)
    end,
    env_sound = 20008
  },
  [1150501041] = {
    id = 1150501041,
    talk_text = function()
      return T_S(11505010410)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501042,
    speak_name = function()
      return T_S(11505010415)
    end,
    env_sound = 20008
  },
  [1150501042] = {
    id = 1150501042,
    talk_text = function()
      return T_S(11505010420)
    end,
    role_ids = {90110001, 90110002},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501042/1150501042_90110001.playable",
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1150501043,
    speak_name = function()
      return T_S(11505010425)
    end,
    env_sound = 20008
  },
  [1150501043] = {
    id = 1150501043,
    talk_text = function()
      return T_S(11505010430)
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
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501044,
    speak_name = function()
      return T_S(11505010435)
    end,
    env_sound = 20008
  },
  [1150501044] = {
    id = 1150501044,
    talk_text = function()
      return T_S(11505010440)
    end,
    is_master = 1,
    next_dialog = 1150501045,
    env_sound = 20008
  },
  [1150501045] = {
    id = 1150501045,
    talk_text = function()
      return T_S(11505010450)
    end,
    next_dialog = 1150501046,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010455)
    end,
    env_sound = 20008
  },
  [1150501046] = {
    id = 1150501046,
    talk_text = function()
      return T_S(11505010460)
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
    next_dialog = 1150501047,
    speak_name = function()
      return T_S(11505010465)
    end,
    env_sound = 20008
  },
  [1150501047] = {
    id = 1150501047,
    talk_text = function()
      return T_S(11505010470)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 1150501048,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010475)
    end,
    env_sound = 20008
  },
  [1150501048] = {
    id = 1150501048,
    talk_text = function()
      return T_S(11505010480)
    end,
    next_dialog = 1150501049,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010485)
    end,
    env_sound = 20008
  },
  [1150501049] = {
    id = 1150501049,
    talk_text = function()
      return T_S(11505010490)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501049/1150501049_90110001.playable"
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
    next_dialog = 1150501050,
    speak_name = function()
      return T_S(11505010495)
    end,
    env_sound = 20008
  },
  [1150501050] = {
    id = 1150501050,
    talk_text = function()
      return T_S(11505010500)
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
    next_dialog = 1150501051,
    env_sound = 20008
  },
  [1150501051] = {
    id = 1150501051,
    talk_text = function()
      return T_S(11505010510)
    end,
    next_dialog = 1150501052,
    env_sound = 20008
  },
  [1150501052] = {
    id = 1150501052,
    talk_text = function()
      return T_S(11505010520)
    end,
    next_dialog = 1150501053,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010525)
    end,
    env_sound = 20008
  },
  [1150501053] = {
    id = 1150501053,
    talk_text = function()
      return T_S(11505010530)
    end,
    next_dialog = 1150501054,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010535)
    end,
    env_sound = 20008
  },
  [1150501054] = {
    id = 1150501054,
    talk_text = function()
      return T_S(11505010540)
    end,
    next_dialog = 1150501055,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010545)
    end,
    env_sound = 20008
  },
  [1150501055] = {
    id = 1150501055,
    talk_text = function()
      return T_S(11505010550)
    end,
    next_dialog = 1150501056,
    env_sound = 20008
  },
  [1150501056] = {
    id = 1150501056,
    talk_text = function()
      return T_S(11505010560)
    end,
    role_ids = {90110001},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501056/1150501056_90110001.playable"
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
    next_dialog = 1150501057,
    speak_name = function()
      return T_S(11505010565)
    end,
    env_sound = 20008
  },
  [1150501057] = {
    id = 1150501057,
    talk_text = function()
      return T_S(11505010570)
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
    next_dialog = 1150501058,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010575)
    end,
    env_sound = 20008
  },
  [1150501058] = {
    id = 1150501058,
    talk_text = function()
      return T_S(11505010580)
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
    next_dialog = 1150501059,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010585)
    end,
    env_sound = 20008
  },
  [1150501059] = {
    id = 1150501059,
    talk_text = function()
      return T_S(11505010590)
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
    next_dialog = 1150501060,
    speak_head = 90120031,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11505010595)
    end,
    env_sound = 20008
  },
  [1150501060] = {
    id = 1150501060,
    talk_text = function()
      return T_S(11505010600)
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
    next_dialog = 1150501061,
    env_sound = 20008
  },
  [1150501061] = {
    id = 1150501061,
    talk_text = function()
      return T_S(11505010610)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1000", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501062,
    speak_name = function()
      return T_S(11505010615)
    end,
    env_sound = 20008
  },
  [1150501062] = {
    id = 1150501062,
    talk_text = function()
      return T_S(11505010620)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501062/1150501062_90110001.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1000", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1150501063,
    speak_name = function()
      return T_S(11505010625)
    end,
    env_sound = 20008
  },
  [1150501063] = {
    id = 1150501063,
    talk_text = function()
      return T_S(11505010630)
    end,
    is_master = 1,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1000", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 1150501064,
    env_sound = 20008
  },
  [1150501064] = {
    id = 1150501064,
    talk_text = function()
      return T_S(11505010640)
    end,
    role_ids = {90110001, 90110004},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable"
    },
    role_position = {"270:-1000", "-308:-1165"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1150501065,
    speak_name = function()
      return T_S(11505010645)
    end,
    env_sound = 20008
  },
  [1150501065] = {
    id = 1150501065,
    talk_text = function()
      return T_S(11505010650)
    end,
    role_ids = {90110002},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501065/1150501065_90110002.playable"
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
    next_dialog = 1150501066,
    speak_name = function()
      return T_S(11505010655)
    end,
    env_sound = 20008
  },
  [1150501066] = {
    id = 1150501066,
    talk_text = function()
      return T_S(11505010660)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501066/1150501066_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501067,
    speak_name = function()
      return T_S(11505010665)
    end,
    env_sound = 20008
  },
  [1150501067] = {
    id = 1150501067,
    talk_text = function()
      return T_S(11505010670)
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
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1150501068,
    speak_name = function()
      return T_S(11505010675)
    end,
    env_sound = 20008
  },
  [1150501068] = {
    id = 1150501068,
    talk_text = function()
      return T_S(11505010680)
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
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501069,
    speak_name = function()
      return T_S(11505010685)
    end,
    env_sound = 20008
  },
  [1150501069] = {
    id = 1150501069,
    talk_text = function()
      return T_S(11505010690)
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
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 1150501070,
    speak_name = function()
      return T_S(11505010695)
    end,
    env_sound = 20008
  },
  [1150501070] = {
    id = 1150501070,
    talk_text = function()
      return T_S(11505010700)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501070/1150501070_90110001.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110001/90110001_0.playable"
    },
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501071,
    speak_name = function()
      return T_S(11505010705)
    end,
    env_sound = 20008
  },
  [1150501071] = {
    id = 1150501071,
    talk_text = function()
      return T_S(11505010710)
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
    role_position = {"270:-1066", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 1150501072,
    speak_name = function()
      return T_S(11505010715)
    end,
    env_sound = 20008
  },
  [1150501072] = {
    id = 1150501072,
    talk_text = function()
      return T_S(11505010720)
    end,
    role_ids = {90110002, 90110001},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/1150501072/1150501072_90110002.playable",
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
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(11505010725)
    end,
    env_sound = 20008
  },
  [1150502001] = {
    id = 1150502001,
    talk_text = function()
      return T_S(11505020010)
    end,
    next_dialog = 1150502002,
    env_sound = 20005
  },
  [1150502002] = {
    id = 1150502002,
    talk_text = function()
      return T_S(11505020020)
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
    next_dialog = 1150502003,
    speak_name = function()
      return T_S(11505020025)
    end,
    env_sound = 20005
  },
  [1150502003] = {
    id = 1150502003,
    talk_text = function()
      return T_S(11505020030)
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
    next_dialog = 1150502004,
    env_sound = 20005
  },
  [1150502004] = {
    id = 1150502004,
    talk_text = function()
      return T_S(11505020040)
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
    next_dialog = 1150502005,
    speak_name = function()
      return T_S(11505020045)
    end,
    env_sound = 20005
  },
  [1150502005] = {
    id = 1150502005,
    talk_text = function()
      return T_S(11505020050)
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
    next_dialog = 1150502006,
    env_sound = 20005
  },
  [1150502006] = {
    id = 1150502006,
    talk_text = function()
      return T_S(11505020060)
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
    next_dialog = 1150502007,
    speak_name = function()
      return T_S(11505020065)
    end,
    env_sound = 20005
  },
  [1150502007] = {
    id = 1150502007,
    talk_text = function()
      return T_S(11505020070)
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
    next_dialog = 1150502008,
    env_sound = 20005
  },
  [1150502008] = {
    id = 1150502008,
    talk_text = function()
      return T_S(11505020080)
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
    next_dialog = 1150502009,
    env_sound = 20005
  },
  [1150502009] = {
    id = 1150502009,
    talk_text = function()
      return T_S(11505020090)
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
    next_dialog = 1150502010,
    speak_name = function()
      return T_S(11505020095)
    end,
    env_sound = 20005
  },
  [1150502010] = {
    id = 1150502010,
    talk_text = function()
      return T_S(11505020100)
    end,
    is_master = 1,
    is_os = 1,
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
    next_dialog = 1150502011,
    env_sound = 20005
  },
  [1150502011] = {
    id = 1150502011,
    talk_text = function()
      return T_S(11505020110)
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
    next_dialog = 1150502012,
    env_sound = 20005
  },
  [1150502012] = {
    id = 1150502012,
    talk_text = function()
      return T_S(11505020120)
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
    next_dialog = 1150502013,
    speak_name = function()
      return T_S(11505020125)
    end,
    env_sound = 20005
  },
  [1150502013] = {
    id = 1150502013,
    talk_text = function()
      return T_S(11505020130)
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
    next_dialog = 1150502014,
    env_sound = 20005
  },
  [1150502014] = {
    id = 1150502014,
    talk_text = function()
      return T_S(11505020140)
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
    next_dialog = 1150502015,
    speak_name = function()
      return T_S(11505020145)
    end,
    env_sound = 20005
  },
  [1150502015] = {
    id = 1150502015,
    talk_text = function()
      return T_S(11505020150)
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
    next_dialog = 1150502016,
    env_sound = 20005
  },
  [1150502016] = {
    id = 1150502016,
    talk_text = function()
      return T_S(11505020160)
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
      return T_S(11505020165)
    end,
    env_sound = 20005
  }
}
