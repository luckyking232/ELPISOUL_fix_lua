BasePlotDialogPart555100 = {
  [2110301001] = {
    id = 2110301001,
    talk_text = function()
      return T_S(21103010010)
    end,
    next_dialog = 2110301002,
    env_sound = 20007,
    open_title_1 = function()
      return T_S(21103010018)
    end,
    open_title_2 = function()
      return T_S(21103010019)
    end
  },
  [2110301002] = {
    id = 2110301002,
    talk_text = function()
      return T_S(21103010020)
    end,
    next_dialog = 2110301003,
    env_sound = 20007
  },
  [2110301003] = {
    id = 2110301003,
    talk_text = function()
      return T_S(21103010030)
    end,
    role_ids = {90110040},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"0:-929"},
    role_shake = {"1:0:780"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301004,
    speak_name = function()
      return T_S(21103010035)
    end,
    env_sound = 20007
  },
  [2110301004] = {
    id = 2110301004,
    talk_text = function()
      return T_S(21103010040)
    end,
    is_os = 1,
    role_ids = {90110040},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"0:-929"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301005,
    speak_name = function()
      return T_S(21103010045)
    end,
    env_sound = 20007
  },
  [2110301005] = {
    id = 2110301005,
    talk_text = function()
      return T_S(21103010050)
    end,
    next_dialog = 2110301006,
    env_sound = 20007
  },
  [2110301006] = {
    id = 2110301006,
    talk_text = function()
      return T_S(21103010060)
    end,
    next_dialog = 2110301007,
    env_sound = 20007
  },
  [2110301007] = {
    id = 2110301007,
    talk_text = function()
      return T_S(21103010070)
    end,
    next_dialog = 2110301008,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010075)
    end,
    env_sound = 20007
  },
  [2110301008] = {
    id = 2110301008,
    talk_text = function()
      return T_S(21103010080)
    end,
    next_dialog = 2110301009,
    env_sound = 20007
  },
  [2110301009] = {
    id = 2110301009,
    talk_text = function()
      return T_S(21103010090)
    end,
    role_ids = {90110041},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable"
    },
    role_position = {"-22:-1088"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301010,
    speak_name = function()
      return T_S(21103010095)
    end,
    env_sound = 20007
  },
  [2110301010] = {
    id = 2110301010,
    talk_text = function()
      return T_S(21103010100)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301011,
    speak_name = function()
      return T_S(21103010105)
    end,
    env_sound = 20007
  },
  [2110301011] = {
    id = 2110301011,
    talk_text = function()
      return T_S(21103010110)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301012,
    speak_name = function()
      return T_S(21103010115)
    end,
    env_sound = 20007
  },
  [2110301012] = {
    id = 2110301012,
    talk_text = function()
      return T_S(21103010120)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301013,
    env_sound = 20007
  },
  [2110301013] = {
    id = 2110301013,
    talk_text = function()
      return T_S(21103010130)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2110301014,
    speak_name = function()
      return T_S(21103010135)
    end,
    env_sound = 20007
  },
  [2110301014] = {
    id = 2110301014,
    talk_text = function()
      return T_S(21103010140)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301015,
    speak_head = 90120023,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21103010145)
    end,
    env_sound = 20007
  },
  [2110301015] = {
    id = 2110301015,
    talk_text = function()
      return T_S(21103010150)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_3.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301016,
    speak_name = function()
      return T_S(21103010155)
    end,
    env_sound = 20007
  },
  [2110301016] = {
    id = 2110301016,
    talk_text = function()
      return T_S(21103010160)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301017,
    speak_head = 90120023,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21103010165)
    end,
    env_sound = 20007
  },
  [2110301017] = {
    id = 2110301017,
    talk_text = function()
      return T_S(21103010170)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2110301018,
    speak_name = function()
      return T_S(21103010175)
    end,
    env_sound = 20007
  },
  [2110301018] = {
    id = 2110301018,
    talk_text = function()
      return T_S(21103010180)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301019,
    speak_head = 90120023,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21103010185)
    end,
    env_sound = 20007
  },
  [2110301019] = {
    id = 2110301019,
    talk_text = function()
      return T_S(21103010190)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2110301020,
    speak_name = function()
      return T_S(21103010195)
    end,
    env_sound = 20007
  },
  [2110301020] = {
    id = 2110301020,
    talk_text = function()
      return T_S(21103010200)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301021,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010205)
    end,
    env_sound = 20007
  },
  [2110301021] = {
    id = 2110301021,
    talk_text = function()
      return T_S(21103010210)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_2.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2110301022,
    speak_name = function()
      return T_S(21103010215)
    end,
    env_sound = 20007
  },
  [2110301022] = {
    id = 2110301022,
    talk_text = function()
      return T_S(21103010220)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301023,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010225)
    end,
    env_sound = 20007
  },
  [2110301023] = {
    id = 2110301023,
    talk_text = function()
      return T_S(21103010230)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301024,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010235)
    end,
    env_sound = 20007
  },
  [2110301024] = {
    id = 2110301024,
    talk_text = function()
      return T_S(21103010240)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301025,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010245)
    end,
    env_sound = 20007
  },
  [2110301025] = {
    id = 2110301025,
    talk_text = function()
      return T_S(21103010250)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301026,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010255)
    end,
    env_sound = 20007
  },
  [2110301026] = {
    id = 2110301026,
    talk_text = function()
      return T_S(21103010260)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301027,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010265)
    end,
    env_sound = 20007
  },
  [2110301027] = {
    id = 2110301027,
    talk_text = function()
      return T_S(21103010270)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2110301028,
    speak_name = function()
      return T_S(21103010275)
    end,
    env_sound = 20007
  },
  [2110301028] = {
    id = 2110301028,
    talk_text = function()
      return T_S(21103010280)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301029,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010285)
    end,
    env_sound = 20007
  },
  [2110301029] = {
    id = 2110301029,
    talk_text = function()
      return T_S(21103010290)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301030,
    speak_name = function()
      return T_S(21103010295)
    end,
    env_sound = 20007
  },
  [2110301030] = {
    id = 2110301030,
    talk_text = function()
      return T_S(21103010300)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301031,
    speak_head = 90120023,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21103010305)
    end,
    env_sound = 20007
  },
  [2110301031] = {
    id = 2110301031,
    talk_text = function()
      return T_S(21103010310)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301032,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010315)
    end,
    env_sound = 20007
  },
  [2110301032] = {
    id = 2110301032,
    talk_text = function()
      return T_S(21103010320)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_3.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301033,
    speak_name = function()
      return T_S(21103010325)
    end,
    env_sound = 20007
  },
  [2110301033] = {
    id = 2110301033,
    talk_text = function()
      return T_S(21103010330)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301034,
    env_sound = 20007
  },
  [2110301034] = {
    id = 2110301034,
    talk_text = function()
      return T_S(21103010340)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301035,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010345)
    end,
    env_sound = 20007
  },
  [2110301035] = {
    id = 2110301035,
    talk_text = function()
      return T_S(21103010350)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301036,
    speak_name = function()
      return T_S(21103010355)
    end,
    env_sound = 20007
  },
  [2110301036] = {
    id = 2110301036,
    talk_text = function()
      return T_S(21103010360)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301037,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010365)
    end,
    env_sound = 20007
  },
  [2110301037] = {
    id = 2110301037,
    talk_text = function()
      return T_S(21103010370)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301038,
    speak_name = function()
      return T_S(21103010375)
    end,
    env_sound = 20007
  },
  [2110301038] = {
    id = 2110301038,
    talk_text = function()
      return T_S(21103010380)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301039,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010385)
    end,
    env_sound = 20007
  },
  [2110301039] = {
    id = 2110301039,
    talk_text = function()
      return T_S(21103010390)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301040,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010395)
    end,
    env_sound = 20007
  },
  [2110301040] = {
    id = 2110301040,
    talk_text = function()
      return T_S(21103010400)
    end,
    next_dialog = 2110301041,
    env_sound = 20007
  },
  [2110301041] = {
    id = 2110301041,
    talk_text = function()
      return T_S(21103010410)
    end,
    next_dialog = 2110301042,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010415)
    end,
    env_sound = 20007
  },
  [2110301042] = {
    id = 2110301042,
    talk_text = function()
      return T_S(21103010420)
    end,
    next_dialog = 2110301043,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010425)
    end,
    env_sound = 20007
  },
  [2110301043] = {
    id = 2110301043,
    talk_text = function()
      return T_S(21103010430)
    end,
    next_dialog = 2110301044,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010435)
    end,
    env_sound = 20007
  },
  [2110301044] = {
    id = 2110301044,
    talk_text = function()
      return T_S(21103010440)
    end,
    next_dialog = 2110301045,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010445)
    end,
    env_sound = 20007
  },
  [2110301045] = {
    id = 2110301045,
    talk_text = function()
      return T_S(21103010450)
    end,
    next_dialog = 2110301046,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010455)
    end,
    env_sound = 20007
  },
  [2110301046] = {
    id = 2110301046,
    talk_text = function()
      return T_S(21103010460)
    end,
    next_dialog = 2110301047,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010465)
    end,
    env_sound = 20007
  },
  [2110301047] = {
    id = 2110301047,
    talk_text = function()
      return T_S(21103010470)
    end,
    next_dialog = 2110301048,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010475)
    end,
    env_sound = 20007
  },
  [2110301048] = {
    id = 2110301048,
    talk_text = function()
      return T_S(21103010480)
    end,
    role_ids = {90110041},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable"
    },
    role_position = {"22:-1088"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301049,
    speak_name = function()
      return T_S(21103010485)
    end,
    env_sound = 20007
  },
  [2110301049] = {
    id = 2110301049,
    talk_text = function()
      return T_S(21103010490)
    end,
    role_ids = {90110041},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable"
    },
    role_position = {"22:-1088"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2110301050,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010495)
    end,
    env_sound = 20007
  },
  [2110301050] = {
    id = 2110301050,
    talk_text = function()
      return T_S(21103010500)
    end,
    role_ids = {90110041},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable"
    },
    role_position = {"22:-1088"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301051,
    speak_name = function()
      return T_S(21103010505)
    end,
    env_sound = 20007
  },
  [2110301051] = {
    id = 2110301051,
    talk_text = function()
      return T_S(21103010510)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "180"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301052,
    speak_name = function()
      return T_S(21103010515)
    end,
    env_sound = 20007
  },
  [2110301052] = {
    id = 2110301052,
    talk_text = function()
      return T_S(21103010520)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2110301053,
    speak_name = function()
      return T_S(21103010525)
    end,
    env_sound = 20007
  },
  [2110301053] = {
    id = 2110301053,
    talk_text = function()
      return T_S(21103010530)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301054,
    speak_name = function()
      return T_S(21103010535)
    end,
    env_sound = 20007
  },
  [2110301054] = {
    id = 2110301054,
    talk_text = function()
      return T_S(21103010540)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2110301055,
    speak_name = function()
      return T_S(21103010545)
    end,
    camera_shake = {
      "1",
      "0",
      "1500"
    },
    env_sound = 20007,
    review_head = "90210001"
  },
  [2110301055] = {
    id = 2110301055,
    talk_text = function()
      return T_S(21103010550)
    end,
    role_ids = {90110041, 90110040},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"-248:-1088", "270:-929"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2110301056,
    speak_name = function()
      return T_S(21103010555)
    end,
    env_sound = 20007
  },
  [2110301056] = {
    id = 2110301056,
    talk_text = function()
      return T_S(21103010560)
    end,
    next_dialog = 2110301057,
    env_sound = 20007
  },
  [2110301057] = {
    id = 2110301057,
    talk_text = function()
      return T_S(21103010570)
    end,
    next_dialog = 2110301058,
    speak_head = 90120018,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010575)
    end,
    env_sound = 20007
  },
  [2110301058] = {
    id = 2110301058,
    talk_text = function()
      return T_S(21103010580)
    end,
    next_dialog = 2110301059,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010585)
    end,
    env_sound = 20007
  },
  [2110301059] = {
    id = 2110301059,
    talk_text = function()
      return T_S(21103010590)
    end,
    next_dialog = 2110301060,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010595)
    end,
    env_sound = 20007
  },
  [2110301060] = {
    id = 2110301060,
    talk_text = function()
      return T_S(21103010600)
    end,
    next_dialog = 2110301061,
    env_sound = 20007
  },
  [2110301061] = {
    id = 2110301061,
    talk_text = function()
      return T_S(21103010610)
    end,
    role_ids = {90110040},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"0:-929"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301062,
    speak_name = function()
      return T_S(21103010615)
    end,
    env_sound = 20007
  },
  [2110301062] = {
    id = 2110301062,
    talk_text = function()
      return T_S(21103010620)
    end,
    next_dialog = 2110301063,
    speak_head = 90120018,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010625)
    end,
    env_sound = 20007
  },
  [2110301063] = {
    id = 2110301063,
    talk_text = function()
      return T_S(21103010630)
    end,
    next_dialog = 2110301064,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010635)
    end,
    env_sound = 20007
  },
  [2110301064] = {
    id = 2110301064,
    talk_text = function()
      return T_S(21103010640)
    end,
    next_dialog = 2110301065,
    speak_head = 90120022,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(21103010645)
    end,
    env_sound = 20007
  },
  [2110301065] = {
    id = 2110301065,
    talk_text = function()
      return T_S(21103010650)
    end,
    next_dialog = 2110301066,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010655)
    end,
    env_sound = 20007
  },
  [2110301066] = {
    id = 2110301066,
    talk_text = function()
      return T_S(21103010660)
    end,
    next_dialog = 2110301067,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010665)
    end,
    env_sound = 20007
  },
  [2110301067] = {
    id = 2110301067,
    talk_text = function()
      return T_S(21103010670)
    end,
    next_dialog = 2110301068,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010675)
    end,
    env_sound = 20007
  },
  [2110301068] = {
    id = 2110301068,
    talk_text = function()
      return T_S(21103010680)
    end,
    next_dialog = 2110301069,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010685)
    end,
    env_sound = 20007
  },
  [2110301069] = {
    id = 2110301069,
    talk_text = function()
      return T_S(21103010690)
    end,
    next_dialog = 2110301070,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010695)
    end,
    env_sound = 20007
  },
  [2110301070] = {
    id = 2110301070,
    talk_text = function()
      return T_S(21103010700)
    end,
    next_dialog = 2110301071,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010705)
    end,
    env_sound = 20007
  },
  [2110301071] = {
    id = 2110301071,
    talk_text = function()
      return T_S(21103010710)
    end,
    next_dialog = 2110301072,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010715)
    end,
    env_sound = 20007
  },
  [2110301072] = {
    id = 2110301072,
    talk_text = function()
      return T_S(21103010720)
    end,
    next_dialog = 2110301073,
    speak_head = 90120018,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010725)
    end,
    env_sound = 20007
  },
  [2110301073] = {
    id = 2110301073,
    talk_text = function()
      return T_S(21103010730)
    end,
    next_dialog = 2110301074,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010735)
    end,
    env_sound = 20007
  },
  [2110301074] = {
    id = 2110301074,
    talk_text = function()
      return T_S(21103010740)
    end,
    next_dialog = 2110301075,
    speak_head = 90120018,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010745)
    end,
    env_sound = 20007
  },
  [2110301075] = {
    id = 2110301075,
    talk_text = function()
      return T_S(21103010750)
    end,
    next_dialog = 2110301076,
    env_sound = 20007
  },
  [2110301076] = {
    id = 2110301076,
    talk_text = function()
      return T_S(21103010760)
    end,
    role_ids = {90110040},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"0:-929"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301077,
    speak_name = function()
      return T_S(21103010765)
    end,
    env_sound = 20007
  },
  [2110301077] = {
    id = 2110301077,
    talk_text = function()
      return T_S(21103010770)
    end,
    role_ids = {90110040},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"0:-929"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301078,
    speak_name = function()
      return T_S(21103010775)
    end,
    env_sound = 20007
  },
  [2110301078] = {
    id = 2110301078,
    talk_text = function()
      return T_S(21103010780)
    end,
    next_dialog = 2110301079,
    camera_shake = {
      "2",
      "0",
      "1800"
    },
    env_sound = 20007
  },
  [2110301079] = {
    id = 2110301079,
    talk_text = function()
      return T_S(21103010790)
    end,
    next_dialog = 2110301080,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010795)
    end,
    env_sound = 20007
  },
  [2110301080] = {
    id = 2110301080,
    talk_text = function()
      return T_S(21103010800)
    end,
    next_dialog = 2110301081,
    camera_shake = {
      "2",
      "0",
      "800"
    },
    env_sound = 20007,
    top_effect = {"", "0"}
  },
  [2110301081] = {
    id = 2110301081,
    talk_text = function()
      return T_S(21103010810)
    end,
    role_ids = {90110041},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110041/90110041_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110041/90110041_0.playable"
    },
    role_position = {"22:-1088"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2110301082,
    speak_name = function()
      return T_S(21103010815)
    end,
    env_sound = 20007
  },
  [2110301082] = {
    id = 2110301082,
    talk_text = function()
      return T_S(21103010820)
    end,
    next_dialog = 2110301083,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010825)
    end,
    env_sound = 20007
  },
  [2110301083] = {
    id = 2110301083,
    talk_text = function()
      return T_S(21103010830)
    end,
    next_dialog = 2110301084,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010835)
    end,
    env_sound = 20007
  },
  [2110301084] = {
    id = 2110301084,
    talk_text = function()
      return T_S(21103010840)
    end,
    next_dialog = 2110301085,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010845)
    end,
    env_sound = 20007
  },
  [2110301085] = {
    id = 2110301085,
    talk_text = function()
      return T_S(21103010850)
    end,
    next_dialog = 2110301086,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010855)
    end,
    env_sound = 20007
  },
  [2110301086] = {
    id = 2110301086,
    talk_text = function()
      return T_S(21103010860)
    end,
    next_dialog = 2110301087,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010865)
    end,
    env_sound = 20007
  },
  [2110301087] = {
    id = 2110301087,
    talk_text = function()
      return T_S(21103010870)
    end,
    next_dialog = 2110301088,
    speak_head = 90120023,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010875)
    end,
    env_sound = 20007
  },
  [2110301088] = {
    id = 2110301088,
    talk_text = function()
      return T_S(21103010880)
    end,
    next_dialog = 2110301089,
    speak_head = 90120022,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(21103010885)
    end,
    env_sound = 20007
  },
  [2110301089] = {
    id = 2110301089,
    talk_text = function()
      return T_S(21103010890)
    end,
    role_ids = {90110040},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"0:-929"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2110301090,
    env_sound = 20007
  },
  [2110301090] = {
    id = 2110301090,
    talk_text = function()
      return T_S(21103010900)
    end,
    role_ids = {90110040},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110040/90110040_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110040/90110040_0.playable"
    },
    role_position = {"0:-929"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(21103010905)
    end,
    env_sound = 20007
  }
}
