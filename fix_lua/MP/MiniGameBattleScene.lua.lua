function InitMiniGameBattleScene()
  ClearMiniGameBattleScene()
  
  local ceilLength = MiniGameBattleScene.ceilLength
  local stageConfig = MiniGameBattleData.stageConfig
  if stageConfig then
    local sizeX = stageConfig.size[1]
    local sizeY = stageConfig.size[2]
    MiniGameBattleScene.mapXCount = sizeX
    MiniGameBattleScene.mapYCount = sizeY
    MiniGameBattleScene.initX = -sizeX * ceilLength / 2
    MiniGameBattleScene.initY = sizeY * ceilLength / 2 + MiniGameBattleScene.initY_offset
    MiniGameBattleScene.minY = MiniGameBattleScene.initY - sizeY * ceilLength
    MiniGameBattleScene.maxY = MiniGameBattleScene.initY
    local _mapArray = {}
    local _allGird = {}
    local _gridByUid = {}
    local _gridUnitGlobalIndex = 0
    for i = 1, sizeX do
      _mapArray[i] = {}
      for j = 1, sizeY do
        _mapArray[i][j] = {}
        local grid = MiniGameBattleUnit.NewUnit({
          uid = _gridUnitGlobalIndex,
          isGrid = true,
          positionIndexX = i,
          positionIndexY = j,
          positionIndex = i * 100 + j
        })
        table.insert(_allGird, grid)
        _gridByUid[_gridUnitGlobalIndex] = grid
        _gridUnitGlobalIndex = _gridUnitGlobalIndex + 1
      end
    end
    MiniGameBattleScene.mapArray = _mapArray
    MiniGameBattleScene.allGird = _allGird
    MiniGameBattleScene.gridByUid = _gridByUid
  end
  local callback = function()
    MiniGameBattleSceneMgr.InitBg()
    MiniGameBattleSceneMgr.InitUI()
    MiniGameBattleHurtNum.Init()
    MiniGameBattleSceneMgr.InitUnit()
  end
  UIUtil.ChangeBattleScreenEffectIn(callback)
end

function ClearMiniGameBattleScene()
  MiniGameBattleScene = {
    isBattleWin = false,
    isBattleLoss = false,
    mapArray = {},
    mapXCount = 0,
    mapYCount = 0,
    initX = 0,
    initY = 0,
    initY_offset = 75,
    minX = 0,
    minY = 0,
    maxX = 0,
    maxY = 0,
    space = 0,
    ceilLength = 40,
    pixelsPerUnit = 75,
    allGird = {},
    gridByUid = {},
    bulletGlobalIndex = 1,
    bulletByUid = {},
    allBullet = {},
    unitGlobalIndex = 10000,
    gridUnitGlobalIndex = 1,
    allUnit = {},
    allAliveUnit = {},
    unitByUid = {},
    cardList = {},
    aliveMonsterList = {},
    cardSummonList = {},
    wallUnit = nil,
    curMonsterGroupIndex = 0,
    allMonsterCreate = false,
    normalMonsterGroup = {},
    loopMonsterGroup = {},
    curIndexInGroup = 0,
    addHpPer = 0,
    addExpPer = 0,
    curMonsterList = {},
    nextMonsterCreateTimeWait = 0,
    monsterCreateIntervalFrame = 6,
    curMonsterWave = 1,
    lastMonsterPositionIndex = 0,
    isLoopStage = false,
    cachedMonsterGroupTime = 0
  }
end

MiniGameBattleSceneMgr = {}

function MiniGameBattleSceneMgr.InitBg()
  MiniGameBattleBackground.Init()
end

function MiniGameBattleSceneMgr.InitUI()
  if UIMgr:IsWindowOpen(WinResConfig.MiniGameBattleUIWindow.name) == false then
    OpenWindow(WinResConfig.MiniGameBattleUIWindow.name)
  end
end

