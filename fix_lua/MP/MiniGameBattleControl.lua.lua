MiniGameBattleControl = {}

function MiniGameBattleControl.Init()
  MiniGameBattleControl.curFixedFrame = 0
  MiniGameBattleControl.curFrame = 0
  MiniGameBattleControl.isPause = false
  MiniGameBattleControl.isOver = false
  MiniGameBattleControl.battleStartEnable = false
  MiniGameBattleControl.dealBuffPreCount = 0
  MiniGameBattleControl.baseTimeScale = MiniGameBattleData.speedList[MiniGameBattleData.speedIndex]
  MiniGameBattleControl.timescaleSlowRatio = nil
  MiniGameBattleControl.delayStopBattleFrame = BATTLE_CONFIG_ENUM.DEFAULT_DYING_FRAMES + 10
end

function MiniGameBattleControl.Start()
  UpdateManager.AddFixedUpdateHandler(MiniGameBattleControl.UpdateProcess)
  UpdateManager.AddUpdateHandler(MiniGameBattleControl.UpdateDisplay)
end

function MiniGameBattleControl.UpdateProcess()
  if MiniGameBattleControl.isPause == true then
    return
  end
  if MiniGameBattleSceneMgr.IsBattleOver() == false then
    MiniGameBattleControl.curFixedFrame = MiniGameBattleControl.curFixedFrame + 1
    MiniGameBattleSceneMgr.CreateMonster()
    MiniGameBattleSceneMgr.UpdateProcess()
    MiniGameBattleSceneMgr.UpdateBattleOverState()
  end
  if true == MiniGameBattleSceneMgr.IsBattleOver() then
    MiniGameBattleControl.Stop()
  end
end

function MiniGameBattleControl.UpdateDisplay()
  if MiniGameBattleControl.isPause == true then
    return
  end
  MiniGameBattleControl.curFrame = MiniGameBattleControl.curFrame + 1
  MiniGameBattleSceneMgr.UpdateDisplay()
  if MiniGameBattleSceneMgr.IsBattleOver() == false then
    UIMgr:SendWindowMessage(WinResConfig.MiniGameBattleUIWindow.name, WindowMsgEnum.MiniGameBattleUIWindow.E_MSG_UPDATE_PER_FRAME)
  end
end

function MiniGameBattleControl.Pause()
  if MiniGameBattleSceneMgr.IsBattleOver() == true then
    return
  end
  if true == MiniGameBattleControl.isPause then
    return
  end
  MiniGameBattleControl.isPause = true
  LoginData.SetTimeScale(0)
end

function MiniGameBattleControl.Continue()
  MiniGameBattleControl.isPause = false
  if UIMgr:IsWindowOpen(WinResConfig.MiniGameBattleUIWindow.name) then
    LoginData.SetTimeScale(MiniGameBattleControl.baseTimeScale)
  end
end

function MiniGameBattleControl.Stop(isManual, forceClose)
  if MiniGameBattleControl.isOver == false then
    local param
    if MiniGameBattleScene.isLoopStage then
      param = {
        isBattleWin = false,
        isBattleLoss = false,
        wave = MiniGameBattleScene.curMonsterWave,
        killCount = MiniGameBattleData.killEnemyCount
      }
    else
      param = {
        isBattleWin = MiniGameBattleScene.isBattleWin,
        isBattleLoss = MiniGameBattleScene.isBattleLoss,
        wave = MiniGameBattleScene.curMonsterWave,
        killCount = MiniGameBattleData.killEnemyCount
      }
    end
    local stageId = MiniGameBattleData.stageId
    MiniGameBattleControl.isOver = true
    MiniGameBattleSceneMgr.Stop()
    SoundManager:ClearTempBanks()
    UpdateManager.RemoveFixedUpdateHandler(MiniGameBattleControl.UpdateProcess)
    UpdateManager.RemoveUpdateHandler(MiniGameBattleControl.UpdateDisplay)
    ClearMiniGameBattleScene()
    ClearMiniGameBattleData()
    MiniGameBattleMgr.SendBattleOverMsg(stageId, param)
  end
end
