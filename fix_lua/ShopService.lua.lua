ShopService = {}

function ShopService.Init()
  Net.AddListener(Proto.MsgName.GetShopInfoRsp, ShopService.GetShopInfoRsp)
  Net.AddListener(Proto.MsgName.BuyShopGoodsRsp, ShopService.BuyShopGoodsRsp)
  Net.AddListener(Proto.MsgName.BuySealShopGoodsRsp, ShopService.BuySealShopGoodsRsp)
  Net.AddListener(Proto.MsgName.PurchaseBuyRsp, ShopService.PurchaseBuyRsp)
  Net.AddListener(Proto.MsgName.PurchaseGetRsp, ShopService.PurchaseGetRsp)
  Net.AddListener(Proto.MsgName.GetPurchaseProductsRsp, ShopService.GetPurchaseProductsRsp)
  Net.AddListener(Proto.MsgName.FashionBuyRsp, ShopService.FashionBuyRsp)
  Net.AddListener(Proto.MsgName.MonthCardDailyRewardRsp, ShopService.MonthCardDailyRewardRsp)
  Net.AddListener(Proto.MsgName.CreatePayOrderRsp, ShopService.CreatePayOrderRsp)
  Net.AddListener(Proto.MsgName.CancelPayOrderRsp, ShopService.CancelPayOrderRsp)
  Net.AddListener(Proto.MsgName.GetAllRecommendImgRsp, ShopService.GetAllRecommendImgRsp)
  Net.AddListener(Proto.MsgName.GetGiftInfoRsp, ShopService.GetGiftInfoRsp)
  Net.AddListener(Proto.MsgName.BuyGiftRsp, ShopService.BuyGiftRsp)
  Net.AddListener(Proto.MsgName.GetGiftRewardRsp, ShopService.GetGiftRewardRsp)
  Net.AddListener(Proto.MsgName.GetAgreementInfoRsp, ShopService.GetAgreementInfoRsp)
  Net.AddListener(Proto.MsgName.RewardAgreementRsp, ShopService.RewardAgreementRsp)
  Net.AddListener(Proto.MsgName.FetchWeekPayRewardRsp, ShopService.FetchWeekPayRewardRsp)
end

function ShopService.GetShopInfoReq(types, rspCallback)
  local msg = {}
  msg.types = types
  Net.Send(Proto.MsgName.GetShopInfoReq, msg, rspCallback)
end

function ShopService.GetShopInfoRsp(msg)
  ShopData.SaveShopInfo(msg.shopList)
end

function ShopService.BuyShopGoodsReq(gridId, num, rspCallback)
  local msg = {}
  msg.num = num
  msg.gridId = gridId
  Net.Send(Proto.MsgName.BuyShopGoodsReq, msg, rspCallback)
end

function ShopService.BuyShopGoodsRsp(msg)
  if #msg.goods > 0 then
    GetItemTips.Show(msg.goods)
    ShopData.SaveShopInfo({
      msg.shop
    })
    UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_NUM)
    local shop = msg.shop
    if shop and (3 == shop.typeId or 4 == shop.typeId or 5 == shop.typeId or 6 == shop.typeId) then
      UIMgr:SendWindowMessage(WinResConfig.AbyssShopWindow.name, WindowMsgEnum.AbyssShopWindow.REFRESH_SHOP)
    end
  end
end

function ShopService.BuySealShopGoodsReq(bought, rspCallback)
  local msg = {}
  msg.bought = bought
  Net.Send(Proto.MsgName.BuySealShopGoodsReq, msg, rspCallback)
end

function ShopService.BuySealShopGoodsRsp(msg)
  if #msg.goods > 0 then
    GetItemTips.Show(msg.goods)
    ShopData.SaveShopInfo({
      msg.shop
    })
    UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_NUM)
    local shop = msg.shop
    if shop and (3 == shop.typeId or 4 == shop.typeId or 5 == shop.typeId or 6 == shop.typeId) then
      UIMgr:SendWindowMessage(WinResConfig.AbyssShopWindow.name, WindowMsgEnum.AbyssShopWindow.REFRESH_SHOP)
    end
  end
end

function ShopService.CreatePayOrderReq(productId)
  local msg = {}
  msg.productBaseId = productId
  Net.Send(Proto.MsgName.CreatePayOrderReq, msg)
end

