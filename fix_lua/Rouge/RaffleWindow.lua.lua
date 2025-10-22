require("Raffle01_RaffleWindowByName")
local RaffleWindow = {}
local uis, contentPane, jumpTb, lastItem, rechargeConf, costType, roundInfo

function RaffleWindow.ReInitData()
end

function RaffleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaffleWindow.package, WinResConfig.RaffleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaffle01_RaffleWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.RAFFLE_GIFT)
    if SignData.roundAct and SignData.roundAct.baseInfo then
      local conf = TableData.GetConfig(SignData.roundAct.baseInfo.activityId, "BaseActivity")
      if conf and conf.parameter then
        rechargeConf = TableData.GetConfig(tonumber(conf.parameter), "BaseActivityTurntableRecharge")
        if rechargeConf then
          RaffleWindow.UpdateInfo()
          uis.Main.Time.TimeTxt.text = T(2106, TimeUtil.FormatEnTime(SignData.roundAct.baseInfo.endStamp - LoginData.GetCurServerTime()))
        end
      end
    end
    RaffleWindow.InitBtn()
  end)
end

function RaffleWindow.UpdateInfo()
  RaffleWindow.InitAssetsTips()
  RaffleWindow.ShowRecharge()
  local list = uis.Main.TabList
  table.sort(SignData.roundAct.rounds, function(a, b)
    return a.round < b.round
  end)
  
  function list.itemRenderer(i, item)
    UIUtil.SetText(item, T(2096, i + 1), "WordTxt")
    local info = SignData.roundAct.rounds[i + 1]
    local lockType
    if info.round < SignData.roundAct.curRound then
      ChangeUIController(item, "c1", 0)
      UIUtil.SetText(item, T(2096, i + 1), "WordTxt")
    elseif info.round == SignData.roundAct.curRound then
      ChangeUIController(item, "c1", 1)
      if i == #SignData.roundAct.rounds - 1 then
        UIUtil.SetText(item:GetChild("Now"), T(2122, rechargeConf.cycle_num - SignData.roundAct.resetCount), "WordTxt")
      else
        UIUtil.SetText(item:GetChild("Now"), T(2097), "WordTxt")
      end
    elseif info.unlockStamp > LoginData.GetCurServerTime() then
      lockType = 2
      ChangeUIController(item, "c1", 2)
      UIUtil.SetText(item:GetChild("Lcok"), T(2098, TimeUtil.FormatEnTime(info.unlockStamp - LoginData.GetCurServerTime())), "WordTxt")
    else
      lockType = 3
      ChangeUIController(item, "c1", 3)
    end
    item.onClick:Set(function()
      ChangeUIController(lastItem, "c2", 0)
      ChangeUIController(item, "c2", 1)
      RaffleWindow.ShowReward(info)
      ChangeController(uis.Main.BoxBtn.c1Ctr, i)
      lastItem = item
      costType = rechargeConf.cost_type[i + 1]
      if lockType then
        uis.Main.BoxBtn.BoxBtn.touchable = false
        ChangeController(uis.Main.BoxBtn.c2Ctr, 2)
        ChangeUIController(uis.Main.BoxBtn.root, "c3", 0)
        uis.Main.BoxBtn.WordTxt.text = 2 == lockType and T(2102, TimeUtil.FormatEnTime(info.unlockStamp - LoginData.GetCurServerTime())) or T(2103)
      else
        uis.Main.BoxBtn.BoxBtn.touchable = true
        RaffleWindow.ShowBox(info)
      end
      roundInfo = info
    end)
    if info.round == SignData.roundAct.curRound then
      item.onClick:Call()
    end
  end
  
  list.numItems = #SignData.roundAct.rounds
end

