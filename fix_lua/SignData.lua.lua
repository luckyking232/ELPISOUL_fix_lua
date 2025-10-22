SignData = {
  activityData = {},
  showAct = {}
}
SignTypeEnum = {
  SIGN_IN_ACT = 10118,
  STAGE_ACT = 10119,
  SEARCH_ACT = 10123,
  RETURN_ACT = 10132,
  TURNTABLE_ACT = 10134
}

function SignData.ClearData()
  SignData.activityData = {}
  SignData.showAct = {}
end

function SignData.GetTurnActData(activityId)
  if SignData.turnAct then
    for i, v in pairs(SignData.turnAct) do
      if v.baseInfo.activityId == activityId then
        return v
      end
    end
  end
end

function SignData.SaveActivityData(msg)
  for i, v in pairs(msg) do
    if "showAct" ~= i and "roundAct" ~= i and "returnProAct" ~= i and "dropAct" ~= i then
      if "returnAct" == i then
        if v.baseInfo and v.baseInfo.activityId then
          SignData.activityData[v.baseInfo.activityId] = v
        else
          SignData.activityData[v.baseInfo.activityId] = nil
        end
      else
        for ii, vv in pairs(v) do
          if type(vv) == "table" and vv.baseInfo and vv.baseInfo.activityId then
            SignData.activityData[vv.baseInfo.activityId] = vv
          end
        end
      end
    end
  end
end

function SignData.UpdateOneActivityData(data)
  if SignData.activityData and data then
    for i, v in pairs(SignData.activityData) do
      if v.baseInfo.activityId == data.baseInfo.activityId then
        SignData.activityData[v.baseInfo.activityId] = data
      end
    end
  end
end

function SignData.GetActivitySignInData(addPlayerReturnSort)
  local config = {}
  local parType
  for i, v in pairs(SignData.activityData) do
    local data = TableData.GetConfig(v.baseInfo.activityId, "BaseActivity")
    if data then
      if v.activityCheckInType then
        if v.returnDay and v.returnDay > 0 and v.baseInfo.endStamp > LoginData.GetCurServerTime() then
          local allDay = SignData.GetSignData(v.activityCheckInType)
          if allDay and v.signDay < #allDay then
            SignData.returnMaxDay = #allDay
            table.insert(config, data)
          end
        end
      else
        parType = tonumber(data.parameter)
        if parType and 10 == parType then
        elseif data and data.type == SignTypeEnum.SEARCH_ACT then
          if v.curCount and v.totalCount and v.curCount < v.totalCount then
            table.insert(config, data)
          end
        elseif data and data.type ~= SignTypeEnum.STAGE_ACT then
          local reward = SignData.GetSignData(tonumber(data.parameter))
          if reward and v.curDay then
            local day = #reward or -1
            if day > v.curDay then
              table.insert(config, data)
            end
          end
        end
      end
    end
  end
  if addPlayerReturnSort and ActivityReturnData then
    local activInfo = ActivityReturnData.GetActivityInfo()
    if activInfo and activInfo.baseInfo.endStamp > LoginData.GetCurServerTime() then
      local activInfoData = TableData.GetConfig(activInfo.baseInfo.activityId, "BaseActivity")
      if activInfoData then
        table.insert(config, activInfoData)
      end
    end
  end
  if #config > 1 then
    table.sort(config, function(a, b)
      if a.sort and b.sort then
        return a.sort < b.sort
      end
    end)
  end
  return config
end

function SignData.GetSignData(type)
  local config = TableData.GetTable("BaseActivityCheckIn")
  local tb = {}
  for i, v in pairs(config) do
    if v.type == type then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.day < b.day
  end)
  return tb
end

function SignData.GetReservationData()
  local config = TableData.GetTable("BaseGift")
  for i, v in pairs(config) do
    if 4 == v.type then
      return v
    end
  end
end

function SignData.CanShowReservation()
  local data = SignData.GetReservationData()
  if data and ShopData and data and data.gift_reward_ids then
    local info = ShopData.GetGiftInfoById(data.id)
    if info and #info.rewards ~= #data.gift_reward_ids then
      return true, data
    end
  end
  return false
end
