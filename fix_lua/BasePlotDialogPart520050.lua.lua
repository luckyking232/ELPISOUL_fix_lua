BasePlotDialogPart520050 = {
  [2040201001] = {
    id = 2040201001,
    talk_text = function()
      return T_S(20402010010)
    end,
    next_dialog = 2040201002,
    env_sound = 20002,
    open_title_1 = function()
      return T_S(20402010018)
    end,
    open_title_2 = function()
      return T_S(20402010019)
    end
  },
  [2040201002] = {
    id = 2040201002,
    talk_text = function()
      return T_S(20402010020)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040201003,
    speak_name = function()
      return T_S(20402010025)
    end,
    env_sound = 20002
  },
  [2040201003] = {
    id = 2040201003,
    talk_text = function()
      return T_S(20402010030)
    end,
    next_dialog = 2040201004,
    env_sound = 20002
  },
  [2040201004] = {
    id = 2040201004,
    talk_text = function()
      return T_S(20402010040)
    end,
    next_dialog = 2040201005,
    env_sound = 20002
  },
  [2040201005] = {
    id = 2040201005,
    talk_text = function()
      return T_S(20402010050)
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
    next_dialog = 2040201006,
    speak_name = function()
      return T_S(20402010055)
    end,
    env_sound = 20002
  },
  [2040201006] = {
    id = 2040201006,
    talk_text = function()
      return T_S(20402010060)
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
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040201007,
    speak_name = function()
      return T_S(20402010065)
    end,
    env_sound = 20002
  },
  [2040201007] = {
    id = 2040201007,
    talk_text = function()
      return T_S(20402010070)
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
    next_dialog = 2040201008,
    speak_name = function()
      return T_S(20402010075)
    end,
    env_sound = 20002
  },
  [2040201008] = {
    id = 2040201008,
    talk_text = function()
      return T_S(20402010080)
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
    light_role = {1},
    next_dialog = 2040201009,
    env_sound = 20002
  },
  [2040201009] = {
    id = 2040201009,
    talk_text = function()
      return T_S(20402010090)
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
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040201010,
    speak_name = function()
      return T_S(20402010095)
    end,
    env_sound = 20002
  },
  [2040201010] = {
    id = 2040201010,
    talk_text = function()
      return T_S(20402010100)
    end,
    scale = {10000},
    next_dialog = 2040201011,
    env_sound = 20002
  },
  [2040201011] = {
    id = 2040201011,
    talk_text = function()
      return T_S(20402010110)
    end,
    scale = {10000},
    next_dialog = 2040201012,
    speak_name = function()
      return T_S(20402010115)
    end,
    env_sound = 20002
  },
  [2040201012] = {
    id = 2040201012,
    talk_text = function()
      return T_S(20402010120)
    end,
    role_ids = {90110003},
    scale = {10000, 10000},
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
    next_dialog = 2040201013,
    speak_name = function()
      return T_S(20402010125)
    end,
    env_sound = 20002
  },
  [2040201013] = {
    id = 2040201013,
    talk_text = function()
      return T_S(20402010130)
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
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2040201014,
    env_sound = 20002
  },
  [2040201014] = {
    id = 2040201014,
    talk_text = function()
      return T_S(20402010140)
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
    speak_role = {0, 1},
    light_role = {0, 1},
    speak_name = function()
      return T_S(20402010145)
    end,
    env_sound = 20002
  },
  [2040202001] = {
    id = 2040202001,
    talk_text = function()
      return T_S(20402020010)
    end,
    next_dialog = 2040202002,
    env_sound = 20003
  },
  [2040202002] = {
    id = 2040202002,
    talk_text = function()
      return T_S(20402020020)
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
    next_dialog = 2040202003,
    speak_name = function()
      return T_S(20402020025)
    end,
    env_sound = 20003
  },
  [2040202003] = {
    id = 2040202003,
    talk_text = function()
      return T_S(20402020030)
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
    next_dialog = 2040202004,
    env_sound = 20003
  },
  [2040202004] = {
    id = 2040202004,
    talk_text = function()
      return T_S(20402020040)
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
    next_dialog = 2040202005,
    speak_head = 90120065,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20402020045)
    end,
    env_sound = 20003
  },
  [2040202005] = {
    id = 2040202005,
    talk_text = function()
      return T_S(20402020050)
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
    next_dialog = 2040202006,
    speak_name = function()
      return T_S(20402020055)
    end,
    env_sound = 20003
  },
  [2040202006] = {
    id = 2040202006,
    talk_text = function()
      return T_S(20402020060)
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
    next_dialog = 2040202007,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20402020065)
    end,
    env_sound = 20003
  },
  [2040202007] = {
    id = 2040202007,
    talk_text = function()
      return T_S(20402020070)
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
    next_dialog = 2040202008,
    speak_name = function()
      return T_S(20402020075)
    end,
    env_sound = 20003
  },
  [2040202008] = {
    id = 2040202008,
    talk_text = function()
      return T_S(20402020080)
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
    next_dialog = 2040202009,
    speak_head = 90120065,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20402020085)
    end,
    env_sound = 20003
  },
  [2040202009] = {
    id = 2040202009,
    talk_text = function()
      return T_S(20402020090)
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
    next_dialog = 2040202010,
    speak_name = function()
      return T_S(20402020095)
    end,
    env_sound = 20003
  },
  [2040202010] = {
    id = 2040202010,
    talk_text = function()
      return T_S(20402020100)
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
    next_dialog = 2040202011,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20402020105)
    end,
    env_sound = 20003
  },
  [2040202011] = {
    id = 2040202011,
    talk_text = function()
      return T_S(20402020110)
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
    next_dialog = 2040202012,
    env_sound = 20003
  },
  [2040202012] = {
    id = 2040202012,
    talk_text = function()
      return T_S(20402020120)
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
    next_dialog = 2040202013,
    speak_name = function()
      return T_S(20402020125)
    end,
    env_sound = 20003
  },
  [2040202013] = {
    id = 2040202013,
    talk_text = function()
      return T_S(20402020130)
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
    light_role = {1},
    next_dialog = 2040202014,
    env_sound = 20003
  },
  [2040202014] = {
    id = 2040202014,
    talk_text = function()
      return T_S(20402020140)
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
    next_dialog = 2040202015,
    env_sound = 20003
  },
  [2040202015] = {
    id = 2040202015,
    talk_text = function()
      return T_S(20402020150)
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
    next_dialog = 2040202016,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20402020155)
    end,
    env_sound = 20003
  },
  [2040202016] = {
    id = 2040202016,
    talk_text = function()
      return T_S(20402020160)
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
    next_dialog = 2040202017,
    speak_name = function()
      return T_S(20402020165)
    end,
    env_sound = 20003
  },
  [2040202017] = {
    id = 2040202017,
    talk_text = function()
      return T_S(20402020170)
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
    next_dialog = 2040202018,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20402020175)
    end,
    env_sound = 20003
  },
  [2040202018] = {
    id = 2040202018,
    talk_text = function()
      return T_S(20402020180)
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
    next_dialog = 2040202019,
    speak_name = function()
      return T_S(20402020185)
    end,
    env_sound = 20003
  },
  [2040202019] = {
    id = 2040202019,
    talk_text = function()
      return T_S(20402020190)
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
    next_dialog = 2040202020,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20402020195)
    end,
    env_sound = 20003
  },
  [2040202020] = {
    id = 2040202020,
    talk_text = function()
      return T_S(20402020200)
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
    next_dialog = 2040202021,
    env_sound = 20003
  },
  [2040202021] = {
    id = 2040202021,
    talk_text = function()
      return T_S(20402020210)
    end,
    role_ids = {90110031, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1011", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040202022,
    speak_name = function()
      return T_S(20402020215)
    end,
    env_sound = 20003
  },
  [2040202022] = {
    id = 2040202022,
    talk_text = function()
      return T_S(20402020220)
    end,
    role_ids = {90110031, 90110003},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110003/90110003_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110003/90110003_0.playable"
    },
    role_position = {"270:-1011", "-300:-980"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2040202023,
    speak_name = function()
      return T_S(20402020225)
    end,
    env_sound = 20003
  },
  [2040202023] = {
    id = 2040202023,
    talk_text = function()
      return T_S(20402020230)
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
    next_dialog = 2040202024,
    speak_name = function()
      return T_S(20402020235)
    end,
    env_sound = 20003
  },
  [2040202024] = {
    id = 2040202024,
    talk_text = function()
      return T_S(20402020240)
    end,
    is_master = 1,
    role_ids = {90110004},
    scale = {10000, 10000},
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
    next_dialog = 2040202025,
    env_sound = 20003
  },
  [2040202025] = {
    id = 2040202025,
    talk_text = function()
      return T_S(20402020250)
    end,
    role_ids = {90110004, 90110031},
    scale = {10000, 10000},
    skin = {"common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110031/90110031_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110031/90110031_0.playable"
    },
    role_position = {"-308:-1165", "270:-1011"},
    role_shake = {"", ""},
    effect_in = {"0", "3"},
    effect_in_param = {"0", "150"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2040202026,
    speak_name = function()
      return T_S(20402020255)
    end,
    env_sound = 20003
  },
  [2040202026] = {
    id = 2040202026,
    talk_text = function()
      return T_S(20402020260)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2040202027,
    speak_name = function()
      return T_S(20402020265)
    end,
    env_sound = 20003
  },
  [2040202027] = {
    id = 2040202027,
    talk_text = function()
      return T_S(20402020270)
    end,
    next_dialog = 2040202028,
    env_sound = 20003
  },
  [2040202028] = {
    id = 2040202028,
    talk_text = function()
      return T_S(20402020280)
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
    next_dialog = 2040202029,
    speak_name = function()
      return T_S(20402020285)
    end,
    env_sound = 20003
  },
  [2040202029] = {
    id = 2040202029,
    talk_text = function()
      return T_S(20402020290)
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
    light_role = {1},
    next_dialog = 2040202030,
    env_sound = 20003
  },
  [2040202030] = {
    id = 2040202030,
    talk_text = function()
      return T_S(20402020300)
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
    speak_role = {1},
    light_role = {1},
    speak_name = function()
      return T_S(20402020305)
    end,
    env_sound = 20003
  }
}
