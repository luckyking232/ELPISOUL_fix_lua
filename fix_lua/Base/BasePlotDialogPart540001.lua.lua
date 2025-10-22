BasePlotDialogPart540001 = {
  [2080103001] = {
    id = 2080103001,
    talk_text = function()
      return T_S(20801030010)
    end,
    next_dialog = 2080103002,
    speak_head = 90120082,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20801030015)
    end,
    env_sound = 20005
  },
  [2080103002] = {
    id = 2080103002,
    talk_text = function()
      return T_S(20801030020)
    end,
    next_dialog = 2080103003,
    speak_head = 90120083,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20801030025)
    end,
    env_sound = 20005
  },
  [2080103003] = {
    id = 2080103003,
    talk_text = function()
      return T_S(20801030030)
    end,
    next_dialog = 2080103004,
    speak_head = 90120082,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(20801030035)
    end,
    env_sound = 20005
  },
  [2080103004] = {
    id = 2080103004,
    talk_text = function()
      return T_S(20801030040)
    end,
    role_ids = {90110034},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110034/90110034_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110034/90110034_0.playable"
    },
    role_position = {"27:-1122"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 2080103005,
    speak_name = function()
      return T_S(20801030045)
    end,
    env_sound = 20005
  },
  [2080103005] = {
    id = 2080103005,
    talk_text = function()
      return T_S(20801030050)
    end,
    role_ids = {90110034},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110034/90110034_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110034/90110034_0.playable"
    },
    role_position = {"27:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    speak_head = 90120083,
    speak_head_actions = {"talk", "idle"},
    speak_name = function()
      return T_S(20801030055)
    end,
    env_sound = 20005
  }
}
