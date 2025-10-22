BasePlotDialogPart520100 = {
  [2040301001] = {
    id = 2040301001,
    talk_text = function()
      return T_S(20403010010)
    end,
    next_dialog = 2040301002,
    env_sound = 20008,
    open_title_1 = function()
      return T_S(20403010018)
    end,
    open_title_2 = function()
      return T_S(20403010019)
    end
  },
  [2040301002] = {
    id = 2040301002,
    talk_text = function()
      return T_S(20403010020)
    end,
    next_dialog = 2040301003,
    env_sound = 20008
  },
  [2040301003] = {
    id = 2040301003,
    talk_text = function()
      return T_S(20403010030)
    end,
    is_master = 1,
    next_dialog = 2040301004,
    env_sound = 20008
  },
  [2040301004] = {
    id = 2040301004,
    talk_text = function()
      return T_S(20403010040)
    end,
    next_dialog = 2040301005,
    env_sound = 20008
  },
  [2040301005] = {
    id = 2040301005,
    talk_text = function()
      return T_S(20403010050)
    end,
    is_master = 1,
    next_dialog = 2040301006,
    env_sound = 20008
  },
  [2040301006] = {
    id = 2040301006,
    talk_text = function()
      return T_S(20403010060)
    end,
    env_sound = 20008
  },
  [2040302001] = {
    id = 2040302001,
    talk_text = function()
      return T_S(20403020010)
    end,
    next_dialog = 2040302002,
    env_sound = 20008
  },
  [2040302002] = {
    id = 2040302002,
    talk_text = function()
      return T_S(20403020020)
    end,
    next_dialog = 2040302003,
    env_sound = 20008
  },
  [2040302003] = {
    id = 2040302003,
    talk_text = function()
      return T_S(20403020030)
    end,
    is_master = 1,
    is_os = 1,
    next_dialog = 2040302004,
    env_sound = 20008
  },
  [2040302004] = {
    id = 2040302004,
    talk_text = function()
      return T_S(20403020040)
    end,
    next_dialog = 2040302005,
    env_sound = 20008
  },
  [2040302005] = {
    id = 2040302005,
    talk_text = function()
      return T_S(20403020050)
    end,
    is_master = 1,
    next_dialog = 2040302006,
    env_sound = 20008
  },
  [2040302006] = {
    id = 2040302006,
    talk_text = function()
      return T_S(20403020060)
    end,
    next_dialog = 2040302007,
    env_sound = 20008
  },
  [2040302007] = {
    id = 2040302007,
    talk_text = function()
      return T_S(20403020070)
    end,
    next_dialog = 2040302008,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20403020075)
    end,
    env_sound = 20008
  },
  [2040302008] = {
    id = 2040302008,
    talk_text = function()
      return T_S(20403020080)
    end,
    next_dialog = 2040302009,
    speak_head = 90120027,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20403020085)
    end,
    env_sound = 20008
  },
  [2040302009] = {
    id = 2040302009,
    talk_text = function()
      return T_S(20403020090)
    end,
    next_dialog = 2040302010,
    speak_head = 90120065,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20403020095)
    end,
    env_sound = 20008
  },
  [2040302010] = {
    id = 2040302010,
    talk_text = function()
      return T_S(20403020100)
    end,
    next_dialog = 2040302011,
    speak_head = 90120027,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20403020105)
    end,
    env_sound = 20008
  },
  [2040302011] = {
    id = 2040302011,
    talk_text = function()
      return T_S(20403020110)
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
    next_dialog = 2040302012,
    env_sound = 20008
  },
  [2040302012] = {
    id = 2040302012,
    talk_text = function()
      return T_S(20403020120)
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
    next_dialog = 2040302013,
    env_sound = 20008
  },
  [2040302013] = {
    id = 2040302013,
    talk_text = function()
      return T_S(20403020130)
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
    next_dialog = 2040302014,
    env_sound = 20008
  },
  [2040302014] = {
    id = 2040302014,
    talk_text = function()
      return T_S(20403020140)
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
    next_dialog = 2040302015,
    env_sound = 20008
  },
  [2040302015] = {
    id = 2040302015,
    talk_text = function()
      return T_S(20403020150)
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
    next_dialog = 2040302016,
    speak_name = function()
      return T_S(20403020155)
    end,
    env_sound = 20008
  },
  [2040302016] = {
    id = 2040302016,
    talk_text = function()
      return T_S(20403020160)
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
    next_dialog = 2040302017,
    env_sound = 20008
  },
  [2040302017] = {
    id = 2040302017,
    talk_text = function()
      return T_S(20403020170)
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
    next_dialog = 2040302018,
    speak_name = function()
      return T_S(20403020175)
    end,
    env_sound = 20008
  },
  [2040302018] = {
    id = 2040302018,
    talk_text = function()
      return T_S(20403020180)
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
    next_dialog = 2040302019,
    env_sound = 20008
  },
  [2040302019] = {
    id = 2040302019,
    talk_text = function()
      return T_S(20403020190)
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
    next_dialog = 2040302020,
    speak_name = function()
      return T_S(20403020195)
    end,
    env_sound = 20008
  },
  [2040302020] = {
    id = 2040302020,
    talk_text = function()
      return T_S(20403020200)
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
    next_dialog = 2040302021,
    env_sound = 20008
  },
  [2040302021] = {
    id = 2040302021,
    talk_text = function()
      return T_S(20403020210)
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
    next_dialog = 2040302022,
    env_sound = 20008
  },
  [2040302022] = {
    id = 2040302022,
    talk_text = function()
      return T_S(20403020220)
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
    next_dialog = 2040302023,
    speak_name = function()
      return T_S(20403020225)
    end,
    env_sound = 20008
  },
  [2040302023] = {
    id = 2040302023,
    talk_text = function()
      return T_S(20403020230)
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
    next_dialog = 2040302024,
    env_sound = 20008
  },
  [2040302024] = {
    id = 2040302024,
    talk_text = function()
      return T_S(20403020240)
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
    next_dialog = 2040302025,
    speak_name = function()
      return T_S(20403020245)
    end,
    env_sound = 20008
  },
  [2040302025] = {
    id = 2040302025,
    talk_text = function()
      return T_S(20403020250)
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
    next_dialog = 2040302026,
    env_sound = 20008
  },
  [2040302026] = {
    id = 2040302026,
    talk_text = function()
      return T_S(20403020260)
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
    next_dialog = 2040302027,
    speak_name = function()
      return T_S(20403020265)
    end,
    env_sound = 20008
  },
  [2040302027] = {
    id = 2040302027,
    talk_text = function()
      return T_S(20403020270)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {1},
    env_sound = 20008
  }
}
