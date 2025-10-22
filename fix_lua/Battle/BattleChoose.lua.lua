BattleChoose = {}
local t_sort = table.sort
local ATTR_ENUM = ATTR_ENUM
local BATTLE_UNIT_TYPE = BATTLE_UNIT_TYPE

function BattleChoose.InitLocalVar()
end

function BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
  local range_type, range_x, range_y
  if nil ~= skillLevelUpConfig then
    range_type, range_x, range_y = skillLevelUpConfig.range_type, skillLevelUpConfig.range_x, skillLevelUpConfig.range_y
    if skillLevelUpConfig.effect_change_range and fromUnit then
      local effectId = skillLevelUpConfig.effect_change_range
      local isContain, _, buffList = BattleBuffMgr.GetContainedEffect(fromUnit, effectId, nil, true)
      if true == isContain then
        local tempBuff, config
        for i = 1, #buffList do
          tempBuff = buffList[1]
          config = tempBuff.buffConfig
          if config and config.range_type == range_type then
            range_x = (config.range_x or 0) + range_x
            range_y = (config.range_y or 0) + range_y
          end
        end
      end
    end
  elseif nil ~= buffConfig then
    range_type, range_x, range_y = buffConfig.range_type, buffConfig.range_x, buffConfig.range_y
  end
  return range_type, range_x, range_y
end

function BattleChoose.GetTargetType(skillLevelUpConfig, fromUnit)
  local targetType = skillLevelUpConfig.target_type
  if skillLevelUpConfig.effect_change_target_type then
    local effectId = skillLevelUpConfig.effect_change_target_type
    local isContain, effectList = BattleBuffMgr.GetContainedEffect(fromUnit, effectId, nil)
    if true == isContain then
      for i = 1, #effectList do
        targetType = effectList[i].finalValue
        break
      end
    end
  end
  return targetType
end