function RaffleWindow.ShowReward(info)
  local list = uis.Main.RewardList
  local data = RaffleWindow.GetData(info.round, "BaseActivityTurntablePool")
  table.sort(data, function(a, b)
    return a.sort < b.sort
  end)
  
  function list.itemRenderer(index, item)
    local i = index + 1
    local arr = GetConfigItemList(data[i].reward, true)
    local poolInfo = RaffleWindow.GetPoolInfo(info.pools, data[i].id)
    if arr[1] then
      local itemData = TableData.GetConfigByType(arr[1].type, arr[1].id)
      if itemData and itemData.name then
        local moveRoot = item:GetChild("MoveWord")
        local moveTxt = moveRoot:GetChild("WordTxt")
        GTween.Kill(moveTxt)
        UIUtil.SetMoveText(moveRoot, itemData.name())
        moveTxt:SetXY((moveRoot.width - moveTxt.width) / 2, 0)
        if itemData.quality == nil and itemData.card_id then
          local cardData = TableData.GetConfig(itemData.card_id, "BaseCard")
          if cardData then
            ChangeUIController(item, "c1", cardData.star - 1)
          end
        else
          ChangeUIController(item, "c1", itemData.quality)
        end
      end
      UIUtil.ShowItemFrame(arr[1].id, item:GetChild("Item"), arr[1].value)
      item.onClick:Set(function()
        if arr[1].type == ProtoEnum.TUPLE_TYPE.T_FASHION then
          OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
            {
              id = arr[1].id
            }
          })
        else
          UIUtil.OpenPreviewTips(arr[1].id, arr[1].type)
        end
      end)
      if poolInfo then
        if poolInfo.count > 0 then
          ChangeUIController(item, "c2", 0)
          UIUtil.SetText(item:GetChild("Probability"), T(1828, poolInfo.prob / 100), "NumberTxt")
        else
          ChangeUIController(item, "c2", 2)
          UIUtil.SetText(item:GetChild("GetWord"), T(949), "NumberTxt")
        end
      else
        UIUtil.SetText(item:GetChild("Lock"), T(1835, data[i].unlock_num - info.turnNum), "NumberTxt")
        ChangeUIController(item, "c2", 1)
      end
    end
  end
  
  list.numItems = #data
end

