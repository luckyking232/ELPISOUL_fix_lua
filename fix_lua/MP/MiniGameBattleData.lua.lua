function InitMiniGameBattleData(data)
  ClearMiniGameBattleData()
  
  MiniGameBattleData.stageId = data.stageId
  MiniGameBattleData.stageConfig = TableData.GetConfig(data.stageId, "BaseShootStage")
  MiniGameBattleData.buffList = {}
  MiniGameBattleData.isAuto = false
  local speed = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.MINI_GAME_BATTLE_SPEED, PLAYER_PREF_DEFAULT_VALUE.MINI_GAME_BATTLE_SPEED)
  if MiniGameBattleData.speedList[speed] then
    MiniGameBattleData.speedIndex = speed
  else
    MiniGameBattleData.speedIndex = 1
  end
  local randomSeeds = {}
  for i = 1, 50 do
    table.insert(randomSeeds, math.random(1, 10000))
  end
  MiniGameBattleData.randomSeedsCount = #randomSeeds
  MiniGameBattleData.randomSeeds = randomSeeds
  MiniGameBattleData.curRandomIndex = 0
end

function ClearMiniGameBattleData()
  MiniGameBattleData = {
    stageId = 0,
    stageConfig = nil,
    battleRootScale = 1,
    speedList = MINI_GAME_BATTLE_SPEED_ENUM,
    speedIndex = 1,
    curRandomIndex = 0,
    randomSeeds = {},
    randomSeedsCount = 0,
    buffList = {},
    totalFixedFrames = 0,
    isAuto = false,
    battleCameraScale = 1,
    curLevel = 0,
    curExp = 0,
    waitDealExpAdd = 0,
    levelMax = false,
    killEnemyCount = 0,
    selfMaxHp = 0,
    selfHp = 0
  }
end

MiniGameBattleDataMgr = {}

function MiniGameBattleDataMgr.AddExp(addExp)
  if nil == addExp then
    return
  end
  if MiniGameBattleData.levelMax then
    return
  end
  MiniGameBattleData.waitDealExpAdd = MiniGameBattleData.waitDealExpAdd + addExp
end

function MiniGameBattleDataMgr.DealExpAdd()
  local addExp = MiniGameBattleData.waitDealExpAdd
  if addExp <= 0 then
    return
  end
  local stageConfig = MiniGameBattleData.stageConfig
  local curLevel = MiniGameBattleData.curLevel
  local curExp = MiniGameBattleData.curExp
  local allLevel = stageConfig.level_time
  local levelUp = false
  local cachedLevelUpList = {}
  while addExp > 0 do
    local curLevelNeedExp = allLevel[curLevel + 1]
    if curLevelNeedExp <= addExp + curExp then
      if allLevel[curLevel + 2] then
        addExp = addExp - (curLevelNeedExp - curExp)
        curExp = 0
        curLevel = curLevel + 1
      else
        MiniGameBattleData.levelMax = true
        curExp = 0
        curLevel = curLevel + 1
        addExp = 0
      end
      table.insert(cachedLevelUpList, curLevel)
      levelUp = true
    else
      curExp = curExp + addExp
      addExp = 0
    end
  end
  MiniGameBattleData.curLevel = curLevel
  MiniGameBattleData.curExp = curExp
  if levelUp then
    MiniGameBattleMgr.LevelUp(cachedLevelUpList)
  end
  MiniGameBattleData.waitDealExpAdd = 0
end