function BattleChoose.GetTargetUnitList(targetId, from, tos, skillLevelUpConfig, buffConfig, chooseExtraParams)
  local targetUnitList = {}
  local targetCamp, fromUnit, skill, campObj, manuallySkill, camp
  if from.unitUid then
    fromUnit = BattleScene.GetUnitByUid(from.unitUid)
  elseif from.skillId then
    local fromBadge = BattleScene.GetBurst(from.skillCamp)
    skill = fromBadge:GetSkill(from.skillId)
    camp = from.skillCamp
  elseif from.camp then
    campObj = BattleScene.GetCampObject(from.camp)
    camp = from.camp
  elseif from.manuallySkillId then
    manuallySkill = BattleScene.GetManuallySkill(from.manuallySkillId, from.skillCamp)
    camp = from.skillCamp
  end
  local basedCampObj = fromUnit or skill or campObj or {camp = camp}
  local range_type, range_x, range_y, targetParam
  if fromUnit and skillLevelUpConfig then
    targetId = BattleChoose.GetTargetType(skillLevelUpConfig, fromUnit)
  end
  local targetConfig = TableData.GetConfig(targetId, "BaseBattleTarget", true)
  if targetConfig then
    targetId = targetConfig.target_type
    targetParam = targetConfig.target_param
  end
  if 1000 == targetId then
    for i = 1, #tos do
      targetUnitList[#targetUnitList + 1] = BattleScene.GetUnitByUid(tos[i].unitUid)
    end
  elseif 1001 == targetId then
    targetUnitList = {fromUnit}
  elseif 1002 == targetId then
    for i = 1, #tos do
      targetUnitList[#targetUnitList + 1] = BattleScene.GetUnitByUid(tos[i].unitUid)
    end
  elseif 1003 == targetId then
    local uid = fromUnit.lastKillSelfUnitUid
    if uid then
      local unit = BattleScene.GetUnitByUid(uid)
      if unit then
        targetUnitList = {unit}
      end
    end
  elseif 1004 == targetId then
    if #tos > 0 then
      local unit = BattleScene.GetUnitByUid(tos[1].unitUid)
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(nil, buffConfig)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnit(unit, range_type, range_x, range_y, false)
      end
    end
  elseif 1005 == targetId then
    if chooseExtraParams and chooseExtraParams.triggerFromUnitUid then
      local unit = BattleScene.GetUnitByUid(chooseExtraParams.triggerFromUnitUid)
      if unit then
        targetUnitList = {unit}
      end
    end
  elseif 1007 == targetId then
    targetUnitList = BattleScene.GetAllAliveCardUnitList()
  elseif 1008 == targetId then
    if #tos > 0 and tos[1].unitUid then
      local unit = BattleScene.GetUnitByUid(tos[1].unitUid)
      if unit and unit.isGrid then
        targetUnitList = {unit}
      end
    end
  elseif 1009 == targetId then
    if #tos > 0 and tos[1].bombUid then
      local bomb = BattleScene.GetBombByUid(tos[1].bombUid)
      if bomb and bomb.targetUnit then
        targetUnitList = {
          bomb.targetUnit
        }
      end
    end
  elseif 1010 == targetId then
    if fromUnit.summonFromUnit then
      targetUnitList = {
        BattleScene.GetUnitByUid(fromUnit.summonFromUni)
      }
    end
  elseif 2001 == targetId then
    local uid = fromUnit:GetAttackTargetUid()
    local unit = BattleScene.GetUnitByUid(uid)
    if unit and (nil ~= buffConfig or fromUnit:IsTargetInAttackRange(unit) == true) then
      targetUnitList = {unit}
    end
  elseif 2011 == targetId then
    local attackUid = fromUnit:GetAttackTargetUid()
    local attackTarget = BattleScene.GetUnitByUid(attackUid)
    if attackTarget then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnit(attackTarget, range_type, range_x, range_y, true)
      end
    end
  elseif 2012 == targetId then
    local attackUid = fromUnit:GetAttackTargetUid()
    local attackTarget = BattleScene.GetUnitByUid(attackUid)
    if attackTarget then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnit(attackTarget, range_type, range_x, range_y, true, nil, nil, false)
      end
    end
  elseif 2021 == targetId then
    targetUnitList = BattleChoose.GetUnitListBySide(basedCampObj, false)
  elseif 2022 == targetId then
    targetUnitList = BattleChoose.GetUnitListBySide(basedCampObj, false, nil, true, nil, tos[1].unitUid, nil, nil, false)
  elseif 2030 == targetId then
    if #tos > 0 and tos[1].unitUid then
      local unit = BattleScene.GetUnitByUid(tos[1].unitUid)
      targetUnitList = BattleChoose.GetNearestUnit(unit, false, nil, targetParam, nil, nil, nil, nil, BATTLE_UNIT_TYPE.MELEE_ATTACK)
    end
  elseif 2041 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type then
      if nil == fromUnit and tos[1] then
        fromUnit = BattleScene.GetUnitByUid(tos[1].unitUid)
      end
      if fromUnit then
        targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false)
      end
    end
  elseif 2050 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, targetParam)
  elseif 2061 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type then
      targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false, SKILL_DIRECTION.FRONT)
    end
  elseif 2062 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type then
      local excludedUid = fromUnit:GetAttackTargetUid()
      targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false, SKILL_DIRECTION.FRONT)
      for i, v in ipairs(targetUnitList) do
        if v.uid == excludedUid then
          table.remove(targetUnitList, i)
          break
        end
      end
    end
  elseif 2070 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, false, nil, targetParam, true)
  elseif 2080 == targetId then
    targetUnitList = BattleChoose.GetTopAtkUnitList(basedCampObj, false, targetParam, false)
  elseif 2090 == targetId then
    local attackTargetUid = fromUnit:GetAttackTargetUid()
    local target = BattleScene.GetUnitByUid(attackTargetUid)
    if target then
      targetUnitList = BattleChoose.GetNearestUnit(target, true, nil, targetParam)
    end
  elseif 2100 == targetId then
    local attackTargetUid = fromUnit:GetAttackTargetUid()
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, false, nil, targetParam, nil, nil, attackTargetUid)
  elseif 2110 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, false, nil, targetParam)
  elseif 2200 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, false, targetParam, true)
  elseif 2210 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, targetParam, nil, nil, nil, nil, BATTLE_UNIT_TYPE.MELEE_ATTACK)
  elseif 2301 == targetId then
    local tempList = BattleChoose.GetNearestUnit(fromUnit, false, nil, 1, true, nil, nil, true)
    if tempList[1] then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      targetUnitList = BattleScene.GetInRangeUnit(tempList[1], range_type, range_x, range_y, true)
    end
  elseif 2320 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1101)
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetRandomUnitList(nil, nil, targetParam, nil, nil, nil, nil, nil, tempList)
    end
  elseif 2331 == targetId then
    if fromUnit:GetAttackTargetUid() then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false)
      end
    end
  elseif 2341 == targetId then
    local uid = fromUnit:GetAttackTargetUid()
    if uid then
      local target = BattleScene.GetUnitByUid(uid)
      local direction = MathUtil.GetVector3Subtract(target.position, fromUnit.position)
      local unitList2
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false, nil, MathUtil.RotationWithY(direction, -45))
        unitList2 = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false, nil, MathUtil.RotationWithY(direction, 45))
      end
      for _, v in ipairs(unitList2) do
        local isFind = false
        for _, temp in ipairs(targetUnitList) do
          if v == temp then
            isFind = true
            break
          end
        end
        if false == isFind then
          table.insert(targetUnitList, v)
        end
      end
    end
  elseif 2351 == targetId then
    targetUnitList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1103)
    if #targetUnitList <= 0 then
      targetUnitList = BattleChoose.GetTopAtkUnitList(basedCampObj, false, targetParam)
    end
  elseif 2360 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, false, nil, targetParam, false)
  elseif 2370 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, targetParam)
  elseif 2380 == targetId then
    targetUnitList = BattleChoose.GetTopAtkSpdUnitList(basedCampObj, false, targetParam, false)
  elseif 2390 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, false, targetParam, false)
  elseif 2400 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, targetParam, {
      BATTLE_UNIT_TYPE.DEFENSE
    })
  elseif 2410 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, targetParam, {
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    })
  elseif 2420 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, targetParam, {
      BATTLE_UNIT_TYPE.SUPPORT
    })
  elseif 2430 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, targetParam, {
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    })
  elseif 2440 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1110)
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetRandomUnitList(nil, nil, targetParam, nil, nil, nil, nil, nil, tempList)
    else
      local uid = fromUnit:GetAttackTargetUid()
      local unit = BattleScene.GetUnitByUid(uid)
      if unit then
        targetUnitList = {unit}
      end
    end
  elseif 2451 == targetId then
    targetUnitList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1111)
  elseif 2461 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1111)
    if #tempList > 0 then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        local list = {}
        for _, v in ipairs(tempList) do
          list = BattleScene.GetInRangeUnit(v, range_type, range_x, range_y, true, nil, nil, false)
          for _, temp in ipairs(list) do
            if false == table.contain(targetUnitList, temp) then
              targetUnitList[#targetUnitList + 1] = temp
            end
          end
        end
      end
    end
  elseif 2471 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1111)
    if #tempList > 0 then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        local list = {}
        for _, v in ipairs(tempList) do
          list = BattleScene.GetInRangeUnit(v, range_type, range_x, range_y, true, nil, nil, true)
          for _, temp in ipairs(list) do
            if false == table.contain(targetUnitList, temp) then
              targetUnitList[#targetUnitList + 1] = temp
            end
          end
        end
      end
    end
  elseif 2481 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1113)
    if #tempList > 0 then
      targetUnitList = tempList
    else
      local uid = fromUnit:GetAttackTargetUid()
      local unit = BattleScene.GetUnitByUid(uid)
      if unit then
        targetUnitList = {unit}
      end
    end
  elseif 2490 == targetId then
    local gridList = BattleScene.GetAllGrid()
    local count = math.ceil(#gridList * targetParam / 10000)
    targetUnitList = BattleChoose.GetRandomGridList(count)
  elseif 2501 == targetId then
    local targetUnit = BattleScene.GetUnitByUid(tos[1].unitUid)
    if targetUnit then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnitWithCamp(targetUnit, range_type, range_x, range_y, fromUnit.enemyCamp)
      end
    end
  elseif 2511 == targetId then
    local targetUnit = BattleScene.GetUnitByUid(tos[1].unitUid)
    if targetUnit then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnitWithCamp(targetUnit, range_type, range_x, range_y, fromUnit.enemyCamp)
      end
    end
  elseif 2520 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1113, nil, true)
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetRandomUnitList(nil, nil, targetParam, nil, nil, nil, nil, nil, tempList)
    end
  elseif 2530 == targetId then
    for i = 1, targetParam do
      local tempList = BattleChoose.GetRandomUnitList(basedCampObj, false, 1)
      if 0 == #tempList then
        local gridList = BattleChoose.GetGridByRatio(basedCampObj.enemyCamp, 5000)
        tempList = BattleChoose.GetRandomUnitList(nil, nil, 1, nil, nil, nil, nil, nil, gridList)
      end
      table.insert(targetUnitList, tempList[1])
    end
  elseif 2540 == targetId then
    if fromUnit:GetAttackTargetUid() then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        local unitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false)
        if targetParam < #unitList then
          local centerUnit = unitList[1]
          table.remove(unitList, 1)
          unitList = BattleChoose.GetNearestUnit(fromUnit, false, nil, targetParam - 1, nil, nil, nil, nil, nil, unitList)
          table.insert(unitList, 1, centerUnit)
        end
        targetUnitList = unitList
      end
    end
  elseif 2551 == targetId then
    targetUnitList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1115)
  elseif 2561 == targetId then
    local allUnit = BattleChoose.GetAllSummonByUnit(basedCampObj)
    if allUnit and #allUnit > 0 then
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      targetUnitList = BattleScene.GetInRangeUnit(allUnit[1], range_type, range_x, range_y, false)
    end
  elseif 2570 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1116, nil, true)
    if 0 == #tempList then
      tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1117, nil, true)
    end
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetRandomUnitList(nil, nil, targetParam, nil, nil, nil, nil, nil, tempList)
    else
      targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, false, 1)
    end
  elseif 2580 == targetId then
    targetUnitList = BattleChoose.GetTopBuffEffectTagCountUnitList(basedCampObj, false, BUFF_EFFECT_TAG.PERSIST_DAMAGE, targetParam)
  elseif 2591 == targetId then
    local tempList = {}
    local enemyList = BattleChoose.GetUnitListBySide(basedCampObj, false)
    local curSkillTargetInfo = basedCampObj.curSkill.targetInfo or {}
    for _, v in ipairs(enemyList) do
      if v:IsAlive() then
        local _, effectList = BattleBuffMgr.GetContainedEffect(v, BUFF_EFFECT_ID.SANCTIONS)
        local distance = basedCampObj:GetCachedDistance(v)
        table.insert(tempList, {
          effectCount = #effectList,
          asTargetCount = curSkillTargetInfo[v.uid] or 0,
          unit = v,
          distance = distance
        })
      end
    end
    table.sort(tempList, function(a, b)
      if a.asTargetCount ~= b.asTargetCount then
        return a.asTargetCount < b.asTargetCount
      elseif a.effectCount ~= b.effectCount then
        return a.effectCount > b.effectCount
      else
        return a.distance < b.distance
      end
    end)
    if tempList[1] then
      targetUnitList = {
        tempList[1].unit
      }
    end
  elseif 2600 == targetId then
    local tempList = {}
    local enemyList = BattleChoose.GetUnitListBySide(basedCampObj, false)
    for _, v in ipairs(enemyList) do
      if v:IsAlive() then
        local buffCount = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(v, 1118, nil, true)
        table.insert(tempList, {
          buffCount = buffCount,
          unit = v,
          tempSort = BattleData.GetRandomSeed()
        })
      end
    end
    table.sort(tempList, function(a, b)
      if a.buffCount ~= b.buffCount then
        return a.buffCount < b.buffCount
      elseif a.tempSort ~= b.tempSort then
        return a.tempSort > b.tempSort
      else
        return a.unit.uid < b.unit.uid
      end
    end)
    for i = 1, targetParam do
      if tempList[i] then
        table.insert(targetUnitList, tempList[i].unit)
      end
    end
  elseif 2610 == targetId then
    local tempList = {}
    local enemyList = BattleChoose.GetUnitListBySide(basedCampObj, false)
    for _, v in ipairs(enemyList) do
      if v:IsAlive() then
        local buffCount = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(v, 1118, nil, true)
        if buffCount >= 1 then
          buffCount = 1
        end
        table.insert(tempList, {
          buffCount = buffCount,
          unit = v,
          tempSort = BattleData.GetRandomSeed()
        })
      end
    end
    table.sort(tempList, function(a, b)
      if a.buffCount ~= b.buffCount then
        return a.buffCount < b.buffCount
      elseif a.tempSort ~= b.tempSort then
        return a.tempSort > b.tempSort
      else
        return a.unit.uid < b.unit.uid
      end
    end)
    for i = 1, targetParam do
      if tempList[i] then
        table.insert(targetUnitList, tempList[i].unit)
      end
    end
  elseif 2621 == targetId then
    local attackTargetUid = fromUnit.attackTargetUid
    if attackTargetUid then
      local target = BattleScene.GetUnitByUid(attackTargetUid)
      if target and target:IsAlive() then
        targetUnitList = {target}
      else
        targetUnitList = BattleChoose.GetUnitFor2621(fromUnit)
      end
    else
      targetUnitList = BattleChoose.GetUnitFor2621(fromUnit)
    end
  elseif 2630 == targetId then
    local allGrid = BattleScene.GetAllGrid()
    local maxXCount = BattleScene.GetMapXCount()
    local gridList = {}
    for i, v in ipairs(allGrid) do
      if v.positionIndexX >= maxXCount - 1 then
        table.insert(gridList, v)
      end
    end
    local sortGridList = BattleChoose.GetRandomSort(gridList)
    if targetParam <= #sortGridList then
      if targetParam == #sortGridList then
        targetUnitList = sortGridList
      else
        for i = targetParam + 1, #sortGridList do
          sortGridList[i] = nil
        end
        targetUnitList = sortGridList
      end
    else
      targetUnitList = sortGridList
      local sortGridList2 = BattleChoose.GetRandomSort(gridList)
      local count = targetParam - #sortGridList
      for i = 1, count do
        table.insert(targetUnitList, sortGridList2[i])
      end
    end
  elseif 2640 == targetId then
    local tempList = BattleChoose.GetBuffMaxOverlayUnreachedCards(basedCampObj, false, 702)
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetTopAtkUnitList(nil, nil, targetParam, nil, nil, tempList)
    end
  elseif 2650 == targetId then
    local unitList = BattleChoose.GetUnitListBySide(basedCampObj, false, {
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    })
    targetUnitList = BattleChoose.GetTopAtkUnitList(nil, nil, targetParam, false, nil, unitList)
  elseif 2660 == targetId then
    local unitList = BattleChoose.GetUnitListBySide(basedCampObj, false, {
      BATTLE_UNIT_TYPE.SUPPORT
    })
    targetUnitList = BattleChoose.GetTopAtkUnitList(nil, nil, targetParam, false, nil, unitList)
  elseif 2670 == targetId then
    local unitList = BattleChoose.GetUnitListBySide(basedCampObj, false, {
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    })
    targetUnitList = BattleChoose.GetTopAtkUnitList(nil, nil, targetParam, false, nil, unitList)
  elseif 2680 == targetId then
    local units = BattleChoose.GetUnitListContainEffectTag(basedCampObj, false, BUFF_EFFECT_TAG.PERSIST_DAMAGE, nil, false)
    if targetParam <= #units then
      targetUnitList = BattleChoose.GetNearestUnit(basedCampObj, nil, nil, targetParam, nil, nil, nil, nil, nil, units)
    else
      local units_notContain = BattleChoose.GetUnitListContainEffectTag(basedCampObj, false, BUFF_EFFECT_TAG.PERSIST_DAMAGE, nil, true)
      local sortList = BattleChoose.GetNearestUnit(basedCampObj, nil, nil, targetParam - #units, nil, nil, nil, nil, nil, units_notContain)
      for i, v in ipairs(sortList) do
        table.insert(units, v)
      end
      targetUnitList = units
    end
  elseif 2691 == targetId then
    local unitList = BattleChoose.GetUnitListBySide(basedCampObj, false)
    for _, unit in ipairs(unitList) do
      if nil == unit.summonId and false == unit.isBuilding and unit:GetHp() < unit:GetAttr(ATTR_ENUM.max_hp) then
        table.insert(targetUnitList, unit)
      end
    end
  elseif 2700 == targetId then
    targetUnitList = BattleChoose.GetTopMoveSpdUnitList(basedCampObj, false, targetParam, true)
  elseif 2721 == targetId then
    local list = BattleChoose.GetUnitListBySide(basedCampObj, false)
    local notSummonList = BattleChoose.GetNotSummonUnit(list)
    local count = #notSummonList
    if count < 4 then
      targetUnitList = notSummonList
      if #notSummonList < #list then
        local summonList = BattleChoose.GetSummonUnit(list)
        local summonChooseCount = 4 - count
        local chooseSummonList = BattleChoose.GetRandomUnitList(nil, nil, summonChooseCount, nil, nil, nil, nil, nil, summonList)
        for _, v in ipairs(chooseSummonList) do
          table.insert(targetUnitList, v)
        end
      end
    elseif 4 == count then
      targetUnitList = notSummonList
    else
      local listByType = {}
      local typeList = {}
      for _, v in ipairs(notSummonList) do
        local unitType = v.battleUnitType
        if nil == listByType[unitType] then
          listByType[unitType] = {v}
          table.insert(typeList, {
            type = unitType,
            sort = BattleData.GetRandomSeed()
          })
        else
          table.insert(listByType[unitType], v)
        end
      end
      table.sort(typeList, function(a, b)
        return a.sort < b.sort
      end)
      while #targetUnitList < 4 do
        for _, typeInfo in ipairs(typeList) do
          local unitList = listByType[typeInfo.type]
          if #unitList > 1 then
            local randomIndex = math.ceil(#unitList * BattleData.GetRandomSeed() / 10000)
            table.insert(targetUnitList, unitList[randomIndex])
            table.remove(unitList, randomIndex)
            if 4 == #targetUnitList then
              break
            end
          elseif 1 == #unitList then
            table.insert(targetUnitList, unitList[1])
            listByType[typeInfo] = {}
            if 4 == #targetUnitList then
              break
            end
          end
        end
      end
    end
  elseif 2710 == targetId then
    local list = BattleChoose.GetUnitListBySide(basedCampObj, false, {
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    })
    if #list > 0 then
      for i = #list, 1, -1 do
        if BattleScene.IsTargetCounter(basedCampObj, list[i]) then
          table.remove(list, i)
        end
      end
      if #list > 0 then
        targetUnitList = BattleChoose.GetNearestUnit(basedCampObj, false, nil, targetParam, false, nil, nil, nil, nil, list)
      end
    end
  elseif 2791 == targetId then
    local allEnemy = BattleChoose.GetNearestUnit(basedCampObj, false, nil, nil, true, nil, nil, false)
    for _, enemy in ipairs(allEnemy) do
      if nil == enemy.summonId then
        targetUnitList = {enemy}
        break
      end
    end
  elseif 2801 == targetId then
    targetUnitList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1026)
    if #targetUnitList <= 0 then
      targetUnitList = BattleChoose.GetNearestUnit(basedCampObj, false, nil, 1)
    end
  elseif 2731 == targetId then
    local unitWith1127List = BattleBuffMgr.GetUnitListContainEffect(1127, basedCampObj.enemyCamp)
    local inRangeUnitList = {}
    if #unitWith1127List > 0 then
      for _, unit in ipairs(unitWith1127List) do
        range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
        if range_type then
          local tempUnitList = BattleScene.GetInRangeUnitWithCamp(unit, range_type, range_x, range_y, unit.camp, nil, nil, false)
          for _, tempUnit in ipairs(tempUnitList) do
            table.insert(inRangeUnitList, tempUnit)
          end
        end
      end
    end
    local unitWith1127 = {}
    local unitWithout1127 = {}
    for _, unit in ipairs(inRangeUnitList) do
      if BattleBuffMgr.ContainEffectId(unit, 1127) then
        table.insert(unitWith1127, unit)
      else
        table.insert(unitWithout1127, unit)
      end
    end
    if #unitWithout1127 > 0 then
      targetUnitList = unitWithout1127
    elseif #unitWith1127 > 0 and 0 == #unitWithout1127 then
      targetUnitList = unitWith1127
    else
      targetUnitList = BattleChoose.GetNearestUnit(basedCampObj, false, nil, 1, false)
    end
  elseif 2741 == targetId then
    local skillId = math.floor(skillLevelUpConfig.id / 1000)
    local count = basedCampObj:GetSkillAlreadyTriggerCount(skillId)
    local allGrid = BattleScene.GetAllGrid()
    if 0 == count % 2 then
      for _, grid in ipairs(allGrid) do
        if grid.positionIndexY <= 3 then
          table.insert(targetUnitList, grid)
        end
      end
    else
      local minY = BattleScene.GetMapYCount() - 2
      for _, grid in ipairs(allGrid) do
        if minY <= grid.positionIndexY then
          table.insert(targetUnitList, grid)
        end
      end
    end
    if #targetUnitList > 1 then
      targetUnitList = table.reverseTable(targetUnitList)
    end
  elseif 2750 == targetId then
    local tempList = {}
    local enemyList = BattleChoose.GetUnitListBySide(basedCampObj, false)
    for _, v in ipairs(enemyList) do
      if v:IsAlive() then
        local buffCount = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(v, 1127, nil, true)
        table.insert(tempList, {
          buffCount = buffCount,
          unit = v,
          tempSort = BattleData.GetRandomSeed()
        })
      end
    end
    table.sort(tempList, function(a, b)
      if a.buffCount ~= b.buffCount then
        return a.buffCount < b.buffCount
      elseif a.tempSort ~= b.tempSort then
        return a.tempSort > b.tempSort
      else
        return a.unit.uid < b.unit.uid
      end
    end)
    for i = 1, targetParam do
      if tempList[i] then
        table.insert(targetUnitList, tempList[i].unit)
      end
    end
  elseif 2761 == targetId then
    local unitWith1020List = BattleBuffMgr.GetUnitListContainEffect(1020, basedCampObj.enemyCamp)
    if #unitWith1020List > 0 then
      targetUnitList = unitWith1020List
    else
      local uids = basedCampObj.cachedSummonUids
      if #uids > 0 then
        local summonUnit = BattleScene.GetUnitByUid(uids[1])
        if summonUnit then
          range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
          if range_type then
            local tempUnitList = BattleScene.GetInRangeUnitWithCamp(summonUnit, range_type, range_x, range_y, fromUnit.enemyCamp)
            if #tempUnitList > 0 then
              targetUnitList = {
                BattleChoose.GetRandomUnitList(nil, nil, 1, nil, nil, nil, nil, nil, tempUnitList)
              }
            end
          end
        end
      end
    end
  elseif 2771 == targetId then
    local allEnemy = BattleChoose.GetNearestUnit(basedCampObj, false, nil, nil, true)
    for _, enemy in ipairs(allEnemy) do
      if nil == enemy.summonId then
        targetUnitList = {enemy}
        break
      end
    end
  elseif 2781 == targetId then
    targetUnitList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1026)
    if #targetUnitList <= 0 then
      targetUnitList = BattleChoose.GetNearestUnit(basedCampObj, false, nil, 1)
    end
  elseif 2810 == targetId then
    local tempList = {}
    local enemyList = BattleChoose.GetUnitListBySide(basedCampObj, false)
    for _, v in ipairs(enemyList) do
      if v:IsAlive() then
        local buffCount = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(v, 1030, nil, true)
        table.insert(tempList, {buffCount = buffCount, unit = v})
      end
    end
    if targetParam >= #tempList then
      for _, v in ipairs(tempList) do
        table.insert(targetUnitList, v.unit)
      end
    else
      local attackTargetUid = basedCampObj.attackTargetUid
      local attackTarget = attackTargetUid and BattleScene.GetUnitByUid(attackTargetUid)
      if not attackTarget or not attackTarget:IsAlive() then
        attackTarget = basedCampObj
      end
      for _, v in ipairs(tempList) do
        if v.unit.uid == attackTargetUid then
          v.tempSort = 999999
        else
          v.tempSort = attackTarget:GetCachedDistance(v.unit)
        end
      end
      table.sort(tempList, function(a, b)
        if a.buffCount ~= b.buffCount then
          return a.buffCount < b.buffCount
        elseif a.tempSort ~= b.tempSort then
          return a.tempSort < b.tempSort
        else
          return a.unit.uid < b.unit.uid
        end
      end)
      for i = 1, targetParam do
        if tempList[i] then
          table.insert(targetUnitList, tempList[i].unit)
        end
      end
    end
  elseif 3001 == targetId then
    targetUnitList = {fromUnit}
  elseif 3002 == targetId then
    targetUnitList = BattleChoose.GetUnitListBySide(basedCampObj, true, nil, nil, nil, nil, nil, nil, nil, chooseExtraParams)
  elseif 3003 == targetId then
    if #tos > 0 and tos[1].unitUid then
      local unit = BattleScene.GetUnitByUid(tos[1].unitUid)
      targetUnitList = BattleChoose.GetUnitListBySide(unit, true)
    end
  elseif 3004 == targetId then
    targetUnitList = BattleChoose.GetUnitListBySide(basedCampObj, true, nil, true, nil, nil, nil, nil, false)
  elseif 3005 == targetId then
    targetUnitList = BattleChoose.GetUnitListByType(basedCampObj, true, nil, {
      BATTLE_UNIT_TYPE.SUPPORT,
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    }, false, false)
  elseif 3006 == targetId then
    local list = BattleChoose.GetUnitListBySide(basedCampObj, true)
    targetUnitList = BattleChoose.GetNotSummonUnit(list)
  elseif 3007 == targetId then
    local leinixiyaUnit = BattleScene.GetUnitById(SPECIAL_CARD_OR_MONSTER.LEINIXIYA, basedCampObj.camp)
    local list = BattleChoose.GetUnitListBySide(basedCampObj, true, nil, true, nil, leinixiyaUnit and leinixiyaUnit.uid)
    targetUnitList = BattleChoose.GetNotSummonUnit(list)
  elseif 3008 == targetId then
    local shouhuzheUnit = BattleScene.GetUnitById(SPECIAL_CARD_OR_MONSTER.SHOUHUZHE, basedCampObj.camp)
    local list = BattleChoose.GetUnitListBySide(basedCampObj, true, nil, nil, nil, shouhuzheUnit and shouhuzheUnit.uid)
    targetUnitList = BattleChoose.GetNotSummonUnit(list)
  elseif 3010 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, true, targetParam, true)
  elseif 3020 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(basedCampObj, true, targetParam)
  elseif 3031 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type then
      targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, true)
    end
  elseif 3032 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type then
      targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, true, nil, nil, false)
    end
  elseif 3040 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, nil, targetParam, false, true)
  elseif 3050 == targetId then
    targetUnitList = BattleChoose.GetRandomUnitList(fromUnit, true, targetParam, {
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    })
  elseif 3060 == targetId then
    targetUnitList = BattleChoose.GetDyingUnitList(basedCampObj, true, targetParam, true)
  elseif 3070 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, nil, targetParam, false, true, nil, true)
  elseif 3081 == targetId then
    local list = BattleChoose.GetUnitListBySide(basedCampObj, true)
    targetUnitList = BattleChoose.GetSummonUnit(list)
  elseif 3082 == targetId then
    targetUnitList = BattleChoose.GetAllSummonBySide(basedCampObj.camp, true)
  elseif 3090 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1113, true, true)
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetRandomUnitList(nil, nil, targetParam, nil, nil, nil, nil, nil, tempList)
    end
  elseif 3100 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, true, targetParam, false, false)
  elseif 3110 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(basedCampObj, false, 1004, true, true, false)
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetRandomUnitList(nil, nil, targetParam, nil, nil, nil, nil, nil, tempList)
    end
  elseif 3120 == targetId then
    targetUnitList = BattleChoose.GetUnitsFor3120(basedCampObj, true, targetParam, false)
  elseif 3130 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, true, targetParam, true, false)
  elseif 3140 == targetId then
    local list = BattleChoose.GetUnitListBySide(basedCampObj, true)
    list = BattleChoose.GetSummonUnit(list)
    if #list > 0 then
      targetUnitList = BattleChoose.GetRandomUnitList(nil, nil, targetParam, nil, nil, nil, nil, nil, list)
    end
  elseif 3151 == targetId then
    targetUnitList = BattleChoose.GetAllSummonByUnit(basedCampObj)
  elseif 3152 == targetId then
    if #tos > 0 then
      local unitUid = tos[1].unitUid
      if unitUid then
        local unit = BattleScene.GetUnitByUid(unitUid)
        if unit then
          targetUnitList = BattleChoose.GetAllSummonByUnit(unit)
        end
      end
    end
  elseif 3160 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type then
      local list = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, true)
      targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, true, targetParam, true, nil, nil, list)
    end
  elseif 3171 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type and tos[1] then
      fromUnit = BattleScene.GetUnitByUid(tos[1].unitUid)
      if fromUnit then
        targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, true)
      end
    end
  elseif 3172 == targetId then
    range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
    if range_type and tos[1] then
      fromUnit = BattleScene.GetUnitByUid(tos[1].unitUid)
      if fromUnit then
        targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, true, nil, nil, false)
      end
    end
  elseif 3180 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, true, targetParam, true, true)
  elseif 3190 == targetId then
    targetUnitList = BattleChoose.GetTopAtkUnitList(basedCampObj, true, targetParam, false)
  elseif 3200 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, {
      BATTLE_UNIT_TYPE.DEFENSE,
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    }, targetParam, false, true)
  elseif 3210 == targetId then
    local tempList = BattleChoose.GetContainEffectIdCards(fromUnit, true, 605)
    if #tempList > 0 then
      targetUnitList = BattleChoose.GetTopHpUnitList(nil, nil, targetParam, true, nil, nil, tempList)
    end
  elseif 3220 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(fromUnit, true, targetParam, true, nil, {
      BATTLE_UNIT_TYPE.DEFENSE
    })
  elseif 3230 == targetId then
    targetUnitList = BattleChoose.GetTopHpUnitList(fromUnit, true, targetParam, true, nil, {
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    })
  elseif 3240 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, {
      BATTLE_UNIT_TYPE.SUPPORT
    }, targetParam, false, true)
    if 0 == #targetUnitList then
      targetUnitList = {fromUnit}
    end
  elseif 3250 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, {
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    }, targetParam, false, true)
  elseif 3260 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, {
      BATTLE_UNIT_TYPE.DEFENSE
    }, targetParam, false, true)
  elseif 3270 == targetId then
    targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, {
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    }, targetParam, false, true)
  elseif 3281 == targetId then
    targetUnitList = BattleChoose.GetUnitListBySide(fromUnit, true, {
      BATTLE_UNIT_TYPE.DEFENSE,
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    }, true)
  elseif 3291 == targetId then
    local burst = BattleScene.GetBurst(basedCampObj.camp)
    if burst then
      local waitList = burst.waitDealCardBurstSkillList
      for _, v in ipairs(waitList) do
        local uid = v.unitUid
        local unit = BattleScene.GetUnitByUid(uid)
        if unit and unit.uid ~= basedCampObj.uid then
          table.insert(targetUnitList, unit)
        end
      end
    end
  elseif targetId == 3301 then
    targetUnitList = BattleChoose.GetUnitListBySide(fromUnit, true, {
      BATTLE_UNIT_TYPE.MELEE_ATTACK,
      BATTLE_UNIT_TYPE.SUPPORT,
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    })
  elseif targetId == 3310 then
    local list = BattleChoose.GetUnitListBySide(fromUnit, true, {
      BATTLE_UNIT_TYPE.DEFENSE
    }, true)
    targetUnitList = BattleChoose.GetTopDefUnitList(nil, nil, targetParam, false, nil, list)
  elseif targetId == 3321 then
    targetUnitList = BattleChoose.GetContainEffectIdCards(basedCampObj, true, 421)
  elseif targetId == 3330 then
    targetUnitList = BattleChoose.GetTopHpUnitList(basedCampObj, true, targetParam, true, false, {
      BATTLE_UNIT_TYPE.MELEE_ATTACK,
      BATTLE_UNIT_TYPE.SUPPORT,
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    })
  elseif targetId == 4001 then
    local unitUid = tos[1].unitUid
    if unitUid then
      fromUnit = BattleScene.GetUnitByUid(unitUid)
      local uid = fromUnit:GetAttackTargetUid()
      local unit = BattleScene.GetUnitByUid(uid)
      if unit then
        targetUnitList = {unit}
      end
    end
  elseif targetId == 4002 then
    if chooseExtraParams and chooseExtraParams.targetUnitList then
      local list = chooseExtraParams.targetUnitList
      for _, v in ipairs(list) do
        if true == v:CanTargetChosen() then
          table.insert(targetUnitList, v)
        end
      end
    end
  elseif targetId == 4003 then
    local unitUid = tos[1].unitUid
    if unitUid then
      fromUnit = BattleScene.GetUnitByUid(unitUid)
      local lastDamageSelfUnitUid = fromUnit.lastDamageSelfUnitUid
      if lastDamageSelfUnitUid then
        local unit = BattleScene.GetUnitByUid(lastDamageSelfUnitUid)
        if unit then
          targetUnitList = {unit}
        end
      end
    end
  elseif targetId == 4010 then
    local unitUid = tos[1].unitUid
    if unitUid then
      fromUnit = BattleScene.GetUnitByUid(unitUid)
      targetUnitList = BattleChoose.GetNearestUnit(fromUnit, true, nil, targetParam, nil, true)
    end
  elseif targetId == 4021 then
    local unitUid = tos[1].unitUid
    if unitUid then
      fromUnit = BattleScene.GetUnitByUid(unitUid)
      range_type, range_x, range_y = BattleChoose.GetRangeInfo(skillLevelUpConfig, buffConfig, fromUnit)
      if range_type then
        targetUnitList = BattleScene.GetInRangeUnit(fromUnit, range_type, range_x, range_y, false)
      end
    end
  elseif targetId == 5001 then
    local uid = fromUnit.triggerTrapUid
    if uid then
      local target = BattleScene.GetUnitByUid(uid)
      targetUnitList = {target}
    end
  elseif targetId == 5002 then
    targetUnitList = BattleScene.GetInRangeUnit(fromUnit, BATTLE_RANGE_TYPE.CENTER_RECT, fromUnit.coverRadiusHalfW, fromUnit.coverRadiusHalfH, true)
  elseif targetId == 5003 then
    targetUnitList = BattleScene.GetInRangeUnit(fromUnit, BATTLE_RANGE_TYPE.CENTER_RECT, fromUnit.coverRadiusHalfW, fromUnit.coverRadiusHalfH, false)
  elseif targetId == 5004 then
    targetUnitList = BattleScene.GetInRangeUnit(fromUnit, BATTLE_RANGE_TYPE.CENTER_RECT, fromUnit.coverRadiusHalfW, fromUnit.coverRadiusHalfH, nil)
  elseif targetId == 7001 then
    if from.camp then
      targetCamp = from.camp
    elseif from.unitUid then
      targetCamp = fromUnit and fromUnit.camp
    end
  elseif targetId == 7002 then
    if from.camp == BATTLE_CAMP_FLAG.LEFT then
      targetCamp = BATTLE_CAMP_FLAG.RIGHT
    elseif from.camp == BATTLE_CAMP_FLAG.RIGHT then
      targetCamp = BATTLE_CAMP_FLAG.LEFT
    end
  elseif targetId == 8001 then
    if manuallySkill then
      targetUnitList = manuallySkill:GetInRangeUnit(manuallySkill.camp)
    end
  elseif targetId == 8002 and manuallySkill then
    targetUnitList = manuallySkill:GetInRangeUnit(manuallySkill.enemyCamp, true)
  end
  return targetUnitList, targetCamp
