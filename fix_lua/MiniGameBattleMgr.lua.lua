MiniGameBattleMgr = {isBattleStart = false}

function MiniGameBattleMgr.InitBattle(data)
  ld("Battle")
  collectgarbage()
  MiniGameBattleCamera.enabled = true
  CameraUtil.SetCameraCullingMask(MiniGameBattleCameraObject, BATTLE_CONFIG_ENUM.CAMERA_CULLING_MASK)
  local baseWidth = 1334
  local baseHeight = 750
  local widthRatio = Screen.width / baseWidth
  local heightRatio = Screen.height / baseHeight
  if widthRatio < heightRatio then
    local ratioHeight = baseHeight * Screen.width / baseWidth
    local ratio = Screen.height / ratioHeight
    MiniGameBattleCamera.orthographicSize = 5 * ratio
  end
  BattleResourceManager:SetBattleRootScale(1)
  MiniGameBattleDataCount.Init()
  InitMiniGameBattleData(data)
  MiniGameBattleControl.Init()
  InitMiniGameBattleScene()
  MiniGameBattleBuffMgr.Init()
  SettingUtil.UpdateFPS()
end

function MiniGameBattleMgr.StartBattle(delayClearScene)
  MiniGameBattleMgr.isBattleStart = true
  MiniGameBattleControl.Start(delayClearScene)
end

function MiniGameBattleMgr.CloseBattle(isManual, forceClose)
  MiniGameBattleControl.Stop(isManual, forceClose)
  LoginData.SetTimeScale(1)
  UIMgr:CloseWindow(WinResConfig.MiniGameBattleUIWindow.name)
  SettingUtil.UpdateFPS()
  collectgarbage()
  MiniGameBattleMgr.isPlotBattle = false
  MiniGameBattleMgr.isBattleStart = false
  MiniGameBattleMgr.beforeBattleCallback = nil
  MiniGameBattleMgr.skillSpEnoughCallback = nil
  MiniGameBattleMgr.showLeftDamageCount = false
end

function MiniGameBattleMgr.SendBattleOverMsg(stageId, param)
  ld("Activity17_MiniGame")
  local point = 0
  if param.isBattleWin then
    point = stageId
  end
  Activity17_MiniGameService.MiniGameSubmitReq(70441022, {}, point, nil, function()
    OpenWindow(WinResConfig.MiniGameBattleEndWindow.name, nil, param)
  end, function()
    MessageBox.Show(T(10320), {
      touchCallback = function()
        MiniGameBattleMgr.CloseBattle()
      end
    }, nil, {
      touchCallback = function()
        MiniGameBattleMgr.CloseBattle()
      end
    })
  end)
end

function MiniGameBattleMgr.GetRandom()
  if MiniGameBattleData.curRandomIndex >= MiniGameBattleData.randomSeedsCount then
    MiniGameBattleData.curRandomIndex = 1
  else
    MiniGameBattleData.curRandomIndex = MiniGameBattleData.curRandomIndex + 1
  end
  return MiniGameBattleData.randomSeeds[MiniGameBattleData.curRandomIndex]
end

function MiniGameBattleMgr.GetRandomNum(minValue, maxValue)
  local value = maxValue - minValue
  local random = MiniGameBattleMgr.GetRandom()
  local result = minValue + math.round(value * random / 10000)
  if maxValue < result or minValue > result then
    printError("随机数出错了", minValue, maxValue, random, result, debug.traceback())
    return math.floor((minValue + maxValue) / 2)
  end
  return result
end

function MiniGameBattleMgr.LevelUp(cachedLevelUpList)
  MiniGameBattleControl.Pause()
  OpenWindow(WinResConfig.MiniGameSkillChoiceWindow.name, nil, cachedLevelUpList)
end