function ShopService.CreatePayOrderRsp(msg)
  if 0 == msg.productBaseId then
    printError("无效订单")
    return
  end
  if SDKManager.UseSDK == true then
    local sdk = SDKManager:GetSDKChannel()
    local productId = msg.productId
    local config = TableData.GetConfig(msg.productBaseId, "BasePayProduct")
    if "Bilibili" == sdk then
      local strs = Split(msg.nonce, ":")
      SDKManager:PaySDK(LoginMgr.bilibili_uid, LoginMgr.bilibili_username, ActorData.GetName(), config.price * 100, config.diamond, strs[1], config.name(), config.name(), msg.nonce, "", msg.orderSign, productId)
    elseif "PnSDK_CN" == sdk then
      print("发起充值请求：pnsdk ", "product_id", productId, "nonce", msg.nonce)
      SDKManager:PaySDK(productId, LoginData.GetSDKServerId(), ActorData.GetUin(), ActorData.GetLevel(), msg.nonce)
    end
  end
end

function ShopService.PurchaseBuyReq(id, rspCallback)
  local msg = {}
  msg.id = id
  Net.Send(Proto.MsgName.PurchaseBuyReq, msg, rspCallback)
end

function ShopService.PurchaseBuyRsp(msg)
  ShopData.isBought = msg.isBought
  if msg.isBought and not ShopData.GetGiftInfoById(27000100) then
    ShopService.GetGiftInfoReq(function()
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
    end)
  end
  ShopData.limitRecord = msg.limitRecord
  ShopData.monthCardDay = msg.monthCardDay
  for i = #msg.reward, 1, -1 do
    if 0 == msg.reward[i].count then
      table.remove(msg.reward, i)
    end
  end
  GetItemTips.Show(msg.reward, true, function()
    if ShopData.monthCardReward then
      for i, v in pairs(ShopData.monthCardDay) do
        if v > 0 and ShopData.monthCardReward[i] == nil or ShopData.monthCardReward[i] == false then
          OpenWindow(WinResConfig.MonthGetWindow.name)
          break
        end
      end
    end
  end)
  UIMgr:SendWindowMessage(WinResConfig.ShopClothesDetailsWindow.name, WindowMsgEnum.ShopWindow.REFRESH_CLOTHES_BUY)
  UIMgr:SendWindowMessage(WinResConfig.ActivityCasketExplainTipsWindow.name, WindowMsgEnum.ActivityCasket.REFRESH_PAY_SHOP)
  UIMgr:SendWindowMessage(WinResConfig.ActivityCasket2ExplainTipsWindow.name, WindowMsgEnum.ActivityCasket.REFRESH_PAY_SHOP)
  UIMgr:SendWindowMessage(WinResConfig.ActivityCasket3ExplainTipsWindow.name, WindowMsgEnum.ActivityCasket.REFRESH_PAY_SHOP)
  UIMgr:SendWindowMessage(WinResConfig.ShopGiftTipsWindow.name, WindowMsgEnum.ShopWindow.REFRESH_PRODUCT)
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_PRODUCT)
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_ONE_GIFT)
  UIMgr:SendWindowMessage(WinResConfig.PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.ActivityPassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity2PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity3PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity4PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity5PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity6PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity7PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity8PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  ShopService.PurchaseGetReq()
  UIMgr:SendWindowMessage(WinResConfig.Activity9PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity10PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity11PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity12PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity13PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity14PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity15PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity16PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity17PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity18PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity19PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity20PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity21PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity22PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
end

function ShopService.CancelPayOrderReq(nonce)
  if string.isEmptyOrNil(nonce) == false then
    local msg = {}
    msg.nonce = nonce
    Net.Send(Proto.MsgName.CancelPayOrderReq, msg)
  end
end

function ShopService.CancelPayOrderRsp(msg)
end

function ShopService.PurchaseGetReq(rspCallback, errorCallback)
  Net.Send(Proto.MsgName.PurchaseGetReq, {}, rspCallback, errorCallback)
end

function ShopService.PurchaseGetRsp(msg)
  ShopData.limitRecord = msg.limitRecord or {}
  ShopData.monthCardDay = msg.monthCardDay or {}
  ShopData.monthCardReward = msg.monthCardReward or {}
  ShopData.isBought = msg.isBought
  ShopData.weekPayInfo = msg.weekPayInfo
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.GetPurchaseProductsReq(type, platform, rspCallback, errorCallback)
  local msg = {}
  msg.productTypes = type
  msg.platformType = platform
  Net.Send(Proto.MsgName.GetPurchaseProductsReq, msg, rspCallback, errorCallback)
end

function ShopService.GetPurchaseProductsRsp(msg)
  local canUpdate = false
  for i, v in pairs(msg.list) do
    ShopData.productInfo[v.productType] = {}
    if v.productType == ProtoEnum.PRODUCT_TYPE.PT_GIFT then
      canUpdate = true
    end
  end
  ShopData.SaveProductInfo(msg.list)
  if canUpdate then
    ShopData.shopLabels = msg.shopLabels
  end
end

function ShopService.FashionBuyReq(id, rspCallback)
  local msg = {}
  msg.buyFashionId = id
  Net.Send(Proto.MsgName.FashionBuyReq, msg, rspCallback)
end

function ShopService.FashionBuyRsp(msg)
  if ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION] then
    for i, v in pairs(ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION]) do
      if v.id and v.id == msg.buyFashionId then
        ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION][i].owned = true
        break
      end
    end
  end
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.GET_CLOTHES)
end