end

function BattleChoose.GetSkillTargetUnitList(from, tos, skillLevelUpConfig, chooseExtraParams)
  local target_type = skillLevelUpConfig.target_type
  return BattleChoose.GetTargetUnitList(target_type, from, tos, skillLevelUpConfig, nil, chooseExtraParams)
end

function BattleChoose.GetBuffTargetUnitList(from, tos, targetId, buffConfig, chooseExtraParams)
  return BattleChoose.GetTargetUnitList(targetId, from, tos, nil, buffConfig, chooseExtraParams)
end

function BattleChoose.GetNearestUnit(selfUnit, isSameSide, unitTypeList, numLimit, isReverse, notIncludeSelf, notIncludeUid, includeBuilding, notIncludeUnitType, unitList)
  unitList = unitList or BattleChoose.GetUnitListBySide(selfUnit, isSameSide, unitTypeList, notIncludeSelf, nil, notIncludeUid, notIncludeUnitType, nil, includeBuilding)
  if #unitList <= 1 then
    return unitList
  end
  local abs = math.abs
  local v
  for i = 1, #unitList do
    v = unitList[i]
    v.tempSortDis = selfUnit:GetCachedDistance(v)
    v.tempSortDisZ = abs(selfUnit.position.z - v.position.z)
  end
  local campLeft = BATTLE_CAMP_FLAG.LEFT
  local campRight = BATTLE_CAMP_FLAG.RIGHT
  local selfCamp = selfUnit.camp
  if true == isReverse then
    t_sort(unitList, function(a, b)
      if a.tempSortDis ~= b.tempSortDis then
        return a.tempSortDis > b.tempSortDis
      elseif a.tempSortDisZ ~= b.tempSortDisZ then
        return a.tempSortDisZ > b.tempSortDisZ
      elseif isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        end
      elseif false == isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        end
      end
    end)
  else
    t_sort(unitList, function(a, b)
      if a.tempSortDis ~= b.tempSortDis then
        return a.tempSortDis < b.tempSortDis
      elseif a.tempSortDisZ ~= b.tempSortDisZ then
        return a.tempSortDisZ < b.tempSortDisZ
      elseif isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        end
      elseif false == isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        end
      end
    end)
  end
  if numLimit then
    local count = #unitList
    for i = numLimit + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end