function MiniGameBattleSceneMgr.InitUnit()
  MiniGameBattleScene.unitGlobalIndex = 10000
  MiniGameBattleScene.gridUnitGlobalIndex = 1
  local stageConfig = MiniGameBattleData.stageConfig
  if stageConfig then
    local cardIds = stageConfig.card_id
    local cardPos = stageConfig.card_pos
    for i, cardId in ipairs(cardIds) do
      local pos = cardPos[i]
      local unit = MiniGameBattleSceneMgr.AddUnit({
        id = cardId,
        positionIndex = pos,
        positionIndexX = pos % 100,
        positionIndexY = math.floor(pos / 100),
        camp = BATTLE_CAMP_FLAG.LEFT,
        state = BATTLE_STATE_ENUM.START
      })
      if unit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.WALL then
        MiniGameBattleScene.wallUnit = unit
      else
        table.insert(MiniGameBattleScene.cardList, unit)
      end
    end
    local monsterGroupId = stageConfig.monster_group
    local normalMonsterGroup = {}
    local loopMonsterGroup = {}
    local configTable = TableData.GetTable("BaseShootMonsterGroup")
    for _, v in pairs(configTable) do
      if v.group_id == monsterGroupId then
        if 1 == v.cycle_tag then
          MiniGameBattleScene.isLoopStage = true
          table.insert(loopMonsterGroup, v)
        else
          table.insert(normalMonsterGroup, v)
        end
      end
    end
    table.sort(normalMonsterGroup, function(a, b)
      return a.id < b.id
    end)
    table.sort(loopMonsterGroup, function(a, b)
      return a.id < b.id
    end)
    MiniGameBattleScene.curMonsterGroupIndex = 1
    MiniGameBattleScene.normalMonsterGroup = normalMonsterGroup
    MiniGameBattleScene.loopMonsterGroup = loopMonsterGroup
    MiniGameBattleScene.minX = MiniGameBattleScene.wallUnit.position.x
    MiniGameBattleScene.maxX = MiniGameBattleScene.initX + MiniGameBattleScene.mapXCount * MiniGameBattleScene.ceilLength
  end
end

function MiniGameBattleSceneMgr.AddUnit(data)
  MiniGameBattleScene.unitGlobalIndex = MiniGameBattleScene.unitGlobalIndex + 1
  data.uid = MiniGameBattleScene.unitGlobalIndex
  local unit = MiniGameBattleUnit.NewUnit(data)
  table.insert(MiniGameBattleScene.allUnit, 1, unit)
  table.insert(MiniGameBattleScene.allAliveUnit, 1, unit)
  MiniGameBattleScene.unitByUid[unit.uid] = unit
  if unit.normalSkillId then
    unit:SaveSkill(unit.normalSkillId)
  end
  unit:DealBasicBuff()
  return unit
end

function MiniGameBattleSceneMgr.RemoveUnit(unit)
  local uid = unit.uid
  MiniGameBattleScene.unitByUid[uid] = nil
  local allUnit = MiniGameBattleScene.allUnit
  for i = #allUnit, 1, -1 do
    if allUnit[i].uid == uid then
      table.remove(allUnit, i)
      break
    end
  end
end

function MiniGameBattleSceneMgr.RemoveFromAliveList(unit)
  local uid = unit.uid
  local allAliveUnit = MiniGameBattleScene.allAliveUnit
  for i, v in ipairs(allAliveUnit) do
    if v.uid == uid then
      table.remove(allAliveUnit, i)
      break
    end
  end
end

function MiniGameBattleSceneMgr.AddBullet(...)
  MiniGameBattleScene.unitGlobalIndex = MiniGameBattleScene.unitGlobalIndex + 1
  local bullet = MiniGameBattleBullet.NewBullet(...)
  MiniGameBattleScene.bulletByUid[bullet.uid] = bullet
  table.insert(MiniGameBattleScene.allBullet, 1, bullet)
  return bullet
end

function MiniGameBattleSceneMgr.RemoveBullet(bullet)
  local uid = bullet.uid
  MiniGameBattleScene.bulletByUid[uid] = nil
  local allBullet = MiniGameBattleScene.allBullet
  for i, v in ipairs(allBullet) do
    if v.uid == uid then
      table.remove(allBullet, i)
      break
    end
  end
end

function MiniGameBattleSceneMgr.GetInitPosition(posIndex)
  local x, y, z = 0, 0, 0
  local yIndex = math.abs(posIndex) % 100
  local xIndex = math.floor(posIndex / 100)
  local ceilLength = MiniGameBattleScene.ceilLength
  x = MiniGameBattleScene.initX + (xIndex - 0.5) * ceilLength
  y = MiniGameBattleScene.initY - (yIndex - 0.5) * ceilLength
  return x, y, z
end

function MiniGameBattleSceneMgr.IsBattleOver()
  return MiniGameBattleScene.isBattleWin or MiniGameBattleScene.isBattleLoss
end

function MiniGameBattleSceneMgr.UpdateProcess()
  local allUnit = MiniGameBattleScene.allUnit
  for i = #allUnit, 1, -1 do
    allUnit[i]:Update()
  end
  local allBullet = MiniGameBattleScene.allBullet
  for i = #allBullet, 1, -1 do
    allBullet[i]:Update()
  end
  MiniGameBattleBuffMgr.UpdateAllBuff(MiniGameBattleControl.curFixedFrame)
  local allMonsterList = MiniGameBattleScene.aliveMonsterList
  for i = #allMonsterList, 1, -1 do
    local monster = allMonsterList[i]
    if monster:IsDead() == false and false == monster:IsDestroy() and (monster.needDestroy == true or monster.tempHpPer and monster:GetHp() <= 0) then
      monster.needDestroy = nil
      MiniGameBattleAction.DealDying(monster)
      table.remove(allMonsterList, i)
    end
  end
  local cardSummonList = MiniGameBattleScene.cardSummonList
  for i = #cardSummonList, 1, -1 do
    local summon = cardSummonList[i]
    if summon:IsDead() == false and false == summon:IsDestroy() and summon.needDestroy == true then
      summon.needDestroy = nil
      MiniGameBattleAction.DealDying(summon)
      table.remove(cardSummonList, i)
    end
  end
  MiniGameBattleDataMgr.DealExpAdd()
