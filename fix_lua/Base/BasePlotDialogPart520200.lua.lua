BasePlotDialogPart520200 = {
  [2040501001] = {
    id = 2040501001,
    talk_text = function()
      return T_S(20405010010)
    end,
    next_dialog = 2040501002,
    env_sound = 20004,
    open_title_1 = function()
      return T_S(20405010018)
    end,
    open_title_2 = function()
      return T_S(20405010019)
    end
  },
  [2040501002] = {
    id = 2040501002,
    talk_text = function()
      return T_S(20405010020)
    end,
    next_dialog = 2040501003,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20405010025)
    end,
    env_sound = 20004
  },
  [2040501003] = {
    id = 2040501003,
    talk_text = function()
      return T_S(20405010030)
    end,
    next_dialog = 2040501004,
    env_sound = 20004
  },
  [2040501004] = {
    id = 2040501004,
    talk_text = function()
      return T_S(20405010040)
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
    next_dialog = 2040501005,
    speak_name = function()
      return T_S(20405010045)
    end,
    env_sound = 20004
  },
  [2040501005] = {
    id = 2040501005,
    talk_text = function()
      return T_S(20405010050)
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040501006,
    speak_name = function()
      return T_S(20405010055)
    end,
    env_sound = 20004
  },
  [2040501006] = {
    id = 2040501006,
    talk_text = function()
      return T_S(20405010060)
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
    next_dialog = 2040501007,
    speak_name = function()
      return T_S(20405010065)
    end,
    env_sound = 20004
  },
  [2040501007] = {
    id = 2040501007,
    talk_text = function()
      return T_S(20405010070)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2040501008,
    env_sound = 20004
  },
  [2040501008] = {
    id = 2040501008,
    talk_text = function()
      return T_S(20405010080)
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
    next_dialog = 2040501009,
    env_sound = 20004
  },
  [2040501009] = {
    id = 2040501009,
    talk_text = function()
      return T_S(20405010090)
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
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2040501010,
    env_sound = 20004
  },
  [2040501010] = {
    id = 2040501010,
    talk_text = function()
      return T_S(20405010100)
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
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040501011,
    speak_name = function()
      return T_S(20405010105)
    end,
    env_sound = 20004
  },
  [2040501011] = {
    id = 2040501011,
    talk_text = function()
      return T_S(20405010110)
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
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040501012,
    speak_name = function()
      return T_S(20405010115)
    end,
    env_sound = 20004
  },
  [2040501012] = {
    id = 2040501012,
    talk_text = function()
      return T_S(20405010120)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2040501012/2040501012_90110004.playable"
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
    next_dialog = 2040501013,
    speak_name = function()
      return T_S(20405010125)
    end,
    env_sound = 20004
  },
  [2040501013] = {
    id = 2040501013,
    talk_text = function()
      return T_S(20405010130)
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
    next_dialog = 2040501014,
    env_sound = 20004
  },
  [2040501014] = {
    id = 2040501014,
    talk_text = function()
      return T_S(20405010140)
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
    effect_out = {"4"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040501015,
    speak_name = function()
      return T_S(20405010145)
    end,
    env_sound = 20004
  },
  [2040501015] = {
    id = 2040501015,
    talk_text = function()
      return T_S(20405010150)
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
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2040501016,
    speak_name = function()
      return T_S(20405010155)
    end,
    env_sound = 20004
  },
  [2040501016] = {
    id = 2040501016,
    talk_text = function()
      return T_S(20405010160)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 2040501017,
    env_sound = 20004
  },
  [2040501017] = {
    id = 2040501017,
    talk_text = function()
      return T_S(20405010170)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2040501018,
    speak_name = function()
      return T_S(20405010175)
    end,
    env_sound = 20004
  },
  [2040501018] = {
    id = 2040501018,
    talk_text = function()
      return T_S(20405010180)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040501019,
    speak_name = function()
      return T_S(20405010185)
    end,
    env_sound = 20004
  },
  [2040501019] = {
    id = 2040501019,
    talk_text = function()
      return T_S(20405010190)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 1},
    next_dialog = 2040501020,
    env_sound = 20004
  },
  [2040501020] = {
    id = 2040501020,
    talk_text = function()
      return T_S(20405010200)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040501021,
    speak_name = function()
      return T_S(20405010205)
    end,
    env_sound = 20004
  },
  [2040501021] = {
    id = 2040501021,
    talk_text = function()
      return T_S(20405010210)
    end,
    is_master = 1,
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2040501022,
    env_sound = 20004
  },
  [2040501022] = {
    id = 2040501022,
    talk_text = function()
      return T_S(20405010220)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040501023,
    speak_name = function()
      return T_S(20405010225)
    end,
    env_sound = 20004
  },
  [2040501023] = {
    id = 2040501023,
    talk_text = function()
      return T_S(20405010230)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2040501024,
    speak_name = function()
      return T_S(20405010235)
    end,
    env_sound = 20004
  },
  [2040501024] = {
    id = 2040501024,
    talk_text = function()
      return T_S(20405010240)
    end,
    is_master = 1,
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
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2040501025,
    env_sound = 20004
  },
  [2040501025] = {
    id = 2040501025,
    talk_text = function()
      return T_S(20405010250)
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
    next_dialog = 2040501026,
    speak_name = function()
      return T_S(20405010255)
    end,
    env_sound = 20004
  },
  [2040501026] = {
    id = 2040501026,
    talk_text = function()
      return T_S(20405010260)
    end,
    role_ids = {90110004, 90110003},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
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
    next_dialog = 2040501027,
    speak_name = function()
      return T_S(20405010265)
    end,
    env_sound = 20004
  },
  [2040501027] = {
    id = 2040501027,
    talk_text = function()
      return T_S(20405010270)
    end,
    next_dialog = 2040501028,
    speak_head = 90120036,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20405010275)
    end,
    env_sound = 20004
  },
  [2040501028] = {
    id = 2040501028,
    talk_text = function()
      return T_S(20405010280)
    end,
    next_dialog = 2040501029,
    env_sound = 20004
  },
  [2040501029] = {
    id = 2040501029,
    talk_text = function()
      return T_S(20405010290)
    end,
    next_dialog = 2040501030,
    env_sound = 20004
  },
  [2040501030] = {
    id = 2040501030,
    talk_text = function()
      return T_S(20405010300)
    end,
    next_dialog = 2040501031,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20405010305)
    end,
    env_sound = 20004
  },
  [2040501031] = {
    id = 2040501031,
    talk_text = function()
      return T_S(20405010310)
    end,
    next_dialog = 2040501032,
    speak_head = 90120040,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20405010315)
    end,
    env_sound = 20004
  },
  [2040501032] = {
    id = 2040501032,
    talk_text = function()
      return T_S(20405010320)
    end,
    next_dialog = 2040501033,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20405010325)
    end,
    env_sound = 20004
  },
  [2040501033] = {
    id = 2040501033,
    talk_text = function()
      return T_S(20405010330)
    end,
    next_dialog = 2040501034,
    speak_head = 90120040,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20405010335)
    end,
    env_sound = 20004
  },
  [2040501034] = {
    id = 2040501034,
    talk_text = function()
      return T_S(20405010340)
    end,
    next_dialog = 2040501035,
    camera_shake = {
      "2",
      "0",
      "2000"
    },
    env_sound = 20004
  },
  [2040501035] = {
    id = 2040501035,
    talk_text = function()
      return T_S(20405010350)
    end,
    next_dialog = 2040501036,
    env_sound = 20004
  },
  [2040501036] = {
    id = 2040501036,
    talk_text = function()
      return T_S(20405010360)
    end,
    is_master = 1,
    next_dialog = 2040501037,
    env_sound = 20004
  },
  [2040501037] = {
    id = 2040501037,
    talk_text = function()
      return T_S(20405010370)
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
    next_dialog = 2040501038,
    speak_name = function()
      return T_S(20405010375)
    end,
    env_sound = 20004
  },
  [2040501038] = {
    id = 2040501038,
    talk_text = function()
      return T_S(20405010380)
    end,
    is_master = 1,
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
    next_dialog = 2040501039,
    env_sound = 20004
  },
  [2040501039] = {
    id = 2040501039,
    talk_text = function()
      return T_S(20405010390)
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
    next_dialog = 2040501040,
    speak_name = function()
      return T_S(20405010395)
    end,
    env_sound = 20004
  },
  [2040501040] = {
    id = 2040501040,
    talk_text = function()
      return T_S(20405010400)
    end,
    next_dialog = 2040501041,
    env_sound = 20004
  },
  [2040501041] = {
    id = 2040501041,
    talk_text = function()
      return T_S(20405010410)
    end,
    next_dialog = 2040501042,
    env_sound = 20004
  },
  [2040501042] = {
    id = 2040501042,
    talk_text = function()
      return T_S(20405010420)
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
    effect_in = {"2"},
    effect_in_param = {"150"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040501043,
    speak_name = function()
      return T_S(20405010425)
    end,
    env_sound = 20004
  },
  [2040501043] = {
    id = 2040501043,
    talk_text = function()
      return T_S(20405010430)
    end,
    next_dialog = 2040501044,
    env_sound = 20004
  },
  [2040501044] = {
    id = 2040501044,
    talk_text = function()
      return T_S(20405010440)
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
    effect_in = {"3"},
    effect_in_param = {"150"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040501045,
    speak_name = function()
      return T_S(20405010445)
    end,
    env_sound = 20004
  },
  [2040501045] = {
    id = 2040501045,
    talk_text = function()
      return T_S(20405010450)
    end,
    next_dialog = 2040501046,
    env_sound = 20004
  },
  [2040501046] = {
    id = 2040501046,
    talk_text = function()
      return T_S(20405010460)
    end,
    is_master = 1,
    next_dialog = 2040501047,
    env_sound = 20004
  },
  [2040501047] = {
    id = 2040501047,
    talk_text = function()
      return T_S(20405010470)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2040501048,
    env_sound = 20004
  },
  [2040501048] = {
    id = 2040501048,
    talk_text = function()
      return T_S(20405010480)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040501049,
    speak_name = function()
      return T_S(20405010485)
    end,
    env_sound = 20004
  },
  [2040501049] = {
    id = 2040501049,
    talk_text = function()
      return T_S(20405010490)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2040501050,
    env_sound = 20004
  },
  [2040501050] = {
    id = 2040501050,
    talk_text = function()
      return T_S(20405010500)
    end,
    is_master = 1,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2040501051,
    env_sound = 20004
  },
  [2040501051] = {
    id = 2040501051,
    talk_text = function()
      return T_S(20405010510)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2040501052,
    env_sound = 20004
  },
  [2040501052] = {
    id = 2040501052,
    talk_text = function()
      return T_S(20405010520)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040501053,
    speak_name = function()
      return T_S(20405010525)
    end,
    env_sound = 20004
  },
  [2040501053] = {
    id = 2040501053,
    talk_text = function()
      return T_S(20405010530)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2040501054,
    env_sound = 20004
  },
  [2040501054] = {
    id = 2040501054,
    talk_text = function()
      return T_S(20405010540)
    end,
    next_dialog = 2040501055,
    camera_shake = {
      "2",
      "0",
      "2000"
    },
    env_sound = 20004
  },
  [2040501055] = {
    id = 2040501055,
    talk_text = function()
      return T_S(20405010550)
    end,
    next_dialog = 2040501056,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20405010555)
    end,
    env_sound = 20004
  },
  [2040501056] = {
    id = 2040501056,
    talk_text = function()
      return T_S(20405010560)
    end,
    next_dialog = 2040501057,
    env_sound = 20004
  },
  [2040501057] = {
    id = 2040501057,
    talk_text = function()
      return T_S(20405010570)
    end,
    role_ids = {90110031},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"0:-1011"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040501058,
    speak_name = function()
      return T_S(20405010575)
    end,
    env_sound = 20004
  },
  [2040501058] = {
    id = 2040501058,
    talk_text = function()
      return T_S(20405010580)
    end,
    role_ids = {90110031, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1011", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040501059,
    speak_name = function()
      return T_S(20405010585)
    end,
    env_sound = 20004
  },
  [2040501059] = {
    id = 2040501059,
    talk_text = function()
      return T_S(20405010590)
    end,
    is_master = 0,
    role_ids = {90110031, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1011", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {1, 0},
    next_dialog = 2040501060,
    env_sound = 20004
  },
  [2040501060] = {
    id = 2040501060,
    talk_text = function()
      return T_S(20405010600)
    end,
    role_ids = {90110031, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1011", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2040501061,
    speak_name = function()
      return T_S(20405010605)
    end,
    env_sound = 20004
  },
  [2040501061] = {
    id = 2040501061,
    talk_text = function()
      return T_S(20405010610)
    end,
    role_ids = {90110031, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1011", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2040501062,
    speak_name = function()
      return T_S(20405010615)
    end,
    env_sound = 20004
  },
  [2040501062] = {
    id = 2040501062,
    talk_text = function()
      return T_S(20405010620)
    end,
    is_master = 1,
    role_ids = {90110031, 90110002},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110002/90110002_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110002/90110002_0.playable"
    },
    role_position = {"-270:-1011", "270:-1066"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    env_sound = 20004
  }
}