function BattleChoose.GetUnitFor2621(selfUnit)
  local campList = BattleScene.GetUnitListByCampDirect(selfUnit.enemyCamp)
  local unitList = {}
  local abs = math.abs
  local cachedDistance = selfUnit.cachedDistance
  local position = selfUnit.position
  for _, v in ipairs(campList) do
    if v:CanTargetChosen() == true then
      v.tempSortDis = cachedDistance[v.uid]
      v.tempSortDisZ = abs(position.z - v.position.z)
      unitList[#unitList + 1] = v
    end
  end
  if #unitList <= 1 then
    return unitList
  end
  local selfCamp = selfUnit.camp
  local campLeft = BATTLE_CAMP_FLAG.LEFT
  local campRight = BATTLE_CAMP_FLAG.RIGHT
  t_sort(unitList, function(a, b)
    if a.battleUnitType ~= b.battleUnitType then
      return a.battleUnitType > b.battleUnitType
    elseif a.tempSortDis ~= b.tempSortDis then
      return a.tempSortDis < b.tempSortDis
    elseif a.tempSortDisZ ~= b.tempSortDisZ then
      return a.tempSortDisZ < b.tempSortDisZ
    elseif selfCamp == campLeft then
      if a.positionIndexX == b.positionIndexX then
        return a.positionIndexY < b.positionIndexY
      else
        return a.positionIndexX < b.positionIndexX
      end
    elseif selfCamp == campRight then
      if a.positionIndexX == b.positionIndexX then
        return a.positionIndexY < b.positionIndexY
      else
        return a.positionIndexX > b.positionIndexX
      end
    end
  end)
  return {
    unitList[1]
  }
end

function BattleChoose.GetUnitForChooseMoveTarget(selfUnit)
  local campList = BattleScene.GetUnitListByCampDirect(selfUnit.enemyCamp)
  local unitList = {}
  local abs = math.abs
  local cachedDistance = selfUnit.cachedDistance
  local position = selfUnit.position
  for _, v in ipairs(campList) do
    if v:CanTargetChosen() == true then
      v.tempSortDis = cachedDistance[v.uid]
      v.tempSortDisZ = abs(position.z - v.position.z)
      unitList[#unitList + 1] = v
    end
  end
  if #unitList <= 1 then
    return unitList
  end
  local selfCamp = selfUnit.camp
  local campLeft = BATTLE_CAMP_FLAG.LEFT
  local campRight = BATTLE_CAMP_FLAG.RIGHT
  t_sort(unitList, function(a, b)
    if a.tempSortDis ~= b.tempSortDis then
      return a.tempSortDis < b.tempSortDis
    elseif a.tempSortDisZ ~= b.tempSortDisZ then
      return a.tempSortDisZ < b.tempSortDisZ
    elseif selfCamp == campLeft then
      if a.positionIndexX == b.positionIndexX then
        return a.positionIndexY < b.positionIndexY
      else
        return a.positionIndexX < b.positionIndexX
      end
    elseif selfCamp == campRight then
      if a.positionIndexX == b.positionIndexX then
        return a.positionIndexY < b.positionIndexY
      else
        return a.positionIndexX > b.positionIndexX
      end
    end
  end)
  return unitList
end

function BattleChoose.GetUnitListBySide(atkUnit, isSameSide, unitTypeList, notIncludeSelf, elementType, notIncludeUid, notIncludeUnitType, includeDying, includeBuilding, chooseExtraParams)
  local returnUnitList = {}
  local unitList
  if nil == isSameSide then
    unitList = BattleScene.GetAllAliveUnit()
  elseif true == isSameSide then
    unitList = BattleScene.GetUnitListByCampDirect(atkUnit.camp)
  elseif false == isSameSide then
    unitList = BattleScene.GetUnitListByCampDirect(atkUnit.enemyCamp)
  end
  local index = 1
  local v
  for i = 1, #unitList do
    v = unitList[i]
    if (not notIncludeSelf or v.uid ~= atkUnit.uid) and (false ~= includeBuilding or true ~= v.isBuilding) and (includeBuilding or true ~= isSameSide or true ~= v.isBuilding) and (true == includeDying and false == v:IsDestroy() or true == v:CanTargetChosen(chooseExtraParams)) and v.uid ~= notIncludeUid and (nil == elementType or table.contain(v.elementTypes, elementType)) and v.battleUnitType ~= notIncludeUnitType and (nil == unitTypeList or table.contain(unitTypeList, v.battleUnitType)) then
      returnUnitList[index] = v
      index = index + 1
    end
  end
  return returnUnitList
end

function BattleChoose.GetTopAtkSpdUnitList(atkUnit, isSameSide, topNum, isReverse, notIncludeSelf)
  local unitList = BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf)
  if #unitList <= 1 then
    return unitList
  end
  for i = 1, #unitList do
    unitList[i].tempSort = BattleData.GetRandomSeed()
  end
  local spd_a, spd_b
  t_sort(unitList, function(a, b)
    spd_a = a:GetSpdAtk()
    spd_b = b:GetSpdAtk()
    if spd_a == spd_b then
      return a.tempSort < b.tempSort
    elseif isReverse then
      return spd_a < spd_b
    else
      return spd_a > spd_b
    end
  end)
  if topNum then
    local count = #unitList
    for i = topNum + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end

function BattleChoose.GetTopHpUnitList(atkUnit, isSameSide, topNum, isReverse, notIncludeSelf, unitTypeList, listForChoose)
  local unitList = listForChoose or BattleChoose.GetUnitListBySide(atkUnit, isSameSide, unitTypeList, notIncludeSelf)
  if false ~= isSameSide then
    for i = #unitList, 1, -1 do
      if unitList[i].summonId ~= nil then
        table.remove(unitList, i)
      end
    end
  end
  if #unitList <= 1 then
    return unitList
  end
  for i = 1, #unitList do
    unitList[i].tempSort = BattleData.GetRandomSeed()
  end
  t_sort(unitList, function(a, b)
    if a.tempHpPer == b.tempHpPer then
      return a.tempSort < b.tempSort
    elseif isReverse then
      return a.tempHpPer < b.tempHpPer
    else
      return a.tempHpPer > b.tempHpPer
    end
  end)
  if topNum then
    local count = #unitList
    for i = topNum + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end

function BattleChoose.GetMinHpPerUnit(atkUnit, battleUnitType)
  local returnUnit
  local unitList = BattleScene.GetUnitListByCampDirect(atkUnit.camp)
  local v
  for i = 1, #unitList do
    v = unitList[i]
    if v.isBuilding == false and v.summonId == nil and v.tempHpPer > 0 and (nil == battleUnitType or battleUnitType == v.battleUnitType) then
      if nil == returnUnit then
        returnUnit = v
      elseif v.tempHpPer < returnUnit.tempHpPer then
        returnUnit = v
      end
    end
  end
  return returnUnit
end

function BattleChoose.GetTopAtkUnitList(atkUnit, isSameSide, topNum, isReverse, notIncludeSelf, unitList)
  unitList = unitList or BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf)
  if #unitList <= 1 then
    return unitList
  end
  for i = 1, #unitList do
    unitList[i].tempSort = BattleData.GetRandomSeed()
  end
  local atkA, atkB
  t_sort(unitList, function(a, b)
    atkA = a:GetAttr(ATTR_ENUM.atk)
    atkB = b:GetAttr(ATTR_ENUM.atk)
    if atkA == atkB then
      return a.tempSort < b.tempSort
    elseif isReverse then
      return atkA < atkB
    else
      return atkA > atkB
    end
  end)
  if topNum then
    local count = #unitList
    for i = topNum + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end

