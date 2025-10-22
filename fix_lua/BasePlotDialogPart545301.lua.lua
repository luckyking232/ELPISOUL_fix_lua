BasePlotDialogPart545301 = {
  [2090703001] = {
    id = 2090703001,
    talk_text = function()
      return T_S(20907030010)
    end,
    next_dialog = 2090703002,
    env_sound = 20008
  },
  [2090703002] = {
    id = 2090703002,
    talk_text = function()
      return T_S(20907030020)
    end,
    next_dialog = 2090703003,
    speak_head = 90120034,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20907030025)
    end,
    env_sound = 20008
  },
  [2090703003] = {
    id = 2090703003,
    talk_text = function()
      return T_S(20907030030)
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
    next_dialog = 2090703004,
    speak_name = function()
      return T_S(20907030035)
    end,
    env_sound = 20008
  },
  [2090703004] = {
    id = 2090703004,
    talk_text = function()
      return T_S(20907030040)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2090703005,
    speak_head = 90120039,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20907030045)
    end,
    env_sound = 20008
  },
  [2090703005] = {
    id = 2090703005,
    talk_text = function()
      return T_S(20907030050)
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
    effect_out = {"3"},
    effect_out_param = {"210"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090703006,
    speak_name = function()
      return T_S(20907030055)
    end,
    env_sound = 20008
  },
  [2090703006] = {
    id = 2090703006,
    talk_text = function()
      return T_S(20907030060)
    end,
    next_dialog = 2090703007,
    env_sound = 20008
  },
  [2090703007] = {
    id = 2090703007,
    talk_text = function()
      return T_S(20907030070)
    end,
    speak_head = 90120034,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20907030075)
    end,
    env_sound = 20008
  },
  [2090704001] = {
    id = 2090704001,
    talk_text = function()
      return T_S(20907040010)
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
    next_dialog = 2090704002,
    speak_name = function()
      return T_S(20907040015)
    end,
    env_sound = 20008
  },
  [2090704002] = {
    id = 2090704002,
    talk_text = function()
      return T_S(20907040020)
    end,
    role_ids = {90110004, 90110039},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090704002/2090704002_90110039.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"240:-1165", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090704003,
    speak_name = function()
      return T_S(20907040025)
    end,
    env_sound = 20008
  },
  [2090704003] = {
    id = 2090704003,
    talk_text = function()
      return T_S(20907040030)
    end,
    role_ids = {90110004, 90110039},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090704003/2090704003_90110004.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"240:-1165", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090704004,
    speak_name = function()
      return T_S(20907040035)
    end,
    env_sound = 20008
  },
  [2090704004] = {
    id = 2090704004,
    talk_text = function()
      return T_S(20907040040)
    end,
    role_ids = {90110004, 90110039},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"240:-1165", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090704005,
    camera_shake = {
      "1",
      "0",
      "1200"
    },
    env_sound = 20008
  },
  [2090704005] = {
    id = 2090704005,
    talk_text = function()
      return T_S(20907040050)
    end,
    role_ids = {90110004, 90110039},
    scale = {10000, 10000},
    skin = {"common", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_1.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"240:-1165", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"4", "4"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 1},
    light_role = {1, 1},
    next_dialog = 2090704006,
    speak_name = function()
      return T_S(20907040055)
    end,
    env_sound = 20008
  },
  [2090704006] = {
    id = 2090704006,
    talk_text = function()
      return T_S(20907040060)
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
    next_dialog = 2090704007,
    speak_name = function()
      return T_S(20907040065)
    end,
    env_sound = 20008
  },
  [2090704007] = {
    id = 2090704007,
    talk_text = function()
      return T_S(20907040070)
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
    next_dialog = 2090704008,
    env_sound = 20008
  },
  [2090704008] = {
    id = 2090704008,
    talk_text = function()
      return T_S(20907040080)
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
    next_dialog = 2090704009,
    speak_name = function()
      return T_S(20907040085)
    end,
    env_sound = 20008
  },
  [2090704009] = {
    id = 2090704009,
    talk_text = function()
      return T_S(20907040090)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2090704010,
    env_sound = 20008
  },
  [2090704010] = {
    id = 2090704010,
    talk_text = function()
      return T_S(20907040100)
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
    light_role = {0},
    next_dialog = 2090704011,
    env_sound = 20008
  },
  [2090704011] = {
    id = 2090704011,
    talk_text = function()
      return T_S(20907040110)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090704012,
    speak_name = function()
      return T_S(20907040115)
    end,
    env_sound = 20008
  },
  [2090704012] = {
    id = 2090704012,
    talk_text = function()
      return T_S(20907040120)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090704013,
    env_sound = 20008
  },
  [2090704013] = {
    id = 2090704013,
    talk_text = function()
      return T_S(20907040130)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090704014,
    speak_name = function()
      return T_S(20907040135)
    end,
    env_sound = 20008
  },
  [2090704014] = {
    id = 2090704014,
    talk_text = function()
      return T_S(20907040140)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090704014/2090704014_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090704015,
    speak_name = function()
      return T_S(20907040145)
    end,
    env_sound = 20008
  },
  [2090704015] = {
    id = 2090704015,
    talk_text = function()
      return T_S(20907040150)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090704016,
    speak_name = function()
      return T_S(20907040155)
    end,
    env_sound = 20008
  },
  [2090704016] = {
    id = 2090704016,
    talk_text = function()
      return T_S(20907040160)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090704017,
    speak_name = function()
      return T_S(20907040165)
    end,
    env_sound = 20008
  },
  [2090704017] = {
    id = 2090704017,
    talk_text = function()
      return T_S(20907040170)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090704018,
    speak_head = 90120044,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20907040175)
    end,
    env_sound = 20008
  },
  [2090704018] = {
    id = 2090704018,
    talk_text = function()
      return T_S(20907040180)
    end,
    is_master = 1,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090704019,
    env_sound = 20008
  },
  [2090704019] = {
    id = 2090704019,
    talk_text = function()
      return T_S(20907040190)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090704019/2090704019_90110009.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090704020,
    speak_name = function()
      return T_S(20907040195)
    end,
    env_sound = 20008
  },
  [2090704020] = {
    id = 2090704020,
    talk_text = function()
      return T_S(20907040200)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    next_dialog = 2090704021,
    speak_name = function()
      return T_S(20907040205)
    end,
    env_sound = 20008
  },
  [2090704021] = {
    id = 2090704021,
    talk_text = function()
      return T_S(20907040210)
    end,
    next_dialog = 2090704022,
    env_sound = 20008
  },
  [2090704022] = {
    id = 2090704022,
    talk_text = function()
      return T_S(20907040220)
    end,
    role_ids = {90110004},
    scale = {10000},
    skin = {"common"},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110004/90110004_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110004/90110004_0.playable"
    },
    role_position = {"-38:-1165"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2090704023,
    speak_name = function()
      return T_S(20907040225)
    end,
    env_sound = 20008
  },
  [2090704023] = {
    id = 2090704023,
    talk_text = function()
      return T_S(20907040230)
    end,
    scale = {10000},
    next_dialog = 2090704024,
    env_sound = 20008
  },
  [2090704024] = {
    id = 2090704024,
    talk_text = function()
      return T_S(20907040240)
    end,
    is_os = 1,
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
    next_dialog = 2090704025,
    speak_name = function()
      return T_S(20907040245)
    end,
    env_sound = 20008
  },
  [2090704025] = {
    id = 2090704025,
    talk_text = function()
      return T_S(20907040250)
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
    speak_role = {0},
    light_role = {0},
    next_dialog = 2090704026,
    env_sound = 20008
  },
  [2090704026] = {
    id = 2090704026,
    talk_text = function()
      return T_S(20907040260)
    end,
    role_ids = {90110009},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/DialogAction/2090704026/2090704026_90110009.playable"
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
    next_dialog = 2090704027,
    speak_name = function()
      return T_S(20907040265)
    end,
    env_sound = 20008
  },
  [2090704027] = {
    id = 2090704027,
    talk_text = function()
      return T_S(20907040270)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "2"},
    effect_in_param = {"0", "150"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090704028,
    speak_name = function()
      return T_S(20907040275)
    end,
    env_sound = 20008
  },
  [2090704028] = {
    id = 2090704028,
    talk_text = function()
      return T_S(20907040280)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090704029,
    speak_name = function()
      return T_S(20907040285)
    end,
    env_sound = 20008
  },
  [2090704029] = {
    id = 2090704029,
    talk_text = function()
      return T_S(20907040290)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 1},
    light_role = {0, 1},
    next_dialog = 2090704030,
    speak_name = function()
      return T_S(20907040295)
    end,
    env_sound = 20008
  },
  [2090704030] = {
    id = 2090704030,
    talk_text = function()
      return T_S(20907040300)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"0", "0"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {1, 0},
    light_role = {1, 0},
    next_dialog = 2090704031,
    speak_name = function()
      return T_S(20907040305)
    end,
    env_sound = 20008
  },
  [2090704031] = {
    id = 2090704031,
    talk_text = function()
      return T_S(20907040310)
    end,
    role_ids = {90110009, 90110039},
    scale = {10000, 10000},
    skin = {"", "common"},
    action = {"", ""},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110039/90110039_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110009/90110009_0.playable",
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110039/90110039_0.playable"
    },
    role_position = {"270:-1080", "-270:-1000"},
    role_shake = {"", ""},
    effect_in = {"0", "0"},
    effect_in_param = {"0", "0"},
    effect_out = {"1", "1"},
    effect_out_param = {"0", "0"},
    role_effect = {"0", "0"},
    speak_role = {0, 0},
    light_role = {0, 0},
    env_sound = 20008
  }
}
