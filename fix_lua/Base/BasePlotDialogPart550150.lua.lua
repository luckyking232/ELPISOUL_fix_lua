BasePlotDialogPart550150 = {
  [2100401001] = {
    id = 2100401001,
    talk_text = function()
      return T_S(21004010010)
    end,
    next_dialog = 2100401002,
    env_sound = 20001,
    open_title_1 = function()
      return T_S(21004010018)
    end,
    open_title_2 = function()
      return T_S(21004010019)
    end
  },
  [2100401002] = {
    id = 2100401002,
    talk_text = function()
      return T_S(21004010020)
    end,
    next_dialog = 2100401003,
    env_sound = 20001
  },
  [2100401003] = {
    id = 2100401003,
    talk_text = function()
      return T_S(21004010030)
    end,
    next_dialog = 2100401004,
    env_sound = 20001
  },
  [2100401004] = {
    id = 2100401004,
    talk_text = function()
      return T_S(21004010040)
    end,
    next_dialog = 2100401005,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010045)
    end,
    env_sound = 20001
  },
  [2100401005] = {
    id = 2100401005,
    talk_text = function()
      return T_S(21004010050)
    end,
    next_dialog = 2100401006,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010055)
    end,
    env_sound = 20001
  },
  [2100401006] = {
    id = 2100401006,
    talk_text = function()
      return T_S(21004010060)
    end,
    next_dialog = 2100401007,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010065)
    end,
    env_sound = 20001
  },
  [2100401007] = {
    id = 2100401007,
    talk_text = function()
      return T_S(21004010070)
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
    next_dialog = 2100401008,
    speak_name = function()
      return T_S(21004010075)
    end,
    env_sound = 20001
  },
  [2100401008] = {
    id = 2100401008,
    talk_text = function()
      return T_S(21004010080)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401009,
    speak_name = function()
      return T_S(21004010085)
    end,
    env_sound = 20001
  },
  [2100401009] = {
    id = 2100401009,
    talk_text = function()
      return T_S(21004010090)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401010,
    speak_name = function()
      return T_S(21004010095)
    end,
    env_sound = 20001
  },
  [2100401010] = {
    id = 2100401010,
    talk_text = function()
      return T_S(21004010100)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401011,
    speak_name = function()
      return T_S(21004010105)
    end,
    env_sound = 20001
  },
  [2100401011] = {
    id = 2100401011,
    talk_text = function()
      return T_S(21004010110)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401012,
    speak_name = function()
      return T_S(21004010115)
    end,
    env_sound = 20001
  },
  [2100401012] = {
    id = 2100401012,
    talk_text = function()
      return T_S(21004010120)
    end,
    next_dialog = 2100401013,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010125)
    end,
    env_sound = 20001
  },
  [2100401013] = {
    id = 2100401013,
    talk_text = function()
      return T_S(21004010130)
    end,
    next_dialog = 2100401014,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010135)
    end,
    env_sound = 20001
  },
  [2100401014] = {
    id = 2100401014,
    talk_text = function()
      return T_S(21004010140)
    end,
    next_dialog = 2100401015,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010145)
    end,
    env_sound = 20001
  },
  [2100401015] = {
    id = 2100401015,
    talk_text = function()
      return T_S(21004010150)
    end,
    next_dialog = 2100401016,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010155)
    end,
    env_sound = 20001
  },
  [2100401016] = {
    id = 2100401016,
    talk_text = function()
      return T_S(21004010160)
    end,
    next_dialog = 2100401017,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010165)
    end,
    env_sound = 20001
  },
  [2100401017] = {
    id = 2100401017,
    talk_text = function()
      return T_S(21004010170)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401018,
    speak_name = function()
      return T_S(21004010175)
    end,
    env_sound = 20001
  },
  [2100401018] = {
    id = 2100401018,
    talk_text = function()
      return T_S(21004010180)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401019,
    speak_name = function()
      return T_S(21004010185)
    end,
    env_sound = 20001
  },
  [2100401019] = {
    id = 2100401019,
    talk_text = function()
      return T_S(21004010190)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401020,
    env_sound = 20001
  },
  [2100401020] = {
    id = 2100401020,
    talk_text = function()
      return T_S(21004010200)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401021,
    speak_name = function()
      return T_S(21004010205)
    end,
    env_sound = 20001
  },
  [2100401021] = {
    id = 2100401021,
    talk_text = function()
      return T_S(21004010210)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401022,
    speak_name = function()
      return T_S(21004010215)
    end,
    env_sound = 20001
  },
  [2100401022] = {
    id = 2100401022,
    talk_text = function()
      return T_S(21004010220)
    end,
    next_dialog = 2100401023,
    env_sound = 20001
  },
  [2100401023] = {
    id = 2100401023,
    talk_text = function()
      return T_S(21004010230)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401024,
    speak_name = function()
      return T_S(21004010235)
    end,
    env_sound = 20001
  },
  [2100401024] = {
    id = 2100401024,
    talk_text = function()
      return T_S(21004010240)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401025,
    speak_name = function()
      return T_S(21004010245)
    end,
    env_sound = 20001
  },
  [2100401025] = {
    id = 2100401025,
    talk_text = function()
      return T_S(21004010250)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401026,
    speak_name = function()
      return T_S(21004010255)
    end,
    env_sound = 20001
  },
  [2100401026] = {
    id = 2100401026,
    talk_text = function()
      return T_S(21004010260)
    end,
    is_os = 1,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401027,
    speak_name = function()
      return T_S(21004010265)
    end,
    env_sound = 20001
  },
  [2100401027] = {
    id = 2100401027,
    talk_text = function()
      return T_S(21004010270)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401028,
    env_sound = 20001
  },
  [2100401028] = {
    id = 2100401028,
    talk_text = function()
      return T_S(21004010280)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401029,
    speak_name = function()
      return T_S(21004010285)
    end,
    env_sound = 20001
  },
  [2100401029] = {
    id = 2100401029,
    talk_text = function()
      return T_S(21004010290)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401030,
    speak_name = function()
      return T_S(21004010295)
    end,
    env_sound = 20001
  },
  [2100401030] = {
    id = 2100401030,
    talk_text = function()
      return T_S(21004010300)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 2100401031,
    speak_name = function()
      return T_S(21004010305)
    end,
    env_sound = 20001
  },
  [2100401031] = {
    id = 2100401031,
    talk_text = function()
      return T_S(21004010310)
    end,
    next_dialog = 2100401032,
    env_sound = 20001
  },
  [2100401032] = {
    id = 2100401032,
    talk_text = function()
      return T_S(21004010320)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401033,
    speak_name = function()
      return T_S(21004010325)
    end,
    env_sound = 20001
  },
  [2100401033] = {
    id = 2100401033,
    talk_text = function()
      return T_S(21004010330)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401034,
    speak_name = function()
      return T_S(21004010335)
    end,
    env_sound = 20001
  },
  [2100401034] = {
    id = 2100401034,
    talk_text = function()
      return T_S(21004010340)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401035,
    env_sound = 20001
  },
  [2100401035] = {
    id = 2100401035,
    talk_text = function()
      return T_S(21004010350)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401036,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010355)
    end,
    env_sound = 20001
  },
  [2100401036] = {
    id = 2100401036,
    talk_text = function()
      return T_S(21004010360)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401037,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010365)
    end,
    env_sound = 20001
  },
  [2100401037] = {
    id = 2100401037,
    talk_text = function()
      return T_S(21004010370)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401038,
    speak_name = function()
      return T_S(21004010375)
    end,
    env_sound = 20001
  },
  [2100401038] = {
    id = 2100401038,
    talk_text = function()
      return T_S(21004010380)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401039,
    speak_name = function()
      return T_S(21004010385)
    end,
    env_sound = 20006
  },
  [2100401039] = {
    id = 2100401039,
    talk_text = function()
      return T_S(21004010390)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401040,
    env_sound = 20006
  },
  [2100401040] = {
    id = 2100401040,
    talk_text = function()
      return T_S(21004010400)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401041,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010405)
    end,
    env_sound = 20006
  },
  [2100401041] = {
    id = 2100401041,
    talk_text = function()
      return T_S(21004010410)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401042,
    env_sound = 20006
  },
  [2100401042] = {
    id = 2100401042,
    talk_text = function()
      return T_S(21004010420)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401043,
    speak_name = function()
      return T_S(21004010425)
    end,
    env_sound = 20006
  },
  [2100401043] = {
    id = 2100401043,
    talk_text = function()
      return T_S(21004010430)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401044,
    speak_name = function()
      return T_S(21004010435)
    end,
    env_sound = 20006
  },
  [2100401044] = {
    id = 2100401044,
    talk_text = function()
      return T_S(21004010440)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", "1:0:1100"},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401045,
    env_sound = 20006
  },
  [2100401045] = {
    id = 2100401045,
    talk_text = function()
      return T_S(21004010450)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401046,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010455)
    end,
    env_sound = 20006
  },
  [2100401046] = {
    id = 2100401046,
    talk_text = function()
      return T_S(21004010460)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401047,
    speak_name = function()
      return T_S(21004010465)
    end,
    env_sound = 20006
  },
  [2100401047] = {
    id = 2100401047,
    talk_text = function()
      return T_S(21004010470)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401048,
    env_sound = 20006
  },
  [2100401048] = {
    id = 2100401048,
    talk_text = function()
      return T_S(21004010480)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401049,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010485)
    end,
    env_sound = 20006
  },
  [2100401049] = {
    id = 2100401049,
    talk_text = function()
      return T_S(21004010490)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401050,
    speak_name = function()
      return T_S(21004010495)
    end,
    env_sound = 20006
  },
  [2100401050] = {
    id = 2100401050,
    talk_text = function()
      return T_S(21004010500)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401051,
    env_sound = 20006
  },
  [2100401051] = {
    id = 2100401051,
    talk_text = function()
      return T_S(21004010510)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401052,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010515)
    end,
    env_sound = 20006
  },
  [2100401052] = {
    id = 2100401052,
    talk_text = function()
      return T_S(21004010520)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401053,
    speak_name = function()
      return T_S(21004010525)
    end,
    env_sound = 20006
  },
  [2100401053] = {
    id = 2100401053,
    talk_text = function()
      return T_S(21004010530)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401054,
    env_sound = 20006
  },
  [2100401054] = {
    id = 2100401054,
    talk_text = function()
      return T_S(21004010540)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401055,
    speak_name = function()
      return T_S(21004010545)
    end,
    env_sound = 20006
  },
  [2100401055] = {
    id = 2100401055,
    talk_text = function()
      return T_S(21004010550)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401056,
    camera_shake = {
      "1",
      "0",
      "900"
    },
    env_sound = 20006,
    top_effect = {"", "0"}
  },
  [2100401056] = {
    id = 2100401056,
    talk_text = function()
      return T_S(21004010560)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401057,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010565)
    end,
    env_sound = 20006
  },
  [2100401057] = {
    id = 2100401057,
    talk_text = function()
      return T_S(21004010570)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401058,
    env_sound = 20006
  },
  [2100401058] = {
    id = 2100401058,
    talk_text = function()
      return T_S(21004010580)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401059,
    speak_name = function()
      return T_S(21004010585)
    end,
    env_sound = 20006
  },
  [2100401059] = {
    id = 2100401059,
    talk_text = function()
      return T_S(21004010590)
    end,
    role_ids = {90110005, 90110035},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"-318:-985", "292:-966"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401060,
    speak_name = function()
      return T_S(21004010595)
    end,
    env_sound = 20006
  },
  [2100401060] = {
    id = 2100401060,
    talk_text = function()
      return T_S(21004010600)
    end,
    next_dialog = 2100401061,
    env_sound = 20006
  },
  [2100401061] = {
    id = 2100401061,
    talk_text = function()
      return T_S(21004010610)
    end,
    next_dialog = 2100401062,
    env_sound = 20006
  },
  [2100401062] = {
    id = 2100401062,
    talk_text = function()
      return T_S(21004010620)
    end,
    next_dialog = 2100401063,
    env_sound = 20006
  },
  [2100401063] = {
    id = 2100401063,
    talk_text = function()
      return T_S(21004010630)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2100401064,
    speak_name = function()
      return T_S(21004010635)
    end,
    env_sound = 20006
  },
  [2100401064] = {
    id = 2100401064,
    talk_text = function()
      return T_S(21004010640)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2100401065,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010645)
    end,
    env_sound = 20006
  },
  [2100401065] = {
    id = 2100401065,
    talk_text = function()
      return T_S(21004010650)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2100401066,
    env_sound = 20006
  },
  [2100401066] = {
    id = 2100401066,
    talk_text = function()
      return T_S(21004010660)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2100401067,
    speak_name = function()
      return T_S(21004010665)
    end,
    env_sound = 20006
  },
  [2100401067] = {
    id = 2100401067,
    talk_text = function()
      return T_S(21004010670)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2100401068,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010675)
    end,
    env_sound = 20006
  },
  [2100401068] = {
    id = 2100401068,
    talk_text = function()
      return T_S(21004010680)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2100401069,
    env_sound = 20006
  },
  [2100401069] = {
    id = 2100401069,
    talk_text = function()
      return T_S(21004010690)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2100401070,
    speak_name = function()
      return T_S(21004010695)
    end,
    env_sound = 20006
  },
  [2100401070] = {
    id = 2100401070,
    talk_text = function()
      return T_S(21004010700)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2100401071,
    env_sound = 20006
  },
  [2100401071] = {
    id = 2100401071,
    talk_text = function()
      return T_S(21004010710)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2100401072,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010715)
    end,
    env_sound = 20006
  },
  [2100401072] = {
    id = 2100401072,
    talk_text = function()
      return T_S(21004010720)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2100401073,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010725)
    end,
    env_sound = 20006
  },
  [2100401073] = {
    id = 2100401073,
    talk_text = function()
      return T_S(21004010730)
    end,
    role_ids = {90110035},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable"
    },
    role_position = {"22:-966"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2100401074,
    speak_name = function()
      return T_S(21004010735)
    end,
    env_sound = 20006
  },
  [2100401074] = {
    id = 2100401074,
    talk_text = function()
      return T_S(21004010740)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401075,
    speak_name = function()
      return T_S(21004010745)
    end,
    env_sound = 20006
  },
  [2100401075] = {
    id = 2100401075,
    talk_text = function()
      return T_S(21004010750)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401076,
    env_sound = 20006
  },
  [2100401076] = {
    id = 2100401076,
    talk_text = function()
      return T_S(21004010760)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401077,
    speak_head = 90120035,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010765)
    end,
    env_sound = 20006
  },
  [2100401077] = {
    id = 2100401077,
    talk_text = function()
      return T_S(21004010770)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401078,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010775)
    end,
    env_sound = 20006
  },
  [2100401078] = {
    id = 2100401078,
    talk_text = function()
      return T_S(21004010780)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401079,
    speak_name = function()
      return T_S(21004010785)
    end,
    env_sound = 20006
  },
  [2100401079] = {
    id = 2100401079,
    talk_text = function()
      return T_S(21004010790)
    end,
    next_dialog = 2100401080,
    env_sound = 20006
  },
  [2100401080] = {
    id = 2100401080,
    talk_text = function()
      return T_S(21004010800)
    end,
    next_dialog = 2100401081,
    env_sound = 20006
  },
  [2100401081] = {
    id = 2100401081,
    talk_text = function()
      return T_S(21004010810)
    end,
    next_dialog = 2100401082,
    speak_head = 90120038,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010815)
    end,
    env_sound = 20006
  },
  [2100401082] = {
    id = 2100401082,
    talk_text = function()
      return T_S(21004010820)
    end,
    next_dialog = 2100401083,
    camera_shake = {
      "1",
      "0",
      "1100"
    },
    env_sound = 20006
  },
  [2100401083] = {
    id = 2100401083,
    talk_text = function()
      return T_S(21004010830)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"1:0:900", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401084,
    speak_name = function()
      return T_S(21004010835)
    end,
    env_sound = 20006
  },
  [2100401084] = {
    id = 2100401084,
    talk_text = function()
      return T_S(21004010840)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401085,
    speak_name = function()
      return T_S(21004010845)
    end,
    env_sound = 20006
  },
  [2100401085] = {
    id = 2100401085,
    talk_text = function()
      return T_S(21004010850)
    end,
    next_dialog = 2100401086,
    camera_shake = {
      "2",
      "0",
      "1800"
    },
    env_sound = 20006
  },
  [2100401086] = {
    id = 2100401086,
    talk_text = function()
      return T_S(21004010860)
    end,
    next_dialog = 2100401087,
    speak_head = 90120056,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21004010865)
    end,
    env_sound = 20006
  },
  [2100401087] = {
    id = 2100401087,
    talk_text = function()
      return T_S(21004010870)
    end,
    next_dialog = 2100401088,
    env_sound = 20006
  },
  [2100401088] = {
    id = 2100401088,
    talk_text = function()
      return T_S(21004010880)
    end,
    next_dialog = 2100401089,
    env_sound = 20006
  },
  [2100401089] = {
    id = 2100401089,
    talk_text = function()
      return T_S(21004010890)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_1.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2100401089/2100401089_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401090,
    speak_name = function()
      return T_S(21004010895)
    end,
    env_sound = 20006
  },
  [2100401090] = {
    id = 2100401090,
    talk_text = function()
      return T_S(21004010900)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_3.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401091,
    speak_name = function()
      return T_S(21004010905)
    end,
    env_sound = 20006
  },
  [2100401091] = {
    id = 2100401091,
    talk_text = function()
      return T_S(21004010910)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401092,
    env_sound = 20006
  },
  [2100401092] = {
    id = 2100401092,
    talk_text = function()
      return T_S(21004010920)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_2.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2100401093,
    speak_name = function()
      return T_S(21004010925)
    end,
    env_sound = 20006
  },
  [2100401093] = {
    id = 2100401093,
    talk_text = function()
      return T_S(21004010930)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2100401093/2100401093_90110005.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2100401094,
    speak_name = function()
      return T_S(21004010935)
    end,
    env_sound = 20006
  },
  [2100401094] = {
    id = 2100401094,
    talk_text = function()
      return T_S(21004010940)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2100401095,
    env_sound = 20006
  },
  [2100401095] = {
    id = 2100401095,
    talk_text = function()
      return T_S(21004010950)
    end,
    role_ids = {90110035, 90110005},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110005/90110005_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110035/90110035_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110005/90110005_0.playable"
    },
    role_position = {"292:-966", "-318:-985"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(21004010955)
    end,
    env_sound = 20006
  }
}