function BattleChoose.GetTopMoveSpdUnitList(atkUnit, isSameSide, topNum, isReverse, notIncludeSelf, unitList)
  unitList = unitList or BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf)
  if #unitList <= 1 then
    return unitList
  end
  for i = 1, #unitList do
    unitList[i].tempSort = BattleData.GetRandomSeed()
  end
  local moveSpdA, moveSpdB
  t_sort(unitList, function(a, b)
    moveSpdA = a:GetSpdMove()
    moveSpdB = b:GetSpdMove()
    if moveSpdA == moveSpdB then
      return a.tempSort < b.tempSort
    elseif isReverse then
      return moveSpdA < moveSpdB
    else
      return moveSpdA > moveSpdB
    end
  end)
  if topNum then
    local count = #unitList
    for i = topNum + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end

function BattleChoose.GetTopDefUnitList(atkUnit, isSameSide, topNum, isReverse, notIncludeSelf, unitList)
  unitList = unitList or BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf)
  if #unitList <= 1 then
    return unitList
  end
  for i = 1, #unitList do
    unitList[i].tempSort = BattleData.GetRandomSeed()
  end
  local defA, defB
  t_sort(unitList, function(a, b)
    defA = a:GetAttr(ATTR_ENUM.def)
    defB = b:GetAttr(ATTR_ENUM.def)
    if defA == defB then
      return a.tempSort < b.tempSort
    elseif isReverse then
      return defA < defB
    else
      return defA > defB
    end
  end)
  if topNum then
    local count = #unitList
    for i = topNum + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end

