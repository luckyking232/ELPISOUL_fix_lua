BasePlotDialogPart535200 = {
  [2070501001] = {
    id = 2070501001,
    middle_text = function()
      return T_S(20705010013)
    end,
    next_dialog = 2070501002,
    speak_name = function()
      return T_S(20705010015)
    end,
    env_sound = 20007,
    review_head = "90210001",
    open_title_1 = function()
      return T_S(20705010018)
    end,
    open_title_2 = function()
      return T_S(20705010019)
    end,
    open_bg_id = 90210034
  },
  [2070501002] = {
    id = 2070501002,
    middle_text = function()
      return T_S(20705010023)
    end,
    next_dialog = 2070501003,
    speak_name = function()
      return T_S(20705010025)
    end,
    env_sound = 20007,
    review_head = "90210002"
  },
  [2070501003] = {
    id = 2070501003,
    talk_text = function()
      return T_S(20705010030)
    end,
    speak_name = function()
      return T_S(20705010035)
    end,
    env_sound = 20007,
    review_head = "90210001"
  },
  [2070502001] = {
    id = 2070502001,
    talk_text = function()
      return T_S(20705020010)
    end,
    next_dialog = 2070502002,
    env_sound = 20007
  },
  [2070502002] = {
    id = 2070502002,
    talk_text = function()
      return T_S(20705020020)
    end,
    next_dialog = 2070502003,
    env_sound = 20007
  },
  [2070502003] = {
    id = 2070502003,
    talk_text = function()
      return T_S(20705020030)
    end,
    role_ids = {90110033},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110033/90110033_1.playable"
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
    next_dialog = 2070502004,
    speak_name = function()
      return T_S(20705020035)
    end,
    env_sound = 20007
  },
  [2070502004] = {
    id = 2070502004,
    talk_text = function()
      return T_S(20705020040)
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
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    next_dialog = 2070502005,
    env_sound = 20007
  },
  [2070502005] = {
    id = 2070502005,
    talk_text = function()
      return T_S(20705020050)
    end,
    env_sound = 20007
  }
}
