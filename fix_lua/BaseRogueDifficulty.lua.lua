BaseRogueDifficulty = {
  [50803100] = {
    id = 50803100,
    group_id = 101,
    name = function()
      return T(80264101)
    end,
    des = function()
      return T(80265101)
    end,
    level = 0,
    next = 50803101,
    unlock = 1,
    buff_list = {
      46603001,
      46603002,
      46603003
    },
    score_ratio = 5000,
    show_type = 0,
    monster_attribute = {
      "2:40000103:10000",
      "2:40000104:10000",
      "2:40000102:10000"
    }
  },
  [50803101] = {
    id = 50803101,
    group_id = 101,
    name = function()
      return T(80264102)
    end,
    des = function()
      return T(80265102)
    end,
    level = 1,
    pre = 50803100,
    next = 50803102,
    unlock = 1,
    score_ratio = 10000,
    show_type = 0
  },
  [50803102] = {
    id = 50803102,
    group_id = 101,
    name = function()
      return T(80264103)
    end,
    des = function()
      return T(80265103)
    end,
    level = 2,
    pre = 50803101,
    next = 50803103,
    buff_list = {46603021, 46603022},
    score_ratio = 12000,
    show_type = 1,
    monster_attribute = {
      "2:40000103:15000",
      "2:40000104:15000",
      "2:40000102:15000"
    }
  },
  [50803103] = {
    id = 50803103,
    group_id = 101,
    name = function()
      return T(80264104)
    end,
    des = function()
      return T(80265104)
    end,
    level = 3,
    pre = 50803102,
    next = 50803104,
    buff_list = {
      46603031,
      46603032,
      46603033
    },
    score_ratio = 14000,
    show_type = 1,
    monster_attribute = {
      "2:40000103:20000",
      "2:40000104:20000",
      "2:40000102:20000"
    }
  },
  [50803104] = {
    id = 50803104,
    group_id = 101,
    name = function()
      return T(80264105)
    end,
    des = function()
      return T(80265105)
    end,
    level = 4,
    pre = 50803103,
    next = 50803105,
    buff_list = {
      46603041,
      46603045,
      46603042,
      46603043,
      46603044
    },
    score_ratio = 16000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:30000",
      "2:40000104:30000",
      "2:40000102:30000"
    },
    boss_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  },
  [50803105] = {
    id = 50803105,
    group_id = 101,
    name = function()
      return T(80264106)
    end,
    des = function()
      return T(80265106)
    end,
    level = 5,
    pre = 50803104,
    next = 50803106,
    buff_list = {
      46603051,
      46603052,
      46603053,
      46603054,
      46603055,
      46603056
    },
    score_ratio = 18000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:50000",
      "2:40000104:50000",
      "2:40000102:50000"
    },
    boss_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  },
  [50803106] = {
    id = 50803106,
    group_id = 101,
    name = function()
      return T(80264107)
    end,
    des = function()
      return T(80265107)
    end,
    level = 6,
    pre = 50803105,
    next = 50803107,
    buff_list = {
      46603061,
      46603062,
      46603063,
      46603064,
      46603065,
      46603066,
      46603067
    },
    score_ratio = 20000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:70000",
      "2:40000104:70000",
      "2:40000102:70000"
    },
    boss_monster_attribute = {
      "2:40000103:30000",
      "2:40000102:30000"
    },
    encounter_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  },
  [50803107] = {
    id = 50803107,
    group_id = 101,
    name = function()
      return T(80264108)
    end,
    des = function()
      return T(80265108)
    end,
    level = 7,
    pre = 50803106,
    next = 50803108,
    buff_list = {
      46603071,
      46603072,
      46603073,
      46603074,
      46603075,
      46603076,
      46603077,
      46603078
    },
    score_ratio = 22000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:90000",
      "2:40000104:90000",
      "2:40000102:90000"
    },
    boss_monster_attribute = {
      "2:40000103:30000",
      "2:40000102:30000"
    },
    encounter_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  },
  [50803108] = {
    id = 50803108,
    group_id = 101,
    name = function()
      return T(80264109)
    end,
    des = function()
      return T(80265109)
    end,
    level = 8,
    pre = 50803107,
    next = 50803109,
    buff_list = {
      46603081,
      46603082,
      46603083,
      46603084,
      46603085,
      46603086,
      46603087,
      46603088,
      46603089
    },
    score_ratio = 24000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:100000",
      "2:40000104:100000",
      "2:40000102:100000"
    },
    boss_monster_attribute = {
      "2:40000103:30000",
      "2:40000102:30000"
    },
    encounter_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  },
  [50803109] = {
    id = 50803109,
    group_id = 101,
    name = function()
      return T(80264110)
    end,
    des = function()
      return T(80265110)
    end,
    level = 9,
    pre = 50803108,
    buff_list = {
      46603091,
      46603092,
      46603093,
      46603094,
      46603095,
      46603096,
      46603097,
      46603098,
      46603099,
      46603100
    },
    score_ratio = 26000,
    show_type = 2,
    monster_attribute = {
      "2:40000103:150000",
      "2:40000104:150000",
      "2:40000102:150000"
    },
    boss_monster_attribute = {
      "2:40000103:30000",
      "2:40000102:30000"
    },
    encounter_monster_attribute = {
      "2:40000103:20000",
      "2:40000102:20000"
    }
  }
}
