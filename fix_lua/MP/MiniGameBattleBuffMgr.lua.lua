MiniGameBattleBuffMgr = {}
local listenerSettleList = {}
local listenerDeduceList = {}
local listenerRemoveList = {}
local savedBuffList = {}
local sortBuffList = {}
local copySortBuffUidList = {}
local sortBuffListChanged
local buffGlobalIndex = 0

function MiniGameBattleBuffMgr.InitLocalVar()
end

function MiniGameBattleBuffMgr.Init()
  listenerSettleList = {}
  listenerDeduceList = {}
  savedBuffList = {}
  sortBuffList = {}
  copySortBuffUidList = {}
  sortBuffListChanged = true
  buffGlobalIndex = 0
  MiniGameBattleBuffMgr.savedBuffList = savedBuffList
end

function MiniGameBattleBuffMgr.AddToBuffList(buff)
  savedBuffList[buff.uid] = buff
  sortBuffList[#sortBuffList + 1] = buff
  sortBuffListChanged = true
end

function MiniGameBattleBuffMgr.RemoveFromBuffList(uid)
  savedBuffList[uid] = nil
  for i, buff in ipairs(sortBuffList) do
    if buff.uid == uid then
      table.remove(sortBuffList, i)
      sortBuffListChanged = true
      return
    end
  end
end

function MiniGameBattleBuffMgr.ClearAllBuff()
  for uid, buff in pairs(savedBuffList) do
    if buff then
      buff:Remove(true)
    end
  end
  MiniGameBattleBuffMgr.Init()
end

function MiniGameBattleBuffMgr.RegisterSettleListener(buff)
  local settleType = buff.settleType
  local t = listenerSettleList[settleType] or {}
  t[#t + 1] = {
    uid = buff.uid,
    fromUnitUid = buff.fromUnitUid,
    toUnitUid = buff.toUnitUid,
    toBulletUid = buff.toBulletUid,
    toBombUid = buff.toBombUid,
    toCamp = buff.toCamp
  }
  listenerSettleList[settleType] = t
end

function MiniGameBattleBuffMgr.RegisterDeduceListener(buff)
  local deduceType = buff.deduceType
  if nil == deduceType then
    return
  end
  local t = listenerDeduceList[deduceType] or {}
  t[#t + 1] = {
    uid = buff.uid,
    fromUnitUid = buff.fromUnitUid,
    toUnitUid = buff.toUnitUid,
    toBulletUid = buff.toBulletUid,
    toBombUid = buff.toBombUid,
    toCamp = buff.toCamp
  }
  listenerDeduceList[deduceType] = t
end

function MiniGameBattleBuffMgr.RegisterRemoveListener(buff)
  local removeType = buff.removeType
  if nil == removeType then
    return
  end
  local t = listenerRemoveList[removeType] or {}
  t[#t + 1] = {
    uid = buff.uid,
    fromUnitUid = buff.fromUnitUid,
    toUnitUid = buff.toUnitUid,
    toBulletUid = buff.toBulletUid,
    toBombUid = buff.toBombUid,
    toCamp = buff.toCamp
  }
  listenerRemoveList[removeType] = t
end

function MiniGameBattleBuffMgr.UnRegisterSettleListenerByUnitUid(unitUid)
  for _, settleList in pairs(listenerSettleList) do
    local count = #settleList
    if count > 0 then
      for i = count, 1, -1 do
        if settleList[i].fromUnitUid == unitUid then
          local buff = savedBuffList[settleList[i].uid]
          if buff then
            print("清理未成功挂载的buff,buffId:", buff.id, " buffUid:", buff.uid, " 角色uid:", unitUid)
          end
        end
        table.remove(settleList, i)
      end
    end
  end
end

function MiniGameBattleBuffMgr.UnRegisterSettleListener(uid, settleType)
  local list = listenerSettleList[settleType]
  if list then
    for i = 1, #list do
      if list[i].uid == uid then
        table.remove(list, i)
        return
      end
    end
  end
end

function MiniGameBattleBuffMgr.UnRegisterDeduceListener(uid, deduceType)
  if nil == deduceType then
    return
  end
  local list = listenerDeduceList[deduceType]
  if list then
    for i = 1, #list do
      if list[i].uid == uid then
        table.remove(list, i)
        return
      end
    end
  end
end

function MiniGameBattleBuffMgr.UnRegisterRemoveListener(uid, removeType)
  if nil == removeType then
    return
  end
  local list = listenerRemoveList[removeType]
  if list then
    for i = 1, #list do
      if list[i].uid == uid then
        table.remove(list, i)
        return
      end
    end
  end
end

function MiniGameBattleBuffMgr.RefreshRegisterDeduceListener(buff)
  local list = listenerDeduceList[buff.deduceType]
  if list then
    local tempBuff
    local uid = buff.uid
    for i = 1, #list do
      tempBuff = list[i]
      if tempBuff.uid == uid then
        tempBuff.fromUnitUid = buff.fromUnitUid
        tempBuff.toUnitUid = buff.toUnitUid
        tempBuff.toBulletUid = buff.toBulletUid
        tempBuff.toBombUid = buff.toBombUid
        tempBuff.toCamp = buff.toCamp
        return
      end
    end
  end
end

function MiniGameBattleBuffMgr.TriggerUnitListener(unit, deduceType, settleType, deduceParam, settleParam)
  local unitUid = unit and unit.uid
  if nil == unitUid then
    return
  end
  if deduceType then
    local list = MiniGameBattleBuffMgr.GetListenerDeduceList(deduceType, unitUid)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Deduce(deduceParam)
        end
      end
    end
  end
  if settleType then
    local list = MiniGameBattleBuffMgr.GetListenerSettleList(settleType, unitUid)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Settle(nil, settleParam)
        end
      end
    end
  end
end

function MiniGameBattleBuffMgr.TriggerBulletListener(bullet, deduceType, deduceParam)
  local bulletUid = bullet and bullet.uid
  if nil == bulletUid then
    return
  end
  if deduceType then
    local list = MiniGameBattleBuffMgr.GetListenerDeduceList(deduceType, nil, bulletUid)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Deduce(deduceParam)
        end
      end
    end
  end
end

function MiniGameBattleBuffMgr.GetBuffGlobalIndex()
  buffGlobalIndex = buffGlobalIndex + 1
  return buffGlobalIndex
end

function MiniGameBattleBuffMgr.AnalysisBuffList(buffList, from, tos, settleNow, extraParams)
  local buffStrs, totalProp, random, id, targetId, prob, unitList, camp, buffConfig, groupBuff
  for i = 1, #buffList do
    buffStrs = ParseConfigStr(buffList[i], ";", ":")
    totalProp = 0
    random = MiniGameBattleMgr.GetRandom()
    for j = 1, #buffStrs do
      groupBuff = buffStrs[j]
      id = tonumber(groupBuff[1])
      targetId = tonumber(groupBuff[2])
      prob = tonumber(groupBuff[3]) + (extraParams and extraParams.randomAdd or 0)
      print("当前几率：", random, " 目标几率：", prob, " 累计几率：", totalProp)
      if random <= totalProp + prob then
        buffConfig = TableData.GetConfig(id, "BaseShootSkillBuff")
        unitList, camp = MiniGameBattleChoose.GetBuffTargetUnitList(from, tos, targetId, buffConfig, extraParams)
        for k = 1, #unitList do
          MiniGameBattleBuff.NewBuff(id, from, {
            unitUid = unitList[k].uid
          }, settleNow, extraParams)
        end
        break
      else
        totalProp = totalProp + prob
      end
    end
  end
end

function MiniGameBattleBuffMgr.GetBuffByUid(uid)
  return savedBuffList[uid]
end

function MiniGameBattleBuffMgr.GetSavedBuffList()
  return savedBuffList
end

function MiniGameBattleBuffMgr.UpdateAllBuff(curFixedFrame)
  local tempUidList
  if false == sortBuffListChanged then
    tempUidList = copySortBuffUidList
  else
    tempUidList = {}
    for i, buff in ipairs(sortBuffList) do
      if buff.deduceType then
        table.insert(tempUidList, buff.uid)
      end
    end
    copySortBuffUidList = tempUidList
    sortBuffListChanged = false
  end
  local buff
  for i = 1, #tempUidList do
    buff = savedBuffList[tempUidList[i]]
    if buff then
      buff:Update(curFixedFrame)
    end
  end
end

function MiniGameBattleBuffMgr.GetListenerSettleList(settleType, fromUnitUid)
  local list = listenerSettleList[settleType]
  if nil == list then
    return nil
  end
  local copy = {}
  if fromUnitUid then
    for i = 1, #list do
      if list[i].fromUnitUid == fromUnitUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  end
  return copy
end

function MiniGameBattleBuffMgr.GetListenerDeduceList(deduceType, toUnitUid, toBulletUid, toBombUid, toCamp)
  local list = listenerDeduceList[deduceType]
  if nil == list then
    return nil
  end
  local copy = {}
  if toUnitUid then
    for i = 1, #list do
      if list[i].toUnitUid == toUnitUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  elseif toBulletUid then
    for i = 1, #list do
      if list[i].toBulletUid == toBulletUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  elseif toBombUid then
    for i = 1, #list do
      if list[i].toBombUid == toBombUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  elseif toCamp then
    for i = 1, #list do
      if list[i].toCamp == toCamp then
        copy[#copy + 1] = list[i].uid
      end
    end
  else
    for i = 1, #list do
      copy[#copy + 1] = list[i].uid
    end
  end
  return copy
end

function MiniGameBattleBuffMgr.GetContainedEffect(unit, effectId, containBuff, returnEffect, returnBuff)
  returnEffect = returnEffect or {}
  returnBuff = returnBuff or {}
  local buff
  local tempBuffUid = {}
  local list = unit.cachedBuffEffect[effectId]
  if list then
    local v
    for i = 1, #list do
      v = list[i]
      returnEffect[#returnEffect + 1] = v
      if true == containBuff and tempBuffUid[v.belongBuffUid] == nil then
        buff = savedBuffList[v.belongBuffUid]
        if buff then
          returnBuff[#returnBuff + 1] = buff
          tempBuffUid[v.belongBuffUid] = 1
        end
      end
    end
  end
  return #returnEffect > 0, returnEffect, returnBuff
end

function MiniGameBattleBuffMgr.GetBulletContainedEffect(bullet, effectId, containBuff, returnEffect, returnBuff)
  returnEffect = returnEffect or {}
  returnBuff = returnBuff or {}
  local buff
  local tempBuffUid = {}
  local list = bullet.cachedBuffEffect[effectId]
  if list then
    local v
    for i = 1, #list do
      v = list[i]
      returnEffect[#returnEffect + 1] = v
      if true == containBuff and tempBuffUid[v.belongBuffUid] == nil then
        buff = savedBuffList[v.belongBuffUid]
        if buff then
          returnBuff[#returnBuff + 1] = buff
          tempBuffUid[v.belongBuffUid] = 1
        end
      end
    end
  end
  return #returnEffect > 0, returnEffect, returnBuff
end

function MiniGameBattleBuffMgr.GetValueListByEffectId(unit, effectId)
  local buffIdList = {}
  local contain, effectList = MiniGameBattleBuffMgr.GetContainedEffect(unit, effectId)
  if contain then
    for i, v in ipairs(effectList) do
      local id = v.finalValue
      if table.contain(buffIdList, id) == false then
        table.insert(buffIdList, id)
      end
    end
  end
  return buffIdList
end

function MiniGameBattleBuffMgr.GetValueById(unit, effectId)
  local value = 0
  local contain, effectList = MiniGameBattleBuffMgr.GetContainedEffect(unit, effectId)
  if contain then
    local effect
    for i = 1, #effectList do
      effect = effectList[i]
      value = value + effect.finalValue
    end
  end
  return value
end

function MiniGameBattleBuffMgr.GetSettledBuffByUnitAndId(unit, buffId, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = unit.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff.id == buffId then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end
