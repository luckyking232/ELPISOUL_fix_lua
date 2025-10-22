BasePayProduct = {
  [25000001] = {
    id = 25000001,
    product_id = "cn.haoplay.elpis.diamond1",
    name = function()
      return T(80615001)
    end,
    icon = "Shop:Recharge_1",
    type = 1,
    price = 6,
    diamond = 1,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 1,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 1,
    shop_group = 1,
    refund_deduction = 1
  },
  [25000002] = {
    id = 25000002,
    product_id = "cn.haoplay.elpis.diamond2",
    name = function()
      return T(80615002)
    end,
    icon = "Shop:Recharge_2",
    type = 1,
    price = 30,
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 1,
    extra_bindDiamond = 0,
    first_diamond = 4,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 2,
    shop_group = 1,
    refund_deduction = 6
  },
  [25000003] = {
    id = 25000003,
    product_id = "cn.haoplay.elpis.diamond3",
    name = function()
      return T(80615003)
    end,
    icon = "Shop:Recharge_3",
    type = 1,
    price = 98,
    diamond = 16,
    bindDiamond = 0,
    extra_diamond = 4,
    extra_bindDiamond = 0,
    first_diamond = 12,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 3,
    shop_group = 1,
    refund_deduction = 20
  },
  [25000004] = {
    id = 25000004,
    product_id = "cn.haoplay.elpis.diamond4",
    name = function()
      return T(80615004)
    end,
    icon = "Shop:Recharge_4",
    type = 1,
    price = 198,
    diamond = 33,
    bindDiamond = 0,
    extra_diamond = 8,
    extra_bindDiamond = 0,
    first_diamond = 25,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 4,
    shop_group = 1,
    refund_deduction = 41
  },
  [25000005] = {
    id = 25000005,
    product_id = "cn.haoplay.elpis.diamond5",
    name = function()
      return T(80615005)
    end,
    icon = "Shop:Recharge_5",
    type = 1,
    price = 328,
    diamond = 55,
    bindDiamond = 0,
    extra_diamond = 13,
    extra_bindDiamond = 0,
    first_diamond = 42,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 5,
    shop_group = 1,
    refund_deduction = 68
  },
  [25000006] = {
    id = 25000006,
    product_id = "cn.haoplay.elpis.diamond6",
    name = function()
      return T(80615006)
    end,
    icon = "Shop:Recharge_6",
    type = 1,
    price = 648,
    diamond = 110,
    bindDiamond = 0,
    extra_diamond = 30,
    extra_bindDiamond = 0,
    first_diamond = 80,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 6,
    shop_group = 1,
    refund_deduction = 140
  },
  [25000101] = {
    id = 25000101,
    product_id = "cn.haoplay.elpis.month2",
    name = function()
      return T(80615101)
    end,
    des = {80616011, 80616012},
    icon = "ShopPic:ShopGiftMonth_1000",
    icon_pic = "ShopPic:ShopPicMonth_1001",
    type = 2,
    month_card_type = 1,
    quality = 3,
    price = 30,
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_rewards = {
      "1:21110003:2"
    },
    day_diamond = 0,
    day_bindDiamond = 150,
    sell_limit_type = 5,
    sell_limit_max = 62,
    sell_level = {1, 999},
    sort = 1,
    shop_group = 2,
    banner_group = 2,
    rule_des = {
      80616001,
      80616002,
      80616003,
      80616004
    },
    refund_deduction = 6,
    buy_return = 6
  },
  [25000201] = {
    id = 25000201,
    product_id = "cn.haoplay.elpis.pack1",
    name = function()
      return T(80615201)
    end,
    icon = "ShopPic:ShopGift_1001",
    type = 3,
    quality = 0,
    price = 6,
    rewards = {
      "1:21090002:1",
      "1:21000003:20000",
      "1:21010001:20000"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 47,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633001)
    end
  },
  [25000202] = {
    id = 25000202,
    product_id = "cn.haoplay.elpis.pack11",
    name = function()
      return T(80615202)
    end,
    icon = "ShopPic:ShopGift_1002",
    type = 3,
    quality = 1,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 51,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633002)
    end
  },
  [25000203] = {
    id = 25000203,
    product_id = "cn.haoplay.elpis.pack3",
    name = function()
      return T(80615203)
    end,
    icon = "ShopPic:ShopGift_1003",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 55,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633003)
    end
  },
  [25000204] = {
    id = 25000204,
    product_id = "cn.haoplay.elpis.pack4",
    name = function()
      return T(80615204)
    end,
    icon = "ShopPic:ShopGift_1004",
    type = 3,
    quality = 2,
    price = 68,
    rewards = {
      "1:21070003:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 57,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 14,
    buy_return = 13,
    sell_type = function()
      return T(80633004)
    end
  },
  [25000205] = {
    id = 25000205,
    product_id = "cn.haoplay.elpis.pack5",
    name = function()
      return T(80615205)
    end,
    icon = "ShopPic:ShopGift_1005",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:20"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 58,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633005)
    end
  },
  [25000206] = {
    id = 25000206,
    product_id = "cn.haoplay.elpis.pack6",
    name = function()
      return T(80615206)
    end,
    icon = "ShopPic:ShopGift_1014",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21100001:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 56,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633006)
    end
  },
  [25000207] = {
    id = 25000207,
    product_id = "cn.haoplay.elpis.pack7",
    name = function()
      return T(80615207)
    end,
    icon = "ShopPic:ShopGift_1015",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100001:20"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 59,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633007)
    end
  },
  [25000208] = {
    id = 25000208,
    product_id = "cn.haoplay.elpis.pack8",
    name = function()
      return T(80615208)
    end,
    icon = "ShopPic:ShopGift_1017",
    type = 3,
    quality = 2,
    price = 6,
    rewards = {
      "1:21090055:1",
      "1:21010104:5"
    },
    diamond = 0,
    bindDiamond = 120,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 52,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633008)
    end
  },
  [25000209] = {
    id = 25000209,
    product_id = "cn.haoplay.elpis.pack9",
    name = function()
      return T(80615209)
    end,
    icon = "ShopPic:ShopGift_1018",
    type = 3,
    quality = 2,
    price = 6,
    rewards = {
      "1:21090056:1",
      "1:21010104:5"
    },
    diamond = 0,
    bindDiamond = 120,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 53,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633009)
    end
  },
  [25000210] = {
    id = 25000210,
    product_id = "cn.haoplay.elpis.pack10",
    name = function()
      return T(80615210)
    end,
    icon = "ShopPic:ShopGift_1019",
    type = 3,
    quality = 2,
    price = 6,
    rewards = {
      "1:21090057:1",
      "1:21010104:5"
    },
    diamond = 0,
    bindDiamond = 120,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 54,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633010)
    end
  },
  [25000211] = {
    id = 25000211,
    product_id = "cn.haoplay.elpis.daily1",
    name = function()
      return T(80615211)
    end,
    icon = "ShopPic:ShopGift_1007",
    type = 3,
    quality = 0,
    price = 6,
    rewards = {
      "1:21100004:1"
    },
    diamond = 0,
    bindDiamond = 60,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 1,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 51,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633011)
    end
  },
  [25000221] = {
    id = 25000221,
    product_id = "cn.haoplay.elpis.weekly1",
    name = function()
      return T(80615221)
    end,
    icon = "ShopPic:ShopGift_1008",
    type = 3,
    quality = 1,
    price = 18,
    rewards = {
      "1:21000003:300000"
    },
    diamond = 0,
    bindDiamond = 200,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 53,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 3,
    buy_return = 3,
    sell_type = function()
      return T(80633012)
    end
  },
  [25000222] = {
    id = 25000222,
    product_id = "cn.haoplay.elpis.weekly2",
    name = function()
      return T(80615222)
    end,
    icon = "ShopPic:ShopGift_1009",
    type = 3,
    quality = 1,
    price = 18,
    rewards = {
      "1:21010001:280000"
    },
    diamond = 0,
    bindDiamond = 200,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 54,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 3,
    buy_return = 3,
    sell_type = function()
      return T(80633013)
    end
  },
  [25000223] = {
    id = 25000223,
    product_id = "cn.haoplay.elpis.weekly3",
    name = function()
      return T(80615223)
    end,
    icon = "ShopPic:ShopGift_1010",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 55,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633014)
    end
  },
  [25000224] = {
    id = 25000224,
    product_id = "cn.haoplay.elpis.weekly4",
    name = function()
      return T(80615224)
    end,
    icon = "ShopPic:ShopGift_1023",
    type = 3,
    quality = 0,
    price = 6,
    rewards = {
      "1:21000023:1"
    },
    diamond = 0,
    bindDiamond = 120,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 30,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633000, 270)
    end
  },
  [25000225] = {
    id = 25000225,
    product_id = "cn.haoplay.elpis.weekly5",
    name = function()
      return T(80615225)
    end,
    icon = "ShopPic:ShopGift_1024",
    type = 3,
    quality = 1,
    price = 30,
    rewards = {
      "1:21000023:3"
    },
    diamond = 0,
    bindDiamond = 600,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 31,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 200)
    end
  },
  [25000231] = {
    id = 25000231,
    product_id = "cn.haoplay.elpis.monthly1",
    name = function()
      return T(80615231)
    end,
    icon = "ShopPic:ShopGift_1011",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21000003:800000"
    },
    diamond = 0,
    bindDiamond = 500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 57,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633015)
    end
  },
  [25000232] = {
    id = 25000232,
    product_id = "cn.haoplay.elpis.monthly2",
    name = function()
      return T(80615232)
    end,
    icon = "ShopPic:ShopGift_1012",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21010001:720000"
    },
    diamond = 0,
    bindDiamond = 500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 58,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633016)
    end
  },
  [25000233] = {
    id = 25000233,
    product_id = "cn.haoplay.elpis.monthly3",
    name = function()
      return T(80615233)
    end,
    icon = "ShopPic:ShopGift_1013",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633017)
    end
  },
  [25000234] = {
    id = 25000234,
    product_id = "cn.haoplay.elpis.monthly4",
    name = function()
      return T(80615234)
    end,
    icon = "ShopPic:ShopGift_1016",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100001:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633018)
    end
  },
  [25000235] = {
    id = 25000235,
    product_id = "cn.haoplay.elpis.monthly5",
    name = function()
      return T(80615235)
    end,
    icon = "ShopPic:ShopGift_1025",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21000023:5"
    },
    diamond = 0,
    bindDiamond = 500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 32,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633000, 170)
    end
  },
  [25000236] = {
    id = 25000236,
    product_id = "cn.haoplay.elpis.monthly6",
    name = function()
      return T(80615236)
    end,
    icon = "ShopPic:ShopGift_1037",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21090309:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 2,
    sell_level = {1, 999},
    sort = 60,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000301] = {
    id = 25000301,
    product_id = "cn.haoplay.elpis.pass101",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040010,
    price = 68,
    rewards = {
      "4:12001073:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000302},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000302] = {
    id = 25000302,
    product_id = "cn.haoplay.elpis.pass102",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040010,
    price = 98,
    rewards = {
      "4:12001073:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000301, 25000303},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000303] = {
    id = 25000303,
    product_id = "cn.haoplay.elpis.pass103",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040010,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000301},
    exclusion = {25000302},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000304] = {
    id = 25000304,
    product_id = "cn.haoplay.elpis.pass104",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040020,
    price = 68,
    rewards = {
      "4:12001463:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000305},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000305] = {
    id = 25000305,
    product_id = "cn.haoplay.elpis.pass105",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040020,
    price = 98,
    rewards = {
      "4:12001463:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000304, 25000306},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000306] = {
    id = 25000306,
    product_id = "cn.haoplay.elpis.pass106",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040020,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000304},
    exclusion = {25000305},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000307] = {
    id = 25000307,
    product_id = "cn.haoplay.elpis.pass107",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040030,
    price = 68,
    rewards = {
      "4:12001313:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000308},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000308] = {
    id = 25000308,
    product_id = "cn.haoplay.elpis.pass108",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040030,
    price = 98,
    rewards = {
      "4:12001313:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000307, 25000309},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000309] = {
    id = 25000309,
    product_id = "cn.haoplay.elpis.pass109",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040030,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000307},
    exclusion = {25000308},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000310] = {
    id = 25000310,
    product_id = "cn.haoplay.elpis.pass110",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040040,
    price = 68,
    rewards = {
      "4:12001403:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000311},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000311] = {
    id = 25000311,
    product_id = "cn.haoplay.elpis.pass111",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040040,
    price = 98,
    rewards = {
      "4:12001403:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000310, 25000312},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000312] = {
    id = 25000312,
    product_id = "cn.haoplay.elpis.pass112",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040040,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000310},
    exclusion = {25000311},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000410] = {
    id = 25000410,
    product_id = "cn.haoplay.elpis.pass113",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040050,
    price = 68,
    rewards = {
      "4:12001113:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000411},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000411] = {
    id = 25000411,
    product_id = "cn.haoplay.elpis.pass114",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040050,
    price = 98,
    rewards = {
      "4:12001113:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000410, 25000412},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000412] = {
    id = 25000412,
    product_id = "cn.haoplay.elpis.pass115",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040050,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000410},
    exclusion = {25000411},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000510] = {
    id = 25000510,
    product_id = "cn.haoplay.elpis.pass116",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040060,
    price = 68,
    rewards = {
      "4:12001553:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000511},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000511] = {
    id = 25000511,
    product_id = "cn.haoplay.elpis.pass117",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040060,
    price = 98,
    rewards = {
      "4:12001553:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000510, 25000512},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000512] = {
    id = 25000512,
    product_id = "cn.haoplay.elpis.pass118",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040060,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000510},
    exclusion = {25000511},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000319] = {
    id = 25000319,
    product_id = "cn.haoplay.elpis.pass119",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040070,
    price = 68,
    rewards = {
      "4:12001173:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000320},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000320] = {
    id = 25000320,
    product_id = "cn.haoplay.elpis.pass120",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040070,
    price = 98,
    rewards = {
      "4:12001173:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000319, 25000321},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000321] = {
    id = 25000321,
    product_id = "cn.haoplay.elpis.pass121",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040070,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000319},
    exclusion = {25000320},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000322] = {
    id = 25000322,
    product_id = "cn.haoplay.elpis.pass122",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040080,
    price = 68,
    rewards = {
      "4:12001103:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000323},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000323] = {
    id = 25000323,
    product_id = "cn.haoplay.elpis.pass123",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040080,
    price = 98,
    rewards = {
      "4:12001103:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000322, 25000324},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000324] = {
    id = 25000324,
    product_id = "cn.haoplay.elpis.pass124",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040080,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000322},
    exclusion = {25000323},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000325] = {
    id = 25000325,
    product_id = "cn.haoplay.elpis.pass125",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040090,
    price = 68,
    rewards = {
      "4:12001483:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000326},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000326] = {
    id = 25000326,
    product_id = "cn.haoplay.elpis.pass126",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040090,
    price = 98,
    rewards = {
      "4:12001483:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000325, 25000327},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000327] = {
    id = 25000327,
    product_id = "cn.haoplay.elpis.pass127",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040090,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000325},
    exclusion = {25000326},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000328] = {
    id = 25000328,
    product_id = "cn.haoplay.elpis.pass128",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040100,
    price = 68,
    rewards = {
      "4:12001523:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000329},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000329] = {
    id = 25000329,
    product_id = "cn.haoplay.elpis.pass129",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040100,
    price = 98,
    rewards = {
      "4:12001523:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000328, 25000330},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000330] = {
    id = 25000330,
    product_id = "cn.haoplay.elpis.pass130",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040100,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000328},
    exclusion = {25000329},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000331] = {
    id = 25000331,
    product_id = "cn.haoplay.elpis.pass131",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040110,
    price = 68,
    rewards = {
      "4:12001303:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000332},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000332] = {
    id = 25000332,
    product_id = "cn.haoplay.elpis.pass132",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040110,
    price = 98,
    rewards = {
      "4:12001303:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000331, 25000333},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000333] = {
    id = 25000333,
    product_id = "cn.haoplay.elpis.pass133",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040110,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000331},
    exclusion = {25000332},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000334] = {
    id = 25000334,
    product_id = "cn.haoplay.elpis.pass134",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040120,
    price = 68,
    rewards = {
      "4:12001323:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000335},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000335] = {
    id = 25000335,
    product_id = "cn.haoplay.elpis.pass135",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040120,
    price = 98,
    rewards = {
      "4:12001323:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000334, 25000336},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000336] = {
    id = 25000336,
    product_id = "cn.haoplay.elpis.pass136",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040120,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000334},
    exclusion = {25000335},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000337] = {
    id = 25000337,
    product_id = "cn.haoplay.elpis.pass137",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040130,
    price = 68,
    rewards = {
      "4:12001143:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000338},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000338] = {
    id = 25000338,
    product_id = "cn.haoplay.elpis.pass138",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040130,
    price = 98,
    rewards = {
      "4:12001143:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000337, 25000339},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000339] = {
    id = 25000339,
    product_id = "cn.haoplay.elpis.pass139",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040130,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000337},
    exclusion = {25000338},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000340] = {
    id = 25000340,
    product_id = "cn.haoplay.elpis.pass140",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040140,
    price = 68,
    rewards = {
      "4:12001433:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000341},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000341] = {
    id = 25000341,
    product_id = "cn.haoplay.elpis.pass141",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040140,
    price = 98,
    rewards = {
      "4:12001433:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000340, 25000342},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000342] = {
    id = 25000342,
    product_id = "cn.haoplay.elpis.pass142",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040140,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000340},
    exclusion = {25000341},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000343] = {
    id = 25000343,
    product_id = "cn.haoplay.elpis.pass143",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040150,
    price = 68,
    rewards = {
      "4:12001493:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000344},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000344] = {
    id = 25000344,
    product_id = "cn.haoplay.elpis.pass144",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040150,
    price = 98,
    rewards = {
      "4:12001493:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000343, 25000345},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000345] = {
    id = 25000345,
    product_id = "cn.haoplay.elpis.pass145",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040150,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000343},
    exclusion = {25000344},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000346] = {
    id = 25000346,
    product_id = "cn.haoplay.elpis.pass146",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040160,
    price = 68,
    rewards = {
      "4:12001263:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000347},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000347] = {
    id = 25000347,
    product_id = "cn.haoplay.elpis.pass147",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040160,
    price = 98,
    rewards = {
      "4:12001263:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000346, 25000348},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000348] = {
    id = 25000348,
    product_id = "cn.haoplay.elpis.pass148",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040160,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000346},
    exclusion = {25000347},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000401] = {
    id = 25000401,
    product_id = "cn.haoplay.elpis.pass001",
    name = function()
      return T(80615401)
    end,
    type = 8,
    passport_id = 1,
    price = 6,
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 1,
    buy_return = 1
  },
  [25000402] = {
    id = 25000402,
    product_id = "cn.haoplay.elpis.pass002",
    name = function()
      return T(80615402)
    end,
    type = 8,
    passport_id = 2,
    price = 6,
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 1,
    buy_return = 1
  },
  [25000501] = {
    id = 25000501,
    product_id = "cn.haoplay.elpis.pass201",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041010,
    price = 68,
    rewards = {
      "4:12001703:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000502] = {
    id = 25000502,
    product_id = "cn.haoplay.elpis.pass202",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041020,
    price = 68,
    rewards = {
      "4:12001613:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000503] = {
    id = 25000503,
    product_id = "cn.haoplay.elpis.pass203",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041030,
    price = 68,
    rewards = {
      "4:12001803:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000504] = {
    id = 25000504,
    product_id = "cn.haoplay.elpis.pass204",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041040,
    price = 68,
    rewards = {
      "4:12001693:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000505] = {
    id = 25000505,
    product_id = "cn.haoplay.elpis.pass205",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041050,
    price = 68,
    rewards = {
      "4:12001623:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000506] = {
    id = 25000506,
    product_id = "cn.haoplay.elpis.pass206",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041060,
    price = 68,
    rewards = {
      "4:12001953:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000507] = {
    id = 25000507,
    product_id = "cn.haoplay.elpis.pass207",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041070,
    price = 68,
    rewards = {
      "4:12001563:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000508] = {
    id = 25000508,
    product_id = "cn.haoplay.elpis.pass208",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041080,
    price = 68,
    rewards = {
      "4:12001733:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000509] = {
    id = 25000509,
    product_id = "cn.haoplay.elpis.pass209",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041090,
    price = 68,
    rewards = {
      "4:12001973:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000513] = {
    id = 25000513,
    product_id = "cn.haoplay.elpis.pass201",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041100,
    price = 68,
    rewards = {
      "4:12001603:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000514] = {
    id = 25000514,
    product_id = "cn.haoplay.elpis.pass201",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041110,
    price = 68,
    rewards = {
      "4:12001673:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000515] = {
    id = 25000515,
    product_id = "cn.haoplay.elpis.pass212",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041120,
    price = 68,
    rewards = {
      "4:12001643:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000516] = {
    id = 25000516,
    product_id = "cn.haoplay.elpis.pass212",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041810,
    price = 68,
    rewards = {
      "4:12001993:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000517] = {
    id = 25000517,
    product_id = "cn.haoplay.elpis.pass212",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041813,
    price = 68,
    rewards = {
      "4:12002003:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000518] = {
    id = 25000518,
    product_id = "cn.haoplay.elpis.pass213",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041130,
    price = 68,
    rewards = {
      "4:12001893:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000519] = {
    id = 25000519,
    product_id = "cn.haoplay.elpis.pass214",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041140,
    price = 68,
    rewards = {
      "4:12002013:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000520] = {
    id = 25000520,
    product_id = "cn.haoplay.elpis.pass215",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041150,
    price = 68,
    rewards = {
      "4:12001863:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000521] = {
    id = 25000521,
    product_id = "cn.haoplay.elpis.pass216",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041160,
    price = 68,
    rewards = {
      "4:12001713:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000522] = {
    id = 25000522,
    product_id = "cn.haoplay.elpis.pass217",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041170,
    price = 68,
    rewards = {
      "4:12002043:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000523] = {
    id = 25000523,
    product_id = "cn.haoplay.elpis.pass218",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041180,
    price = 68,
    rewards = {
      "4:12002053:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000524] = {
    id = 25000524,
    product_id = "cn.haoplay.elpis.pass219",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041190,
    price = 68,
    rewards = {
      "4:12001773:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000525] = {
    id = 25000525,
    product_id = "cn.haoplay.elpis.pass220",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041200,
    price = 68,
    rewards = {
      "4:12002063:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000526] = {
    id = 25000526,
    product_id = "cn.haoplay.elpis.pass221",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041210,
    price = 68,
    rewards = {
      "4:12002073:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000527] = {
    id = 25000527,
    product_id = "cn.haoplay.elpis.pass222",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041220,
    price = 68,
    rewards = {
      "4:12001753:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000601] = {
    id = 25000601,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000602] = {
    id = 25000602,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000603] = {
    id = 25000603,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000604] = {
    id = 25000604,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000605] = {
    id = 25000605,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000606] = {
    id = 25000606,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000607] = {
    id = 25000607,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000608] = {
    id = 25000608,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000609] = {
    id = 25000609,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000610] = {
    id = 25000610,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000611] = {
    id = 25000611,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000612] = {
    id = 25000612,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000613] = {
    id = 25000613,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000614] = {
    id = 25000614,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000615] = {
    id = 25000615,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000616] = {
    id = 25000616,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000617] = {
    id = 25000617,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000618] = {
    id = 25000618,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000619] = {
    id = 25000619,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000620] = {
    id = 25000620,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000621] = {
    id = 25000621,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000622] = {
    id = 25000622,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000623] = {
    id = 25000623,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000624] = {
    id = 25000624,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000625] = {
    id = 25000625,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000626] = {
    id = 25000626,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000627] = {
    id = 25000627,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000628] = {
    id = 25000628,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000629] = {
    id = 25000629,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000630] = {
    id = 25000630,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000631] = {
    id = 25000631,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000632] = {
    id = 25000632,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000633] = {
    id = 25000633,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000634] = {
    id = 25000634,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000635] = {
    id = 25000635,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000636] = {
    id = 25000636,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000637] = {
    id = 25000637,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000638] = {
    id = 25000638,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000639] = {
    id = 25000639,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000640] = {
    id = 25000640,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000641] = {
    id = 25000641,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000642] = {
    id = 25000642,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000643] = {
    id = 25000643,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000644] = {
    id = 25000644,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000645] = {
    id = 25000645,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000646] = {
    id = 25000646,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000647] = {
    id = 25000647,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000648] = {
    id = 25000648,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000649] = {
    id = 25000649,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000650] = {
    id = 25000650,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000651] = {
    id = 25000651,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000652] = {
    id = 25000652,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000653] = {
    id = 25000653,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000654] = {
    id = 25000654,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000655] = {
    id = 25000655,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000656] = {
    id = 25000656,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000657] = {
    id = 25000657,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000658] = {
    id = 25000658,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000659] = {
    id = 25000659,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000660] = {
    id = 25000660,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000661] = {
    id = 25000661,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000662] = {
    id = 25000662,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000663] = {
    id = 25000663,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000701] = {
    id = 25000701,
    product_id = "cn.haoplay.elpis.eventpack107",
    name = function()
      return T(80131703)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001703:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000702] = {
    id = 25000702,
    product_id = "cn.haoplay.elpis.eventpack108",
    name = function()
      return T(80131613)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001613:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000703] = {
    id = 25000703,
    product_id = "cn.haoplay.elpis.eventpack109",
    name = function()
      return T(80131803)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001803:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000704] = {
    id = 25000704,
    product_id = "cn.haoplay.elpis.eventpack110",
    name = function()
      return T(80131693)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001693:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000705] = {
    id = 25000705,
    product_id = "cn.haoplay.elpis.eventpack111",
    name = function()
      return T(80131623)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001623:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000706] = {
    id = 25000706,
    product_id = "cn.haoplay.elpis.eventpack112",
    name = function()
      return T(80131953)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001953:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000707] = {
    id = 25000707,
    product_id = "cn.haoplay.elpis.eventpack113",
    name = function()
      return T(80131563)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001563:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000708] = {
    id = 25000708,
    product_id = "cn.haoplay.elpis.eventpack114",
    name = function()
      return T(80131733)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001733:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000709] = {
    id = 25000709,
    product_id = "cn.haoplay.elpis.eventpack115",
    name = function()
      return T(80131073)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001073:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000710] = {
    id = 25000710,
    product_id = "cn.haoplay.elpis.eventpack116",
    name = function()
      return T(80131463)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001463:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000711] = {
    id = 25000711,
    product_id = "cn.haoplay.elpis.eventpack117",
    name = function()
      return T(80131313)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001313:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000712] = {
    id = 25000712,
    product_id = "cn.haoplay.elpis.eventpack118",
    name = function()
      return T(80131403)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001403:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000713] = {
    id = 25000713,
    product_id = "cn.haoplay.elpis.eventpack119",
    name = function()
      return T(80131113)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001113:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000714] = {
    id = 25000714,
    product_id = "cn.haoplay.elpis.eventpack124",
    name = function()
      return T(80131973)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001973:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000715] = {
    id = 25000715,
    product_id = "cn.haoplay.elpis.eventpack125",
    name = function()
      return T(80131603)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001603:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000716] = {
    id = 25000716,
    product_id = "cn.haoplay.elpis.eventpack126",
    name = function()
      return T(80131673)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001673:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000717] = {
    id = 25000717,
    product_id = "cn.haoplay.elpis.eventpack127",
    name = function()
      return T(80131643)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001643:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000718] = {
    id = 25000718,
    product_id = "cn.haoplay.elpis.eventpack128",
    name = function()
      return T(80131893)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001893:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000719] = {
    id = 25000719,
    product_id = "cn.haoplay.elpis.eventpack129",
    name = function()
      return T(80132013)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12002013:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000720] = {
    id = 25000720,
    product_id = "cn.haoplay.elpis.eventpack130",
    name = function()
      return T(80131863)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001863:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000721] = {
    id = 25000721,
    product_id = "cn.haoplay.elpis.eventpack131",
    name = function()
      return T(80131713)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001713:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000722] = {
    id = 25000722,
    product_id = "cn.haoplay.elpis.eventpack132",
    name = function()
      return T(80131553)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001553:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000723] = {
    id = 25000723,
    product_id = "cn.haoplay.elpis.eventpack133",
    name = function()
      return T(80131173)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001173:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000724] = {
    id = 25000724,
    product_id = "cn.haoplay.elpis.eventpack134",
    name = function()
      return T(80131103)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001103:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000725] = {
    id = 25000725,
    product_id = "cn.haoplay.elpis.eventpack135",
    name = function()
      return T(80131483)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001483:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000726] = {
    id = 25000726,
    product_id = "cn.haoplay.elpis.eventpack136",
    name = function()
      return T(80131523)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001523:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000727] = {
    id = 25000727,
    product_id = "cn.haoplay.elpis.eventpack137",
    name = function()
      return T(80131303)
    end,
    type = 11,
    price = 68,
    rewards = {
      "4:12001303:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000801] = {
    id = 25000801,
    product_id = "cn.haoplay.elpis.eventpack120",
    name = function()
      return T(80615801)
    end,
    type = 12,
    price = 6,
    rewards = {
      "1:21000028:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 36,
    sell_level = {1, 999},
    refund_deduction = 1,
    buy_return = 1,
    activity_id = 70060901
  },
  [25000802] = {
    id = 25000802,
    product_id = "cn.haoplay.elpis.eventpack121",
    name = function()
      return T(80615802)
    end,
    type = 12,
    price = 12,
    rewards = {
      "1:21000028:2"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 18,
    sell_level = {1, 999},
    refund_deduction = 2,
    buy_return = 2,
    activity_id = 70060901
  },
  [25000803] = {
    id = 25000803,
    product_id = "cn.haoplay.elpis.eventpack122",
    name = function()
      return T(80615803)
    end,
    type = 12,
    price = 24,
    rewards = {
      "1:21000028:4"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 9,
    sell_level = {1, 999},
    refund_deduction = 4,
    buy_return = 4,
    activity_id = 70060901
  },
  [25000804] = {
    id = 25000804,
    product_id = "cn.haoplay.elpis.eventpack123",
    name = function()
      return T(80615804)
    end,
    type = 12,
    price = 36,
    rewards = {
      "1:21000028:6"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 6,
    sell_level = {1, 999},
    refund_deduction = 6,
    buy_return = 6,
    activity_id = 70060901
  },
  [25000805] = {
    id = 25000805,
    product_id = "cn.haoplay.elpis.eventpack138",
    name = function()
      return T(80615801)
    end,
    type = 12,
    price = 6,
    rewards = {
      "1:21000033:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 36,
    sell_level = {1, 999},
    refund_deduction = 1,
    buy_return = 1,
    activity_id = 70060902
  },
  [25000806] = {
    id = 25000806,
    product_id = "cn.haoplay.elpis.eventpack139",
    name = function()
      return T(80615802)
    end,
    type = 12,
    price = 12,
    rewards = {
      "1:21000033:2"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 18,
    sell_level = {1, 999},
    refund_deduction = 2,
    buy_return = 2,
    activity_id = 70060902
  },
  [25000807] = {
    id = 25000807,
    product_id = "cn.haoplay.elpis.eventpack140",
    name = function()
      return T(80615803)
    end,
    type = 12,
    price = 24,
    rewards = {
      "1:21000033:4"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 9,
    sell_level = {1, 999},
    refund_deduction = 4,
    buy_return = 4,
    activity_id = 70060902
  },
  [25000808] = {
    id = 25000808,
    product_id = "cn.haoplay.elpis.eventpack141",
    name = function()
      return T(80615804)
    end,
    type = 12,
    price = 36,
    rewards = {
      "1:21000033:6"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 6,
    sell_level = {1, 999},
    refund_deduction = 6,
    buy_return = 6,
    activity_id = 70060902
  },
  [25000809] = {
    id = 25000809,
    product_id = "cn.haoplay.elpis.eventpack142",
    name = function()
      return T(80615801)
    end,
    type = 12,
    price = 6,
    rewards = {
      "1:21000035:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 36,
    sell_level = {1, 999},
    refund_deduction = 1,
    buy_return = 1,
    activity_id = 70060903
  },
  [25000810] = {
    id = 25000810,
    product_id = "cn.haoplay.elpis.eventpack143",
    name = function()
      return T(80615802)
    end,
    type = 12,
    price = 12,
    rewards = {
      "1:21000035:2"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 18,
    sell_level = {1, 999},
    refund_deduction = 2,
    buy_return = 2,
    activity_id = 70060903
  },
  [25000811] = {
    id = 25000811,
    product_id = "cn.haoplay.elpis.eventpack144",
    name = function()
      return T(80615803)
    end,
    type = 12,
    price = 24,
    rewards = {
      "1:21000035:4"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 9,
    sell_level = {1, 999},
    refund_deduction = 4,
    buy_return = 4,
    activity_id = 70060903
  },
  [25000812] = {
    id = 25000812,
    product_id = "cn.haoplay.elpis.eventpack145",
    name = function()
      return T(80615804)
    end,
    type = 12,
    price = 36,
    rewards = {
      "1:21000035:6"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 6,
    sell_level = {1, 999},
    refund_deduction = 6,
    buy_return = 6,
    activity_id = 70060903
  },
  [25000813] = {
    id = 25000813,
    product_id = "cn.haoplay.elpis.eventpack120",
    name = function()
      return T(80615801)
    end,
    type = 12,
    price = 6,
    rewards = {
      "1:21000101:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 36,
    sell_level = {1, 999},
    refund_deduction = 1,
    buy_return = 1,
    activity_id = 70060911
  },
  [25000814] = {
    id = 25000814,
    product_id = "cn.haoplay.elpis.eventpack121",
    name = function()
      return T(80615802)
    end,
    type = 12,
    price = 12,
    rewards = {
      "1:21000101:2"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 18,
    sell_level = {1, 999},
    refund_deduction = 2,
    buy_return = 2,
    activity_id = 70060911
  },
  [25000815] = {
    id = 25000815,
    product_id = "cn.haoplay.elpis.eventpack122",
    name = function()
      return T(80615803)
    end,
    type = 12,
    price = 24,
    rewards = {
      "1:21000101:4"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 9,
    sell_level = {1, 999},
    refund_deduction = 4,
    buy_return = 4,
    activity_id = 70060911
  },
  [25000816] = {
    id = 25000816,
    product_id = "cn.haoplay.elpis.eventpack123",
    name = function()
      return T(80615804)
    end,
    type = 12,
    price = 36,
    rewards = {
      "1:21000101:6"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 6,
    sell_level = {1, 999},
    refund_deduction = 6,
    buy_return = 6,
    activity_id = 70060911
  },
  [25000901] = {
    id = 25000901,
    product_id = "cn.haoplay.elpis.eventpack101",
    name = function()
      return T(80615901)
    end,
    icon = "ShopPic:ShopGift_1026",
    type = 3,
    quality = 3,
    price = 168,
    rewards = {
      "1:21090301:1",
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 35,
    buy_return = 35,
    sell_type = function()
      return T(80633000, 420)
    end
  },
  [25000902] = {
    id = 25000902,
    product_id = "cn.haoplay.elpis.eventpack102",
    name = function()
      return T(80615902)
    end,
    icon = "ShopPic:ShopGift_1027",
    type = 3,
    quality = 3,
    price = 168,
    rewards = {
      "1:21090302:1",
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 35,
    buy_return = 35,
    sell_type = function()
      return T(80633000, 340)
    end
  },
  [25000903] = {
    id = 25000903,
    product_id = "cn.haoplay.elpis.eventpack103",
    name = function()
      return T(80615903)
    end,
    icon = "ShopPic:ShopGift_1029",
    type = 3,
    quality = 3,
    price = 168,
    rewards = {
      "1:21070003:1",
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 35,
    buy_return = 35,
    sell_type = function()
      return T(80633000, 420)
    end
  },
  [25000904] = {
    id = 25000904,
    product_id = "cn.haoplay.elpis.eventpack104",
    name = function()
      return T(80615904)
    end,
    icon = "ShopPic:ShopGift_1028",
    type = 3,
    quality = 2,
    price = 98,
    rewards = {
      "1:21000023:20"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 20,
    buy_return = 20,
    sell_type = function()
      return T(80633000, 200)
    end
  },
  [25000905] = {
    id = 25000905,
    product_id = "cn.haoplay.elpis.eventpack105",
    name = function()
      return T(80615905)
    end,
    icon = "ShopPic:ShopGift_1031",
    type = 3,
    quality = 2,
    price = 98,
    rewards = {
      "1:21000003:2000000"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 20,
    buy_return = 20,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000906] = {
    id = 25000906,
    product_id = "cn.haoplay.elpis.eventpack106",
    name = function()
      return T(80615906)
    end,
    icon = "ShopPic:ShopGift_1030",
    type = 3,
    quality = 2,
    price = 98,
    rewards = {
      "1:21010001:1600000"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 20,
    buy_return = 20,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000907] = {
    id = 25000907,
    product_id = "cn.haoplay.elpis.eventpack148",
    name = function()
      return T(80615907)
    end,
    icon = "ShopPic:ShopGift_1034",
    type = 3,
    quality = 3,
    price = 168,
    rewards = {
      "1:21090311:1",
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 35,
    buy_return = 35,
    sell_type = function()
      return T(80633000, 420)
    end
  },
  [25000908] = {
    id = 25000908,
    product_id = "cn.haoplay.elpis.eventpack149",
    name = function()
      return T(80615908)
    end,
    icon = "ShopPic:ShopGift_1033",
    type = 3,
    quality = 3,
    price = 168,
    rewards = {
      "1:21090303:1",
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 35,
    buy_return = 35,
    sell_type = function()
      return T(80633000, 340)
    end
  },
  [25000909] = {
    id = 25000909,
    product_id = "cn.haoplay.elpis.eventpack103",
    name = function()
      return T(80615909)
    end,
    icon = "ShopPic:ShopGift_1029",
    type = 3,
    quality = 3,
    price = 168,
    rewards = {
      "1:21070003:1",
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 35,
    buy_return = 35,
    sell_type = function()
      return T(80633000, 420)
    end
  },
  [25000910] = {
    id = 25000910,
    product_id = "cn.haoplay.elpis.eventpack146",
    name = function()
      return T(80615910)
    end,
    icon = "ShopPic:ShopGift_1035",
    type = 3,
    quality = 3,
    price = 198,
    rewards = {
      "1:21100004:20"
    },
    diamond = 0,
    bindDiamond = 5000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 41,
    buy_return = 41,
    sell_type = function()
      return T(80633000, 280)
    end
  },
  [25000911] = {
    id = 25000911,
    product_id = "cn.haoplay.elpis.eventpack147",
    name = function()
      return T(80615911)
    end,
    icon = "ShopPic:ShopGift_1036",
    type = 3,
    quality = 2,
    price = 328,
    rewards = {
      "1:21100004:20",
      "1:21000003:980000",
      "1:21110002:10"
    },
    diamond = 55,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 68,
    buy_return = 68,
    sell_type = function()
      return T(80633000, 350)
    end
  },
  [25000912] = {
    id = 25000912,
    product_id = "cn.haoplay.elpis.eventpack104",
    name = function()
      return T(80615904)
    end,
    icon = "ShopPic:ShopGift_1028",
    type = 3,
    quality = 2,
    price = 98,
    rewards = {
      "1:21000023:20"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 3,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 20,
    buy_return = 20,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000913] = {
    id = 25000913,
    product_id = "cn.haoplay.elpis.eventpack105",
    name = function()
      return T(80615905)
    end,
    icon = "ShopPic:ShopGift_1031",
    type = 3,
    quality = 2,
    price = 98,
    rewards = {
      "1:21000003:2000000"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 3,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 20,
    buy_return = 20,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000914] = {
    id = 25000914,
    product_id = "cn.haoplay.elpis.eventpack106",
    name = function()
      return T(80615906)
    end,
    icon = "ShopPic:ShopGift_1030",
    type = 3,
    quality = 2,
    price = 98,
    rewards = {
      "1:21010001:1600000"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 3,
    sell_level = {1, 999},
    is_backstage = 1,
    refund_deduction = 20,
    buy_return = 20,
    sell_type = function()
      return T(80633000, 330)
    end
  }
}