function BattleChoose.GetSummonUnit(unitList)
  local list = {}
  local v
  for i = 1, #unitList do
    v = unitList[i]
    if v.summonId then
      list[#list + 1] = v
    end
  end
  return list
end

function BattleChoose.GetNotSummonUnit(unitList)
  local list = {}
  local v
  for i = 1, #unitList do
    v = unitList[i]
    if v.summonId == nil then
      list[#list + 1] = v
    end
  end
  return list
end

function BattleChoose.GetSameCampCardListWithHp(unit)
  local unitList = {}
  local allUnitList = BattleScene.GetUnitListByCampDirect(unit.camp)
  for i, v in ipairs(allUnitList) do
    if v.uid ~= unit.uid and v:IsAlive() and v.isBuilding == false and v.haveHp then
      table.insert(unitList, v)
    end
  end
  return unitList
end

function BattleChoose.GetDyingUnitList(atkUnit, isSameSide, num, notIncludeSelf)
  local allUnitList = BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf, nil, nil, nil, true)
  if #allUnitList <= 1 then
    return allUnitList
  end
  local count = #allUnitList
  local unit
  for i = count, 1, -1 do
    unit = allUnitList[i]
    if unit:IsDying() == true then
      unit.tempSort = BattleData.GetRandomSeed()
    else
      table.remove(allUnitList, i)
    end
  end
  t_sort(allUnitList, function(a, b)
    return a.tempSort < b.tempSort
  end)
  if num then
    for i = num + 1, count do
      allUnitList[i] = nil
    end
  end
  return allUnitList
end

function BattleChoose.GetUnitListByType(atkUnit, isSameSide, sortFunc, unitTypeList, findStop, includeBuilding)
  local returnUnitList = {}
  local unitList
  if nil == isSameSide then
    unitList = BattleScene.GetAllAliveUnit()
  elseif true == isSameSide then
    unitList = BattleScene.GetUnitListByCampDirect(atkUnit.camp)
  elseif false == isSameSide then
    unitList = BattleScene.GetUnitListByCampDirect(atkUnit.enemyCamp)
  end
  local oneTypeList, v
  for i = 1, #unitTypeList do
    oneTypeList = {}
    for j = 1, #unitList do
      v = unitList[j]
      if includeBuilding or (true ~= isSameSide or true ~= v.isBuilding) and v.battleUnitType == unitTypeList[i] and v:CanTargetChosen() then
        oneTypeList[#oneTypeList + 1] = v
      end
    end
    if #oneTypeList > 0 then
      if sortFunc then
        t_sort(oneTypeList, sortFunc)
      end
      for k = 1, #oneTypeList do
        returnUnitList[#returnUnitList + 1] = oneTypeList[k]
      end
      if true == findStop then
        break
      end
    end
  end
  return returnUnitList
end

function BattleChoose.GetRandomUnitList(atkUnit, isSameSide, randomNum, unitTypeList, notIncludeSelf, elementType, notIncludeUid, notIncludeUnitType, cardsList)
  if BattleChoose.onlyChoosePos == true then
    return {}
  end
  local unitList = cardsList or BattleChoose.GetUnitListBySide(atkUnit, isSameSide, unitTypeList, notIncludeSelf, elementType, notIncludeUid, notIncludeUnitType)
  if #unitList <= 1 then
    return unitList
  end
  for i = 1, #unitList do
    unitList[i].tempSort = BattleData.GetRandomSeed()
  end
  t_sort(unitList, function(a, b)
    return a.tempSort < b.tempSort
  end)
  if randomNum then
    local count = #unitList
    for i = randomNum + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end

function BattleChoose.GetUnitListForUnit10064(camp)
  local campAllUnitList = BattleScene.GetUnitListByCampDirect(camp)
  local availableUnitList = {}
  for _, unit in ipairs(campAllUnitList) do
    if unit.haveHp and unit:IsAlive() then
      table.insert(availableUnitList, {
        unit = unit,
        tempRandom = BattleData.GetRandomSeed(),
        tempHpIsFull = unit:GetHp() >= unit:GetAttr(ATTR_ENUM.max_hp) and 1 or 0
      })
    end
  end
  table.sort(availableUnitList, function(a, b)
    if a.tempHpIsFull == b.tempHpIsFull then
      return a.tempRandom < b.tempRandom
    else
      return a.tempHpIsFull < b.tempHpIsFull
    end
  end)
  return availableUnitList[1]
end

function BattleChoose.GetGridByRatio(camp, ratio)
  local list = {}
  local gridList = BattleScene.GetGridListByCamp(camp)
  if ratio > 1 then
    ratio = ratio / 10000
  end
  local firstGrid = gridList[1]
  local lastGrid = gridList[#gridList]
  local totalX = lastGrid.positionIndexX - firstGrid.positionIndexX
  local totalY = lastGrid.positionIndexY - firstGrid.positionIndexY
  local centerIndexX = firstGrid.positionIndexX + totalX / 2
  local centerIndexY = firstGrid.positionIndexY + totalY / 2
  local minX = centerIndexX - totalX * ratio / 2
  local maxX = centerIndexX + totalX * ratio / 2
  local minY = centerIndexY - totalY * ratio / 2
  local maxY = centerIndexY + totalY * ratio / 2
  for _, grid in ipairs(gridList) do
    if minX <= grid.positionIndexX and maxX >= grid.positionIndexX and minY <= grid.positionIndexY and maxY >= grid.positionIndexY then
      table.insert(list, grid)
    end
  end
  return list
end

function BattleChoose.GetBuffMaxOverlayUnreachedCards(atkUnit, isSameSide, effectId, notIncludeSelf)
  local cards = {}
  local cardList = BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf)
  local contain, v, effectList, buffList, overlayMax
  for i = 1, #cardList do
    v = cardList[i]
    contain, effectList, buffList = BattleBuffMgr.GetContainedEffect(v, effectId, nil, true)
    if contain then
      if nil == overlayMax then
        overlayMax = buffList[1].buffConfig.overlay_num
      end
      local curCount = 0
      for _, buff in ipairs(buffList) do
        curCount = curCount + (buff.overlayNum or 1)
      end
      if overlayMax > curCount then
        cards[#cards + 1] = v
      end
    else
      cards[#cards + 1] = v
    end
  end
  return cards
end

function BattleChoose.GetContainEffectIdCards(atkUnit, isSameSide, effectId, notIncludeSelf, reverse, includeBuilding)
  local cards = {}
  local cardList = BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf, nil, nil, nil, nil, includeBuilding)
  local contain, v
  for i = 1, #cardList do
    v = cardList[i]
    contain = BattleBuffMgr.ContainEffectId(v, effectId)
    if reverse then
      if false == contain then
        cards[#cards + 1] = v
      end
    elseif contain then
      cards[#cards + 1] = v
    end
  end
  return cards
end

function BattleChoose.GetUnitListContainEffectTag(atkUnit, isSameSide, tag, notIncludeSelf, isReverse)
  local unitList = BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf)
  local units = {}
  for i, v in ipairs(unitList) do
    if true ~= isReverse and v:ContainBuffEffectTag(tag) or true == isReverse and v:ContainBuffEffectTag(tag) == false then
      table.insert(units, v)
    end
  end
  return units
end

function BattleChoose.GetTopBuffEffectTagCountUnitList(atkUnit, isSameSide, tag, number, notIncludeSelf)
  local units = {}
  local unitList = BattleChoose.GetUnitListBySide(atkUnit, isSameSide, nil, notIncludeSelf)
  local v
  for i = 1, #unitList do
    v = unitList[i]
    v.tempSort = BattleBuffMgr.GetBuffCountByUnitAndTag(v, tag)
    v.tempSortDis = atkUnit.cachedDistance[v.uid]
    v.tempSortDisZ = math.abs(atkUnit.position.z - v.position.z)
  end
  table.sort(unitList, function(a, b)
    if a.tempSort == b.tempSort then
      if a.tempSortDis ~= b.tempSortDis then
        return a.tempSortDis < b.tempSortDis
      elseif a.tempSortDisZ ~= b.tempSortDisZ then
        return a.tempSortDisZ < b.tempSortDisZ
      end
    else
      return a.tempSort > b.tempSort
    end
  end)
  local max = math.min(number, #unitList)
  for i = 1, max do
    table.insert(units, unitList[i])
  end
  return units
end

function BattleChoose.GetRandomSort(list)
  if nil == list or #list <= 1 then
    return SimpleCopy(list)
  end
  local sortList = {}
  local tempList = {}
  for i, v in ipairs(list) do
    table.insert(tempList, {
      index = i,
      random = BattleData.GetRandomSeed(),
      unit = v
    })
  end
  table.sort(tempList, function(a, b)
    if a.random == b.random then
      return a.index < b.index
    else
      return a.random < b.random
    end
  end)
  for i = 1, #tempList do
    sortList[i] = tempList[i].unit
  end
  return sortList
end

function BattleChoose.GetRandomGridList(randomNum)
  local gridList = {}
  local allGrid = BattleScene.GetAllGrid()
  if randomNum >= #allGrid then
    return SimpleCopy(allGrid)
  end
  local sortList = {}
  for i, v in ipairs(allGrid) do
    table.insert(sortList, {
      index = i,
      random = BattleData.GetRandomForChooseGrid(),
      grid = v
    })
  end
  table.sort(sortList, function(a, b)
    if a.random == b.random then
      return a.index < b.index
    else
      return a.random < b.random
    end
  end)
  for i = 1, randomNum do
    gridList[i] = sortList[i].grid
  end
  return gridList
end

function BattleChoose.GetAllSummonByUnit(unit)
  local summonList = {}
  local sameCampUnitList = BattleScene.GetUnitListByCampDirect(unit.camp)
  for i, v in ipairs(sameCampUnitList) do
    if v.summonId and v.summonFromUnit == unit.uid and v:IsAlive() then
      table.insert(summonList, v)
    end
  end
  return summonList
end

function BattleChoose.GetAllSummonBySide(camp, includeBuilding)
  local summonList = {}
  local sameCampUnitList = BattleScene.GetUnitListByCampDirect(camp)
  for i, v in ipairs(sameCampUnitList) do
    if v.summonId and v:IsAlive() and (v.isBuilding and includeBuilding or v.isBuilding == false) then
      table.insert(summonList, v)
    end
  end
  return summonList
end

function BattleChoose.GetBulletHurtUnitList(bullet)
  local unitList = {}
  if bullet then
    local enemyCamp = bullet.enemyCamp
    local enemyUnitList = BattleScene.GetUnitListByCamp(enemyCamp)
    local hurtUidList = bullet.hurtUidList
    for _, unit in ipairs(enemyUnitList) do
      if hurtUidList[unit.uid] == nil and bullet:IsTargetInMoveRange(unit) then
        table.insert(unitList, unit)
      end
    end
  end
  return unitList
end

function BattleChoose.GetUnitsFor3120(selfUnit, isSameSide, numLimit, isReverse)
  local unitList = BattleChoose.GetUnitListBySide(selfUnit, isSameSide, nil, true, nil, nil, nil, nil, false)
  if #unitList < 1 then
    return {}
  end
  for i = #unitList, 1, -1 do
    local unit = unitList[i]
    if unit.haveRage == false then
      table.remove(unitList, i)
    end
  end
  if #unitList < 1 then
    return {}
  end
  local abs = math.abs
  local v
  for i = 1, #unitList do
    v = unitList[i]
    v.tempSortDis = selfUnit.cachedDistance[v.uid]
    v.tempSortDisZ = abs(selfUnit.position.z - v.position.z)
  end
  local campLeft = BATTLE_CAMP_FLAG.LEFT
  local campRight = BATTLE_CAMP_FLAG.RIGHT
  local selfCamp = selfUnit.camp
  if true == isReverse then
    t_sort(unitList, function(a, b)
      if a.tempSortDis ~= b.tempSortDis then
        return a.tempSortDis > b.tempSortDis
      elseif a.tempSortDisZ ~= b.tempSortDisZ then
        return a.tempSortDisZ > b.tempSortDisZ
      elseif isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        end
      elseif false == isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY > b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        end
      end
    end)
  else
    t_sort(unitList, function(a, b)
      if a.tempSortDis ~= b.tempSortDis then
        return a.tempSortDis < b.tempSortDis
      elseif a.tempSortDisZ ~= b.tempSortDisZ then
        return a.tempSortDisZ < b.tempSortDisZ
      elseif isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        end
      elseif false == isSameSide then
        if selfCamp == campLeft then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX < b.positionIndexX
          end
        elseif selfCamp == campRight then
          if a.positionIndexX == b.positionIndexX then
            return a.positionIndexY < b.positionIndexY
          else
            return a.positionIndexX > b.positionIndexX
          end
        end
      end
    end)
  end
  if numLimit then
    local count = #unitList
    for i = numLimit + 1, count do
      unitList[i] = nil
    end
  end
  return unitList
end