function ShopService.GetAllRecommendImgReq(rspCallback)
  local msg = {}
  msg.onlyOnShelf = true
  Net.Send(Proto.MsgName.GetAllRecommendImgReq, msg, rspCallback)
end

function ShopService.GetAllRecommendImgRsp(msg)
  ShopData.RecommendInfo = msg.infos
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.GET_RECOMMEND)
end

function ShopService.MonthCardDailyRewardReq(id)
  local msg = {}
  msg.cardType = id
  Net.Send(Proto.MsgName.MonthCardDailyRewardReq, msg)
end

function ShopService.MonthCardDailyRewardRsp(msg)
  ShopData.monthCardReward = msg.monthCardReward or {}
  UIMgr:SendWindowMessage(WinResConfig.MonthGetWindow.name, WindowMsgEnum.ShopWindow.GET_MONTH, msg.reward)
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.GET_MONTH)
end

function ShopService.GetGiftInfoReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetGiftInfoReq, msg, rspCallback)
end

function ShopService.GetGiftInfoRsp(msg)
  ShopData.SaveGiftInfo(msg.gifts)
  ShopData.canRewards = msg.canRewards
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.BuyGiftReq(giftId, rspCallback)
  local msg = {}
  msg.giftId = giftId
  Net.Send(Proto.MsgName.BuyGiftReq, msg, rspCallback)
end

function ShopService.BuyGiftRsp(msg)
  ShopData.SaveGiftInfo(msg.gifts)
  ShopData.canRewards = msg.canRewards
  if #msg.goods > 0 then
    GetItemTips.Show(msg.goods, true)
  end
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.GetGiftRewardReq(giftId, stepId, rspCallback)
  local msg = {}
  msg.gitfId = giftId
  msg.stepId = stepId
  Net.Send(Proto.MsgName.GetGiftRewardReq, msg, rspCallback)
end

function ShopService.GetGiftRewardRsp(msg)
  ShopData.SaveGiftInfo(msg.gifts)
  ShopData.canRewards = msg.canRewards
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.GetAgreementInfoReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetAgreementInfoReq, msg, rspCallback)
end

function ShopService.GetAgreementInfoRsp(msg)
  ShopData.agreementInfo = msg
  if ShopData.agreementInfo.datas and #ShopData.agreementInfo.datas > 1 then
    table.sort(ShopData.agreementInfo.datas, function(a, b)
      local aSort = TableData.GetConfig(a.season, "BaseActivityAgreement").sort
      local bSort = TableData.GetConfig(b.season, "BaseActivityAgreement").sort
      return aSort < bSort
    end)
  end
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.RewardAgreementReq(rewardId, season, rspCallback)
  local msg = {}
  msg.season = season
  msg.rewardId = rewardId
  Net.Send(Proto.MsgName.RewardAgreementReq, msg, rspCallback)
end

function ShopService.RewardAgreementRsp(msg)
  for i = 1, #ShopData.agreementInfo.datas do
    if ShopData.agreementInfo.datas[i].season == msg.agreement.season then
      ShopData.agreementInfo.datas[i].rewards = msg.rewards
    end
  end
  local newReward = {}
  local AddItem = function(drop)
    local isFind = false
    for i, v in ipairs(newReward) do
      if v.item.itemId == drop.item.itemId and v.item.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
        isFind = true
        newReward[i].item.count = newReward[i].item.count + drop.item.count
        break
      end
    end
    if false == isFind then
      table.insert(newReward, drop)
    end
  end
  for i = 1, #msg.reward do
    AddItem(msg.reward[i])
  end
  GetItemTips.Show(newReward)
end

function ShopService.FetchWeekPayRewardReq(rewardType, rspCallback)
  local msg = {}
  msg.rewardType = rewardType
  Net.Send(Proto.MsgName.FetchWeekPayRewardReq, msg, rspCallback)
end

function ShopService.FetchWeekPayRewardRsp(msg)
  ShopData.weekPayInfo = msg.weekPayInfo
  GetItemTips.Show(msg.rewards, true)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

ShopService.Init()
