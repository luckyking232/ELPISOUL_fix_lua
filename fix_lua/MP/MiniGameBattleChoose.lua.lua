MiniGameBattleChoose = {}

function MiniGameBattleChoose.InitLocalVar()
end

function MiniGameBattleChoose.GetTargetUnitList(targetId, from, tos, skillConfig, buffConfig, chooseExtraParams)
  local targetUnitList = {}
  if 1000 == targetId then
    for i, v in ipairs(tos) do
      if v.unitUid then
        table.insert(targetUnitList, MiniGameBattleSceneMgr.GetUnitByUid(v.unitUid))
      end
    end
  elseif 1001 == targetId then
    targetUnitList = {
      MiniGameBattleSceneMgr.GetUnitByUid(chooseExtraParams.triggerFromUnitUid)
    }
  elseif 2001 == targetId then
    local range = chooseExtraParams.range
    targetUnitList = MiniGameBattleChoose.GetInRangeMonsterByPosition(chooseExtraParams.centerPosition, 1, range, range)
  elseif 3001 == targetId then
    targetUnitList = {
      MiniGameBattleSceneMgr.GetUnitByUid(from.unitUid)
    }
  elseif 3003 == targetId then
    targetUnitList = {
      MiniGameBattleScene.wallUnit
    }
  elseif 3004 == targetId then
    targetUnitList = SimpleCopy(MiniGameBattleScene.cardList)
  end
  return targetUnitList
end

function MiniGameBattleChoose.GetSkillTargetUnitList(from, tos, skillConfig, chooseExtraParams)
  return MiniGameBattleChoose.GetTargetUnitList(skillConfig.target_type, from, tos, skillConfig, nil, chooseExtraParams)
end

function MiniGameBattleChoose.GetBuffTargetUnitList(from, tos, targetId, buffConfig, chooseExtraParams)
  return MiniGameBattleChoose.GetTargetUnitList(targetId, from, tos, nil, buffConfig, chooseExtraParams)
end

function MiniGameBattleChoose.GetNearestMonsterForCenterUnit(centerUnit, numLimit, notIncludeUidList)
  local list = {}
  numLimit = numLimit or 1
  local monsterList = SimpleCopy(MiniGameBattleScene.aliveMonsterList)
  if #monsterList > 0 then
    table.sort(monsterList, function(a, b)
      local disA = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(a.position, centerUnit.position))
      local disB = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(b.position, centerUnit.position))
      if disA == disB then
        return a.position.x < b.position.x
      else
        return disA < disB
      end
    end)
    for _, v in ipairs(monsterList) do
      if nil == notIncludeUidList or table.contain(notIncludeUidList, v.uid) == false then
        table.insert(list, v)
        if numLimit <= #list then
          break
        end
      end
    end
  end
  return list
end

function MiniGameBattleChoose.GetNearestMonster(numLimit, notIncludeUidList)
  local list = {}
  numLimit = numLimit or 1
  local monsterList = SimpleCopy(MiniGameBattleScene.aliveMonsterList)
  if #monsterList > 0 then
    table.sort(monsterList, function(a, b)
      if a.position.x == b.position.x then
        return a.position.y > b.position.y
      else
        return a.position.x < b.position.x
      end
    end)
    for _, v in ipairs(monsterList) do
      if nil == notIncludeUidList or table.contain(notIncludeUidList, v.uid) == false then
        table.insert(list, v)
        if numLimit <= #list then
          break
        end
      end
    end
  end
  return list
end

function MiniGameBattleChoose.GetOneFarthestMonster()
  local monsterList = SimpleCopy(MiniGameBattleScene.aliveMonsterList)
  if #monsterList > 0 then
    table.sort(monsterList, function(a, b)
      if a.position.x == b.position.x then
        return a.position.y > b.position.y
      else
        return a.position.x > b.position.x
      end
    end)
    return monsterList[1]
  end
end

function MiniGameBattleChoose.GetRandomMonster()
  local aliveMonsterList = MiniGameBattleScene.aliveMonsterList
  if #aliveMonsterList > 0 then
    local random = MiniGameBattleMgr.GetRandomNum(1, #aliveMonsterList)
    return aliveMonsterList[random]
  end
end

function MiniGameBattleChoose.GetInRangeMonster(centerUnit, rangeType, rangeX, rangeY)
  local inRangeMonster = MiniGameBattleChoose.GetInRangeMonsterByPosition(centerUnit.position, rangeType, rangeX, rangeY)
  return inRangeMonster
end

function MiniGameBattleChoose.GetInRangeMonsterByPosition(centerPosition, rangeType, rangeX, rangeY, targetPosition)
  local inRangeMonster = {}
  local aliveMonsterList = MiniGameBattleScene.aliveMonsterList
  for i = 1, #aliveMonsterList do
    local v = aliveMonsterList[i]
    if MiniGameBattleChoose.IsTargetInRange(centerPosition, v, rangeType, rangeX, rangeY, targetPosition) then
      table.insert(inRangeMonster, v)
    end
  end
  return inRangeMonster
end

function MiniGameBattleChoose.IsTargetInRange(centerPosition, tempUnit, rangeType, rangeX, rangeY, targetPosition)
  if rangeType == BATTLE_RANGE_TYPE.CIRCLE then
    local dis = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(tempUnit.position, centerPosition)) - tempUnit.coverRadiusR
    return rangeX >= dis
  elseif rangeType == BATTLE_RANGE_TYPE.RECT_SELF_2_TARGET then
    local endPosition = targetPosition
    local tempPosition = tempUnit.position
    local h = MathUtil.GetDistanceToLine(tempPosition, centerPosition, endPosition)
    if h > tempUnit.coverRadiusR + rangeY / 2 then
      return false
    end
    local targetV = MathUtil.GetVector3Subtract(tempPosition, centerPosition)
    local directV = MathUtil.GetVector3Subtract(endPosition, centerPosition)
    local projection = MathUtil.GetProjection(targetV, directV)
    local m_projection = MathUtil.GetVector3Module(projection)
    local dot = MathUtil.GetVector3Dot(targetV, directV)
    if dot > 0 then
      return rangeX >= m_projection - tempUnit.coverRadiusR
    elseif dot < 0 then
      return m_projection - tempUnit.coverRadiusR <= 0
    elseif 0 == dot then
      return true
    end
  end
end