function RaffleWindow.ShowRecharge()
  local tips = uis.Main.ItemRegion
  tips.WordTxt.text = T(2092)
  local data = RaffleWindow.GetData(rechargeConf.recharge_group, "BaseActivityRecharge")
  table.sort(data, function(a, b)
    return a.recharge_level < b.recharge_level
  end)
  local tatal = SignData.roundAct.totalRechargeAmount
  local max, toIndex
  
  function tips.ItemList.itemRenderer(index, item)
    local confInfo = data[index + 1]
    if tatal >= confInfo.recharge_level then
      UIUtil.SetText(item, T(2094, math.min(tatal, confInfo.recharge_level), confInfo.recharge_level), "PriceTxt")
      ChangeUIController(item, "c1", confInfo.recharge_level <= SignData.roundAct.fetchedRechargeLevel and 1 or 2)
    else
      ChangeUIController(item, "c1", 0)
      UIUtil.SetText(item, T(2104, math.min(tatal, confInfo.recharge_level), confInfo.recharge_level), "PriceTxt")
    end
    local arr = GetConfigItemList(confInfo.reward, true)
    if arr[1] then
      UIUtil.SetText(item, arr[1].value, "NumberTxt")
      local loader = item:GetChild("PicLoader")
      UIUtil.SetIconById(loader, arr[1].id)
    end
    if tatal < confInfo.recharge_level and nil == max then
      max = confInfo.recharge_level
    end
    if confInfo.recharge_level >= SignData.roundAct.fetchedRechargeLevel and nil == toIndex then
      toIndex = index
    end
    item.onClick:Set(function()
      if tatal >= confInfo.recharge_level then
        SignService.FetchAccumRechargeRewardReq(confInfo.recharge_level, SignData.roundAct.baseInfo.activityId, function()
          if uis then
            RaffleWindow.ShowRecharge()
          end
        end)
      end
    end)
  end
  
  tips.ItemList.numItems = #data
  local addIndex = toIndex >= 3 and 2 or 0
  if toIndex then
    tips.ItemList:ScrollToView(math.min(toIndex + addIndex, #data - 1))
  end
  tips.DayItem.PriceTxt.text = T(2099)
  local arr = GetConfigItemList(rechargeConf.reward, true)
  if arr[1] then
    tips.DayItem.NumberTxt.text = arr[1].value
    UIUtil.SetIconById(tips.DayItem.PicLoader, arr[1].id)
  end
  tips.DayItem.root.onClick:Set(function()
    if SignData.roundAct == nil or SignData.roundAct.baseInfo and SignData.roundAct.baseInfo.endStamp <= LoginData.GetCurServerTime() then
      MessageBox.Show(T(1618), {
        touchCallback = function()
          UIMgr:CloseWindow(WinResConfig.RaffleWindow.name)
        end
      })
      return
    end
    if SignData.roundAct.dailyRechargeReward then
      SignService.FetchAccumRechargeRewardReq(0, SignData.roundAct.baseInfo.activityId, function()
        if uis then
          ChangeController(tips.DayItem.c1Ctr, SignData.roundAct.dailyRechargeReward and 2 or 1)
        end
      end)
    end
  end)
  ChangeController(tips.DayItem.c1Ctr, SignData.roundAct.dailyRechargeReward and 2 or 1)
  if tatal >= data[#data].recharge_level then
    max = data[#data].recharge_level
  end
  tips.NumberTxt.text = T(2093, tatal)
end

function RaffleWindow.GetPoolInfo(pools, id)
  if id and pools then
    for i, v in pairs(pools) do
      if v.poolId == id then
        return v
      end
    end
  end
end

function RaffleWindow.GetData(groupId, name)
  local config = TableData.GetTable(name)
  local tb = {}
  for i, v in pairs(config) do
    if v.group_id == groupId then
      table.insert(tb, v)
    end
  end
  return tb
end

function RaffleWindow.InitAssetsTips()
  local assetlist = rechargeConf.title_show
  
  function uis.Main.AssetsTipsList.itemRenderer(i, item)
    local itemId = assetlist[i + 1]
    ChangeUIController(item, "c1", 1)
    local count = ActorData.GetItemCount(itemId)
    UIUtil.SetIconById(item:GetChild("IconLoader"), itemId, true)
    UIUtil.SetText(item, UIUtil.GetFormatCount(count), "NumberTxt")
  end
  
  uis.Main.AssetsTipsList.numItems = #assetlist
end

function RaffleWindow.GetCost(curInfo)
  local config = TableData.GetTable("BaseBuyTime")
  local tb = {}
  for i, v in pairs(config) do
    if v.type == costType then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.id < b.id
  end)
  local curNum = curInfo and curInfo.turnNum + 1 or 1
  for i = 1, #tb do
    if curNum >= tb[i].start and curNum <= tb[i].finish and tb[i].cost then
      return GetConfigItemList(tb[i].cost, true)
    end
  end
end

function RaffleWindow.ShowBox(curInfo)
  local boxTips = uis.Main.BoxBtn
  local cost = RaffleWindow.GetCost(curInfo)
  local max
  if curInfo then
    local data = RaffleWindow.GetData(curInfo.round, "BaseActivityTurntablePool")
    max = table.getLen(data)
  end
  if cost and cost[1] and curInfo and max and max > curInfo.turnNum then
    boxTips.Spend.NumberTxt.text = cost[1].value
    UIUtil.SetIconById(boxTips.Spend.PicLoader, cost[1].id)
    boxTips.BoxBtn.onClick:Set(function()
      if SignData.roundAct == nil or SignData.roundAct.baseInfo and SignData.roundAct.baseInfo.endStamp <= LoginData.GetCurServerTime() then
        MessageBox.Show(T(1618), {
          touchCallback = function()
            UIMgr:CloseWindow(WinResConfig.RaffleWindow.name)
          end
        })
        return
      end
      if ActorData.GetItemCount(cost[1].id) >= cost[1].value then
        SignService.ActivityDoTurnTableRoundReq(SignData.roundAct.baseInfo.activityId, curInfo.round, function(msg)
          curInfo = msg.roundData
          roundInfo = msg.roundData
          local maxData = RaffleWindow.GetData(curInfo.round, "BaseActivityTurntablePool")
          if 0 == curInfo.turnNum or curInfo.turnNum >= table.getLen(maxData) then
            SignService.GetActivityAllReq(function()
              if uis then
                RaffleWindow.UpdateInfo()
              end
            end)
          else
            RaffleWindow.UpdateInfo()
          end
        end)
      else
        local itemConfig = TableData.GetConfig(cost[1].id, "BaseItem")
        if itemConfig then
          FloatTipsUtil.ShowWarnTips(T(366, itemConfig.name()))
        end
      end
    end)
    ChangeController(uis.Main.BoxBtn.c2Ctr, 0)
    local canBol = ActorData.GetItemCount(cost[1].id) >= cost[1].value
    ChangeUIController(boxTips.Spend.root, "c1", canBol and 0 or 1)
    ChangeUIController(boxTips.root, "c3", canBol and 0 or 1)
    uis.Main.BoxBtn.WordTxt.text = canBol and T(2095) or ""
  else
    boxTips.BoxBtn.onClick:Clear()
    ChangeController(uis.Main.BoxBtn.c2Ctr, 1)
  end
end

function RaffleWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RaffleWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.RAFFLE_GIFT, nil, nil, function()
    OpenWindow(WinResConfig.RaffleExplainTipsWindow.name)
  end)
end

function RaffleWindow.OnShown()
  if uis then
    RaffleWindow.InitAssetsTips()
    if roundInfo then
      RaffleWindow.ShowBox(roundInfo)
    end
  end
end

function RaffleWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  lastItem = nil
  rechargeConf = nil
  costType = nil
  roundInfo = nil
end

function RaffleWindow.CheckActivityEnd()
  if SignData.roundAct == nil or SignData.roundAct and SignData.roundAct.baseInfo and LoginData.GetCurServerTime() >= SignData.roundAct.baseInfo.endStamp then
    LeanTween.delayedCall(0.15, function()
      MessageBox.Show(T(1618), {
        touchCallback = function()
          UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
        end
      }, nil, {touchable = false})
    end)
  end
end

function RaffleWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    RaffleWindow.CheckActivityEnd()
  end
end

return RaffleWindow