end

function MiniGameBattleSceneMgr.UpdateDisplay()
  local allUnit = MiniGameBattleScene.allUnit
  for i = #allUnit, 1, -1 do
    allUnit[i]:UpdateDisplay()
  end
  local allBullet = MiniGameBattleScene.allBullet
  for i = #allBullet, 1, -1 do
    allBullet[i]:UpdateDisplay()
  end
end

function MiniGameBattleSceneMgr.UpdateBattleOverState()
  if MiniGameBattleScene.isLoopStage == true then
    if MiniGameBattleData.selfHp <= 0 then
      MiniGameBattleScene.isBattleLoss = true
    end
  elseif MiniGameBattleData.selfHp <= 0 then
    MiniGameBattleScene.isBattleLoss = true
  elseif true == MiniGameBattleScene.allMonsterCreate and #MiniGameBattleScene.aliveMonsterList <= 0 then
    MiniGameBattleScene.isBattleWin = true
  end
end

function MiniGameBattleSceneMgr.CreateMonster()
  if MiniGameBattleScene.nextMonsterCreateTimeWait > 0 then
    MiniGameBattleScene.nextMonsterCreateTimeWait = MiniGameBattleScene.nextMonsterCreateTimeWait - 1
    if MiniGameBattleScene.nextMonsterCreateTimeWait > 0 then
      return
    end
  end
  if 0 == #MiniGameBattleScene.curMonsterList or MiniGameBattleScene.curIndexInGroup >= #MiniGameBattleScene.curMonsterList then
    local curMonsterGroupInfo
    if MiniGameBattleScene.isLoopStage then
      if MiniGameBattleScene.curMonsterGroupIndex <= #MiniGameBattleScene.normalMonsterGroup then
        curMonsterGroupInfo = MiniGameBattleScene.normalMonsterGroup[MiniGameBattleScene.curMonsterGroupIndex]
      else
        local index = (MiniGameBattleScene.curMonsterGroupIndex - #MiniGameBattleScene.normalMonsterGroup) % #MiniGameBattleScene.loopMonsterGroup
        if 0 == index then
          index = #MiniGameBattleScene.loopMonsterGroup
        end
        curMonsterGroupInfo = MiniGameBattleScene.loopMonsterGroup[index]
      end
    else
      curMonsterGroupInfo = MiniGameBattleScene.normalMonsterGroup[MiniGameBattleScene.curMonsterGroupIndex]
    end
    if nil == curMonsterGroupInfo then
      MiniGameBattleScene.allMonsterCreate = true
      return
    end
    local nextTime = MiniGameBattleScene.cachedMonsterGroupTime + curMonsterGroupInfo.interval_time
    if nextTime > MiniGameBattleControl.curFixedFrame then
      return
    end
    MiniGameBattleScene.cachedMonsterGroupTime = MiniGameBattleScene.cachedMonsterGroupTime + curMonsterGroupInfo.interval_time
    local monsters = curMonsterGroupInfo.monsters
    local curMonsterList = {}
    for _, str in ipairs(monsters) do
      local strs = Split(str, ":")
      local count = tonumber(strs[2])
      local id = tonumber(strs[1])
      for i = 1, count do
        table.insert(curMonsterList, {
          id = id,
          pos = curMonsterGroupInfo.pos
        })
      end
    end
    MiniGameBattleScene.curIndexInGroup = 1
    MiniGameBattleScene.curMonsterList = curMonsterList
    local addHpPer, addExpPer = curMonsterGroupInfo.add_hp_per, curMonsterGroupInfo.add_exp_per
    MiniGameBattleScene.addHpPer = addHpPer
    MiniGameBattleScene.addExpPer = addExpPer
    if 1 == curMonsterGroupInfo.wave_num then
      MiniGameBattleScene.curMonsterWave = MiniGameBattleScene.curMonsterWave + 1
      UIMgr:SendWindowMessage(WinResConfig.MiniGameBattleUIWindow.name, WindowMsgEnum.MiniGameBattleUIWindow.E_MSG_CHANGE_WAVE)
    end
  else
    MiniGameBattleScene.curIndexInGroup = MiniGameBattleScene.curIndexInGroup + 1
  end
  local monster = MiniGameBattleScene.curMonsterList[MiniGameBattleScene.curIndexInGroup]
  local pos
  if monster.pos then
    if #monster.pos > 1 then
      local tempPosList = SimpleCopy(monster.pos)
      if MiniGameBattleScene.lastMonsterPositionIndex then
        for i, _pos in ipairs(tempPosList) do
          if _pos == MiniGameBattleScene.lastMonsterPositionIndex then
            table.remove(tempPosList, i)
          end
        end
      end
      if #tempPosList > 1 then
        local index = MiniGameBattleMgr.GetRandomNum(1, #tempPosList)
        pos = tempPosList[index]
      else
        pos = tempPosList[1]
      end
    else
      pos = monster.pos[1]
    end
  elseif MiniGameBattleScene.lastMonsterPositionIndex then
    local lastArea = MiniGameBattleSceneMgr.GetPositionArea(MiniGameBattleScene.lastMonsterPositionIndex)
    pos = MiniGameBattleSceneMgr.GetRandomPositionIndex(lastArea)
  else
    pos = MiniGameBattleSceneMgr.GetRandomPositionIndex()
  end
  if MiniGameBattleScene.curIndexInGroup >= #MiniGameBattleScene.curMonsterList then
    MiniGameBattleScene.nextMonsterCreateTimeWait = 0
    MiniGameBattleScene.curMonsterGroupIndex = MiniGameBattleScene.curMonsterGroupIndex + 1
  else
    MiniGameBattleScene.nextMonsterCreateTimeWait = MiniGameBattleScene.monsterCreateIntervalFrame
  end
  MiniGameBattleScene.lastMonsterPositionIndex = pos
  print("小游戏 生成怪物：", MiniGameBattleControl.curFixedFrame, monster.id, pos)
  MiniGameBattleSceneMgr.AddMonster(monster.id, pos, MiniGameBattleScene.addHpPer, MiniGameBattleScene.addExpPer)
end

function MiniGameBattleSceneMgr.GetPositionArea(positionIndex)
  local num = positionIndex % 10
  if num <= 3 then
    return 1
  elseif num <= 6 then
    return 2
  else
    return 3
  end
end

function MiniGameBattleSceneMgr.GetRandomPositionIndex(notIncludeArea)
  local allPositionIndex = {
    {pos = 3001, area = 1},
    {pos = 3002, area = 1},
    {pos = 3003, area = 1},
    {pos = 3004, area = 2},
    {pos = 3005, area = 2},
    {pos = 3006, area = 2},
    {pos = 3007, area = 3},
    {pos = 3008, area = 3},
    {pos = 3009, area = 3}
  }
  if notIncludeArea then
    for i = #allPositionIndex, 1, -1 do
      if allPositionIndex[i].area == notIncludeArea then
        table.remove(allPositionIndex, i)
      end
    end
  end
  local index = MiniGameBattleMgr.GetRandomNum(1, #allPositionIndex)
  return allPositionIndex[index].pos
end

function MiniGameBattleSceneMgr.AddMonster(id, pos, addHpPer, addExpPer)
  local unit = MiniGameBattleSceneMgr.AddUnit({
    id = id,
    positionIndex = pos,
    positionIndexX = pos % 100,
    positionIndexY = math.floor(pos / 100),
    camp = BATTLE_CAMP_FLAG.RIGHT,
    state = BATTLE_STATE_ENUM.START,
    addHpPer = addHpPer,
    addExpPer = addExpPer
  })
  table.insert(MiniGameBattleScene.aliveMonsterList, 1, unit)
end

function MiniGameBattleSceneMgr.GetUnitByUid(uid)
  return MiniGameBattleScene.unitByUid[uid]
end

function MiniGameBattleSceneMgr.GetBulletByUid(uid)
  return MiniGameBattleScene.bulletByUid[uid]
end

function MiniGameBattleSceneMgr.DealClearTarget(battleUnit)
  local uid = battleUnit.uid
  local v
  local _allAliveUnit = MiniGameBattleScene.allAliveUnit
  for i = 1, #_allAliveUnit do
    v = _allAliveUnit[i]
    if v.uid ~= uid and v.attackTargetUid == uid then
      v:SetAttackTargetUid(nil)
    end
  end
end

function MiniGameBattleSceneMgr.Stop()
  MiniGameBattleHurtNum.ClearHurtNum()
  MiniGameBattleBuffMgr.ClearAllBuff()
  local allUnit = MiniGameBattleScene.allUnit
  for i = #allUnit, 1, -1 do
    allUnit[i]:Destroy()
  end
  local allBullet = MiniGameBattleScene.allBullet
  for i = #allBullet, 1, -1 do
    allBullet[i]:Destroy()
  end
end
