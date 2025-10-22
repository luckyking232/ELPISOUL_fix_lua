BasePlotDialogPart60251 = {
  [1120603001] = {
    id = 1120603001,
    talk_text = function()
      return T_S(11206030010)
    end,
    next_dialog = 1120603002,
    speak_head = 90120048,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11206030015)
    end,
    text_sound_path = "event:/voice_cn/story/S0102/S0102_story_00001",
    text_sound_bank = "bank:/voice_cn/sty/S0102",
    env_sound = 20003
  },
  [1120603002] = {
    id = 1120603002,
    talk_text = function()
      return T_S(11206030020)
    end,
    role_ids = {90110025},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110025/90110025_2.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110025/90110025_0.playable"
    },
    role_position = {"0:-1122"},
    effect_in = {"1"},
    effect_in_param = {"0"},
    effect_out = {"0"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {1},
    light_role = {1},
    next_dialog = 1120603003,
    speak_name = function()
      return T_S(11206030025)
    end,
    text_sound_path = "event:/voice_cn/story/S0003/S0003_story_00015",
    text_sound_bank = "bank:/voice_cn/sty/S0003_1",
    env_sound = 20003
  },
  [1120603003] = {
    id = 1120603003,
    talk_text = function()
      return T_S(11206030030)
    end,
    role_ids = {90110025},
    scale = {10000},
    action_timeline = {
      "Assets/Art/PlotPlay/Timeline/ActionTemplate/90110025/90110025_0.playable"
    },
    blink_timeline = {
      "Assets/Art/PlotPlay/Timeline/BlinkTemplate/90110025/90110025_0.playable"
    },
    role_position = {"0:-1122"},
    effect_in = {"0"},
    effect_in_param = {"0"},
    effect_out = {"1"},
    effect_out_param = {"0"},
    role_effect = {"0"},
    speak_role = {0},
    light_role = {0},
    speak_head = 90120048,
    speak_head_actions = {"idle", "talk"},
    speak_name = function()
      return T_S(11206030035)
    end,
    text_sound_path = "event:/voice_cn/story/S0102/S0102_story_00002",
    text_sound_bank = "bank:/voice_cn/sty/S0102",
    env_sound = 20003
  }
}
