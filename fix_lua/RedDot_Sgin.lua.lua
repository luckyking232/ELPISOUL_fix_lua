RedDotSign = {}

function RedDotSign.HomeTaskRed(data)
  if data.type == SignTypeEnum.SIGN_IN_ACT then
    local reward = SignData.GetSignData(tonumber(data.parameter))
    local day = #reward or -1
    if SignData.activityData[data.id].isTodaySignIn == false and day > SignData.activityData[data.id].curDay and SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
      return true
    end
  elseif data.type == SignTypeEnum.SEARCH_ACT and false == SignData.activityData[data.id].isTodaySearch and SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
    return true
  end
end

function RedDotSign.HomeReservationRed(data)
  if data.gift_reward_ids then
    for i = 1, #data.gift_reward_ids do
      if ShopData.canRewards and table.contain(ShopData.canRewards, data.gift_reward_ids[i]) then
        return true
      end
    end
  end
end

function RedDotSign.HomeReturnGiftRed(data)
  if data then
    return data.returnDay > data.signDay
  end
end

function RedDotSign.TurnTableShowFree(activityId)
  if SignData.turnAct then
    local freeBuy = false
    local freeNum = true
    local info = SignData.GetTurnActData(activityId)
    if info then
      if 0 == info.freeGet then
        freeBuy = true
      end
      if info.turnNum > 0 then
        freeNum = nil
      end
      if freeNum and RedDotSign.CanFreeNum(info) then
        return T(1879)
      end
      if freeBuy and RedDotSign.CanFreeBuy(activityId) then
        return T(1877)
      end
    end
  end
end

local GetData = function(groupId, name)
  local config = TableData.GetTable(name)
  local tb = {}
  for i, v in pairs(config) do
    if v.group_id == groupId then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.recharge_level < b.recharge_level
  end)
  return tb
end

function RedDotSign.HomeRoundActRed()
  if SignData.roundAct and SignData.roundAct.baseInfo then
    if SignData.roundAct.dailyRechargeReward then
      return true
    end
    local conf = TableData.GetConfig(SignData.roundAct.baseInfo.activityId, "BaseActivity")
    if conf and conf.parameter then
      local rechargeConf = TableData.GetConfig(tonumber(conf.parameter), "BaseActivityTurntableRecharge")
      if rechargeConf then
        local data = GetData(rechargeConf.recharge_group, "BaseActivityRecharge")
        for i = 1, #data do
          if SignData.roundAct.fetchedRechargeLevel < data[i].recharge_level and SignData.roundAct.totalRechargeAmount >= data[i].recharge_level then
            return true
          end
        end
      end
    end
  end
end

function RedDotSign.CanHomeTurnTable()
  if SignData.turnAct and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ACIVITY_TURNTABLE, false) then
    for i = 1, #SignData.turnAct do
      if SignData.turnAct[i].turnNum < 1 and RedDotSign.CanFreeNum(SignData.turnAct[i]) then
        return T(1879)
      end
    end
    for i = 1, #SignData.turnAct do
      if 0 == SignData.turnAct[i].freeGet and RedDotSign.CanFreeBuy(SignData.turnAct[i].baseInfo.activityId) then
        return T(1877)
      end
    end
  end
end

function RedDotSign.CanFreeBuy(activityId)
  local activityConfig = TableData.GetConfig(activityId, "BaseActivity")
  if activityConfig then
    local turnTableConfig = TableData.GetConfig(tonumber(activityConfig.parameter), "BaseActivityTurntable")
    if turnTableConfig and turnTableConfig.pay_free_reward then
      return true
    end
  end
end

function RedDotSign.CanFreeNum(info)
  if info and info.turnNum > 0 then
    return false
  end
  local activityConfig = TableData.GetConfig(info.baseInfo.activityId, "BaseActivity")
  if activityConfig then
    local turnTableConfig = TableData.GetConfig(tonumber(activityConfig.parameter), "BaseActivityTurntable")
    if turnTableConfig then
      local config = TableData.GetTable("BaseBuyTime")
      local tb = {}
      for i, v in pairs(config) do
        if v.type == turnTableConfig.cost_type then
          table.insert(tb, v)
        end
      end
      table.sort(tb, function(a, b)
        return a.id < b.id
      end)
      local curNum = info and info.turnNum + 1 or 1
      for i = 1, #tb do
        if curNum >= tb[i].start and curNum <= tb[i].finish and not tb[i].cost then
          return true
        end
      end
    end
  end
end
