BasePlotDialogPart535150 = {
  [2070401001] = {
    id = 2070401001,
    talk_text = function()
      return T_S(20704010010)
    end,
    role_ids = {90110023},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"0:-998"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2070401002,
    speak_name = function()
      return T_S(20704010015)
    end,
    env_sound = 20001,
    open_title_1 = function()
      return T_S(20704010018)
    end,
    open_title_2 = function()
      return T_S(20704010019)
    end
  },
  [2070401002] = {
    id = 2070401002,
    talk_text = function()
      return T_S(20704010020)
    end,
    next_dialog = 2070401003,
    env_sound = 20001
  },
  [2070401003] = {
    id = 2070401003,
    talk_text = function()
      return T_S(20704010030)
    end,
    next_dialog = 2070401004,
    env_sound = 20001
  },
  [2070401004] = {
    id = 2070401004,
    talk_text = function()
      return T_S(20704010040)
    end,
    next_dialog = 2070401005,
    env_sound = 20001
  },
  [2070401005] = {
    id = 2070401005,
    talk_text = function()
      return T_S(20704010050)
    end,
    next_dialog = 2070401006,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010055)
    end,
    env_sound = 20001
  },
  [2070401006] = {
    id = 2070401006,
    talk_text = function()
      return T_S(20704010060)
    end,
    role_ids = {90110033},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"0:-933"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2070401007,
    env_sound = 20001
  },
  [2070401007] = {
    id = 2070401007,
    talk_text = function()
      return T_S(20704010070)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401008,
    speak_name = function()
      return T_S(20704010075)
    end,
    env_sound = 20001
  },
  [2070401008] = {
    id = 2070401008,
    talk_text = function()
      return T_S(20704010080)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401009,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010085)
    end,
    env_sound = 20001
  },
  [2070401009] = {
    id = 2070401009,
    talk_text = function()
      return T_S(20704010090)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401010,
    env_sound = 20001
  },
  [2070401010] = {
    id = 2070401010,
    talk_text = function()
      return T_S(20704010100)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401011,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010105)
    end,
    env_sound = 20001
  },
  [2070401011] = {
    id = 2070401011,
    talk_text = function()
      return T_S(20704010110)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_2.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401012,
    speak_name = function()
      return T_S(20704010115)
    end,
    env_sound = 20001
  },
  [2070401012] = {
    id = 2070401012,
    talk_text = function()
      return T_S(20704010120)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401013,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010125)
    end,
    env_sound = 20001
  },
  [2070401013] = {
    id = 2070401013,
    talk_text = function()
      return T_S(20704010130)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401014,
    speak_name = function()
      return T_S(20704010135)
    end,
    env_sound = 20001
  },
  [2070401014] = {
    id = 2070401014,
    talk_text = function()
      return T_S(20704010140)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401015,
    speak_head = 90120025,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20704010145)
    end,
    env_sound = 20001
  },
  [2070401015] = {
    id = 2070401015,
    talk_text = function()
      return T_S(20704010150)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401016,
    speak_name = function()
      return T_S(20704010155)
    end,
    env_sound = 20001
  },
  [2070401016] = {
    id = 2070401016,
    talk_text = function()
      return T_S(20704010160)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401017,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010165)
    end,
    env_sound = 20001
  },
  [2070401017] = {
    id = 2070401017,
    talk_text = function()
      return T_S(20704010170)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401018,
    speak_name = function()
      return T_S(20704010175)
    end,
    env_sound = 20001
  },
  [2070401018] = {
    id = 2070401018,
    talk_text = function()
      return T_S(20704010180)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401019,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010185)
    end,
    env_sound = 20001
  },
  [2070401019] = {
    id = 2070401019,
    talk_text = function()
      return T_S(20704010190)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401020,
    speak_name = function()
      return T_S(20704010195)
    end,
    env_sound = 20001
  },
  [2070401020] = {
    id = 2070401020,
    talk_text = function()
      return T_S(20704010200)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401021,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010205)
    end,
    env_sound = 20001
  },
  [2070401021] = {
    id = 2070401021,
    talk_text = function()
      return T_S(20704010210)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401022,
    env_sound = 20001
  },
  [2070401022] = {
    id = 2070401022,
    talk_text = function()
      return T_S(20704010220)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_6.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401023,
    speak_name = function()
      return T_S(20704010225)
    end,
    env_sound = 20001
  },
  [2070401023] = {
    id = 2070401023,
    talk_text = function()
      return T_S(20704010230)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070401024,
    speak_name = function()
      return T_S(20704010235)
    end,
    env_sound = 20001
  },
  [2070401024] = {
    id = 2070401024,
    talk_text = function()
      return T_S(20704010240)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401025,
    speak_name = function()
      return T_S(20704010245)
    end,
    env_sound = 20001
  },
  [2070401025] = {
    id = 2070401025,
    talk_text = function()
      return T_S(20704010250)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070401026,
    speak_name = function()
      return T_S(20704010255)
    end,
    env_sound = 20001
  },
  [2070401026] = {
    id = 2070401026,
    talk_text = function()
      return T_S(20704010260)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_4.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401027,
    speak_name = function()
      return T_S(20704010265)
    end,
    env_sound = 20001
  },
  [2070401027] = {
    id = 2070401027,
    talk_text = function()
      return T_S(20704010270)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070401028,
    speak_name = function()
      return T_S(20704010275)
    end,
    env_sound = 20001
  },
  [2070401028] = {
    id = 2070401028,
    talk_text = function()
      return T_S(20704010280)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401029,
    env_sound = 20001
  },
  [2070401029] = {
    id = 2070401029,
    talk_text = function()
      return T_S(20704010290)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_2.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401030,
    speak_name = function()
      return T_S(20704010295)
    end,
    env_sound = 20001
  },
  [2070401030] = {
    id = 2070401030,
    talk_text = function()
      return T_S(20704010300)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401031,
    env_sound = 20001
  },
  [2070401031] = {
    id = 2070401031,
    talk_text = function()
      return T_S(20704010310)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401032,
    env_sound = 20001
  },
  [2070401032] = {
    id = 2070401032,
    talk_text = function()
      return T_S(20704010320)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_4.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401033,
    speak_name = function()
      return T_S(20704010325)
    end,
    env_sound = 20001
  },
  [2070401033] = {
    id = 2070401033,
    talk_text = function()
      return T_S(20704010330)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401034,
    env_sound = 20001
  },
  [2070401034] = {
    id = 2070401034,
    talk_text = function()
      return T_S(20704010340)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070401035,
    speak_name = function()
      return T_S(20704010345)
    end,
    env_sound = 20001
  },
  [2070401035] = {
    id = 2070401035,
    talk_text = function()
      return T_S(20704010350)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_2.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401036,
    speak_name = function()
      return T_S(20704010355)
    end,
    env_sound = 20001
  },
  [2070401036] = {
    id = 2070401036,
    talk_text = function()
      return T_S(20704010360)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401037,
    env_sound = 20001
  },
  [2070401037] = {
    id = 2070401037,
    talk_text = function()
      return T_S(20704010370)
    end,
    is_os = 1,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401038,
    speak_name = function()
      return T_S(20704010375)
    end,
    env_sound = 20001
  },
  [2070401038] = {
    id = 2070401038,
    talk_text = function()
      return T_S(20704010380)
    end,
    is_os = 1,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401039,
    speak_name = function()
      return T_S(20704010385)
    end,
    env_sound = 20001
  },
  [2070401039] = {
    id = 2070401039,
    talk_text = function()
      return T_S(20704010390)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401040,
    env_sound = 20001
  },
  [2070401040] = {
    id = 2070401040,
    talk_text = function()
      return T_S(20704010400)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401041,
    env_sound = 20001
  },
  [2070401041] = {
    id = 2070401041,
    talk_text = function()
      return T_S(20704010410)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_6.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401042,
    env_sound = 20001
  },
  [2070401042] = {
    id = 2070401042,
    talk_text = function()
      return T_S(20704010420)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401043,
    speak_name = function()
      return T_S(20704010425)
    end,
    env_sound = 20001
  },
  [2070401043] = {
    id = 2070401043,
    talk_text = function()
      return T_S(20704010430)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070401044,
    speak_name = function()
      return T_S(20704010435)
    end,
    env_sound = 20001
  },
  [2070401044] = {
    id = 2070401044,
    talk_text = function()
      return T_S(20704010440)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401045,
    env_sound = 20001
  },
  [2070401045] = {
    id = 2070401045,
    talk_text = function()
      return T_S(20704010450)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070401046,
    speak_name = function()
      return T_S(20704010455)
    end,
    env_sound = 20001
  },
  [2070401046] = {
    id = 2070401046,
    talk_text = function()
      return T_S(20704010460)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401047,
    env_sound = 20001
  },
  [2070401047] = {
    id = 2070401047,
    talk_text = function()
      return T_S(20704010470)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401048,
    env_sound = 20001
  },
  [2070401048] = {
    id = 2070401048,
    talk_text = function()
      return T_S(20704010480)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401049,
    speak_name = function()
      return T_S(20704010485)
    end,
    env_sound = 20001
  },
  [2070401049] = {
    id = 2070401049,
    talk_text = function()
      return T_S(20704010490)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401050,
    env_sound = 20001
  },
  [2070401050] = {
    id = 2070401050,
    talk_text = function()
      return T_S(20704010500)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401051,
    env_sound = 20001
  },
  [2070401051] = {
    id = 2070401051,
    talk_text = function()
      return T_S(20704010510)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401052,
    env_sound = 20001
  },
  [2070401052] = {
    id = 2070401052,
    talk_text = function()
      return T_S(20704010520)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_4.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070401053,
    speak_name = function()
      return T_S(20704010525)
    end,
    env_sound = 20001
  },
  [2070401053] = {
    id = 2070401053,
    talk_text = function()
      return T_S(20704010530)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401054,
    env_sound = 20001
  },
  [2070401054] = {
    id = 2070401054,
    talk_text = function()
      return T_S(20704010540)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070401055,
    speak_head = 90120025,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20704010545)
    end,
    env_sound = 20001
  },
  [2070401055] = {
    id = 2070401055,
    talk_text = function()
      return T_S(20704010550)
    end,
    role_ids = {90110033, 90110023},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_1.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable"
    },
    role_position = {"270:-933", "-270:-998"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    speak_name = function()
      return T_S(20704010555)
    end,
    env_sound = 20001
  },
  [2070402001] = {
    id = 2070402001,
    talk_text = function()
      return T_S(20704020010)
    end,
    role_ids = {90110023, 90110033},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"-270:-998", "270:-933"},
    role_shake = {"", ""},
    effect_in = {"1", "1"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070402002,
    speak_name = function()
      return T_S(20704020015)
    end,
    env_sound = 20008
  },
  [2070402002] = {
    id = 2070402002,
    talk_text = function()
      return T_S(20704020020)
    end,
    role_ids = {90110023, 90110033},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"-270:-998", "270:-933"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070402003,
    env_sound = 20008
  },
  [2070402003] = {
    id = 2070402003,
    talk_text = function()
      return T_S(20704020030)
    end,
    role_ids = {90110023, 90110033},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"-270:-998", "270:-933"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2070402004,
    env_sound = 20008
  },
  [2070402004] = {
    id = 2070402004,
    talk_text = function()
      return T_S(20704020040)
    end,
    role_ids = {90110023, 90110033},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"-270:-998", "270:-933"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070402005,
    speak_name = function()
      return T_S(20704020045)
    end,
    env_sound = 20008
  },
  [2070402005] = {
    id = 2070402005,
    talk_text = function()
      return T_S(20704020050)
    end,
    role_ids = {90110023, 90110033},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_1.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"-270:-998", "270:-933"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2070402006,
    speak_name = function()
      return T_S(20704020055)
    end,
    env_sound = 20008
  },
  [2070402006] = {
    id = 2070402006,
    talk_text = function()
      return T_S(20704020060)
    end,
    role_ids = {90110023, 90110033},
    scale = {10000, 10000},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110023/90110023_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"-270:-998", "270:-933"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"2", "0"},
    effect_out_param = {"180", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2070402007,
    speak_name = function()
      return T_S(20704020065)
    end,
    env_sound = 20008
  },
  [2070402007] = {
    id = 2070402007,
    talk_text = function()
      return T_S(20704020070)
    end,
    role_ids = {90110033},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"0:-933"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2070402008,
    env_sound = 20008
  },
  [2070402008] = {
    id = 2070402008,
    talk_text = function()
      return T_S(20704020080)
    end,
    role_ids = {90110033},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_2.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110033/90110033_0.playable"
    },
    role_position = {"0:-933"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20704020085)
    end,
    env_sound = 20008
  }
}
