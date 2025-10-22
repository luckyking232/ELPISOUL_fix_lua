require("ActivityDungeon1017Battle_BattleUIWindowByName")
local MiniGameBattleUIWindow = {}
local uis, contentPane
local selfUnitDamageList = {}

function MiniGameBattleUIWindow.ReInitData()
end

function MiniGameBattleUIWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MiniGameBattleUIWindow.package, WinResConfig.MiniGameBattleUIWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017Battle_BattleUIWindowUis(contentPane)
    MiniGameBattleUIWindow.InitInfo()
    MiniGameBattleUIWindow.InitBtn()
  end)
end

function MiniGameBattleUIWindow.InitInfo()
  MiniGameBattleUIWindow.UpdateSpeedBtn()
  MiniGameBattleUIWindow.UpdateTime()
  MiniGameBattleUIWindow.UpdateWaveInfo()
  MiniGameBattleUIWindow.UpdateKillInfo()
  MiniGameBattleUIWindow.UpdateLevelInfo()
  MiniGameBattleUIWindow.UpdateSelfHp(true)
  MiniGameBattleUIWindow.UpdateSelfCardDamage(true)
  MiniGameBattleUIWindow.UpdateSelfCardHead()
end

function MiniGameBattleUIWindow.UpdateInfo()
end

function MiniGameBattleUIWindow.UpdateTime()
  uis.Main.Top.Time.TimeTxt.text = TimeUtil.GetTimeStr(MiniGameBattleControl.curFixedFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
end

function MiniGameBattleUIWindow.UpdateWaveInfo()
  uis.Main.Top.Progress.TimeTxt.text = T(11903, MiniGameBattleData.stageConfig.name(), MiniGameBattleScene.curMonsterWave)
end

function MiniGameBattleUIWindow.UpdateKillInfo()
  uis.Main.Top.Number.NumberTxt.text = T(11901, MiniGameBattleData.killEnemyCount)
end

function MiniGameBattleUIWindow.UpdateLevelInfo()
  local level = MiniGameBattleData.curLevel
  local exp = MiniGameBattleData.curExp
  local stageConfig = MiniGameBattleData.stageConfig
  local allLevel = stageConfig.level_time
  local curLevelNeedExp = allLevel[level + 1]
  uis.Main.Top.Exp.LevelTxt.text = T(1303, level)
  if nil == curLevelNeedExp or exp >= curLevelNeedExp then
    uis.Main.Top.Exp.ExpTxt.text = T(11900, exp, allLevel[level])
    uis.Main.Top.Exp.ExpProgressBar.value = 100
  else
    uis.Main.Top.Exp.ExpTxt.text = T(11900, exp, curLevelNeedExp)
    uis.Main.Top.Exp.ExpProgressBar.value = 100 * exp / curLevelNeedExp
  end
end

function MiniGameBattleUIWindow.UpdateSelfHp(init)
  local selfHp = MiniGameBattleData.selfHp
  local selfMaxHp = MiniGameBattleData.selfMaxHp
  uis.Main.Bottom.BuildHP.HPTxt.text = T(11024, selfHp, selfMaxHp)
  if init then
    uis.Main.Bottom.BuildHP.NameTxt.text = T(11902)
    uis.Main.Bottom.BuildHP.BuildHPProgressBar.value = 100
  else
    uis.Main.Bottom.BuildHP.BuildHPProgressBar.value = 100 * selfHp / selfMaxHp
  end
end

function MiniGameBattleUIWindow.UpdateSelfCardDamage(init)
  local dps1 = uis.Main.Bottom.DPSInfoSwitch.DPS1
  if init then
    selfUnitDamageList = {}
    local selfUnitList = MiniGameBattleScene.cardList
    for i = 1, 5 do
      local unit = selfUnitList[i]
      local cardDps1 = dps1["Card" .. i]
      cardDps1.DPSProgressBar.value = 0
      local numberTxtDps1 = cardDps1.DPSProgressBar:GetChild("NumberTxt")
      if unit then
        cardDps1.c1Ctr.selectedIndex = 0
        local url = UIUtil.GetResUrl(unit.baseConfig.head_icon_circle)
        cardDps1.PicLoader.url = url
        numberTxtDps1.text = 0
      else
        cardDps1.c1Ctr.selectedIndex = 1
      end
      table.insert(selfUnitDamageList, {
        unit = unit,
        progressBarDps1 = cardDps1.DPSProgressBar,
        numberTxtDps1 = numberTxtDps1
      })
    end
  else
    local maxDamage = 0
    for _, v in ipairs(selfUnitDamageList) do
      if v.unit then
        local damage = v.unit.damageRecord
        maxDamage = math.max(damage, maxDamage)
        v.numberTxtDps1.text = damage
      end
    end
    if maxDamage > 0 then
      for _, v in ipairs(selfUnitDamageList) do
        if v.unit then
          local damage = v.unit.damageRecord
          v.progressBarDps1:TweenValue(100 * damage / maxDamage, 0.1)
        end
      end
    end
  end
end

function MiniGameBattleUIWindow.UpdateSelfCardHead()
  local cardList = uis.Main.Bottom.CardList
  cardList.itemRenderer = MiniGameBattleUIWindow.RenderCardHead
  cardList.numItems = 5
end

function MiniGameBattleUIWindow.RenderCardHead(index, item)
  local selfUnitList = MiniGameBattleScene.cardList
  local data = selfUnitList[index + 1]
  if data then
    ChangeUIController(item, "c1", 0)
    ChangeUIController(item, "c2", 1)
    item:GetChild("NumberTxt").text = T(11044, data:GetTotalSkillLevel())
    item:GetChild("Bg"):GetChild("PicLoader").url = UIUtil.GetResUrl(data.baseConfig.head_icon)
    local skillList = item:GetChild("SkillList")
    local dataForUI = data:GetSkillListForUI()
    
    function skillList.itemRenderer(i, skill)
      local skillData = dataForUI[i + 1]
      local skillConfig = TableData.GetConfig(skillData.id, "BaseShootSkill")
      skill:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
      if skillData.level > 0 then
        ChangeUIController(skill, "lock", 0)
        skill:GetChild("LevelTxt").text = skillData.level
        if skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.NORMAL then
          local remainTime
          if data.lastSkillFrame == nil then
            skill.value = 0
          else
            local totalFrame = data.curSkillTotalFrame + data:GetDefaultWaitFrame()
            remainTime = math.max(data.lastSkillFrame + totalFrame - MiniGameBattleControl.curFixedFrame, 0)
            skill.value = 100 * remainTime / totalFrame
          end
        elseif skillConfig.trigger_cd then
          local remainTime
          local lastTriggerFrame = data:GetLastFrameBySkillId(skillData.id)
          if 0 == lastTriggerFrame then
            skill.value = 0
          else
            local totalFrame = skillConfig.trigger_cd
            remainTime = math.max(lastTriggerFrame + totalFrame - MiniGameBattleControl.curFixedFrame, 0)
            skill.value = 100 * remainTime / totalFrame
          end
        else
          skill.value = 0
        end
      else
        ChangeUIController(skill, "lock", 1)
      end
    end
    
    skillList.numItems = 3
  else
    ChangeUIController(item, "c1", 1)
  end
end

function MiniGameBattleUIWindow.InitBtn()
  uis.Main.Top.ReturnBtn.onClick:Add(MiniGameBattleUIWindow.ClickReturnBtn)
  uis.Main.Top.PauseBtn.onClick:Add(MiniGameBattleUIWindow.ClickPauseBtn)
  uis.Main.Top.SpeedBtn.onClick:Add(MiniGameBattleUIWindow.ClickSpeedBtn)
  if Application.platform == RuntimePlatform.WindowsEditor then
    local testBtn = uis.Main.root:GetChild("n1")
    if testBtn then
      testBtn.onClick:Set(function()
        MiniGameBattleDataMgr.AddExp(100)
      end)
    end
  end
end

function MiniGameBattleUIWindow.ClickReturnBtn()
  MiniGameBattleControl.Pause()
  OpenWindow(WinResConfig.MiniGameBattleExitWindow.name)
end

function MiniGameBattleUIWindow.ClickPauseBtn()
  MiniGameBattleControl.Pause()
  OpenWindow(WinResConfig.MiniGameBattlePauseWindow.name)
end

function MiniGameBattleUIWindow.ClickSpeedBtn()
  if MiniGameBattleControl.isPause == true then
    return
  end
  local speedIndex = MiniGameBattleData.speedIndex
  if MiniGameBattleData.speedList[speedIndex + 1] then
    MiniGameBattleData.speedIndex = speedIndex + 1
  else
    MiniGameBattleData.speedIndex = 1
  end
  MiniGameBattleUIWindow.UpdateSpeedBtn()
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.MINI_GAME_BATTLE_SPEED, MiniGameBattleData.speedIndex)
end

function MiniGameBattleUIWindow.UpdateSpeedBtn()
  local speedBtn = uis.Main.Top.SpeedBtn
  if speedBtn then
    ChangeUIController(speedBtn, "c1", MiniGameBattleData.speedIndex - 1)
    MiniGameBattleUIWindow.UpdateSpeed()
    speedBtn:GetChild("NumberTxt").text = T(11909, MiniGameBattleData.speedIndex)
  end
end

function MiniGameBattleUIWindow.UpdateSpeed()
  MiniGameBattleControl.baseTimeScale = MiniGameBattleData.speedList[MiniGameBattleData.speedIndex]
  if 0 ~= LoginData.gameTimescale then
    LoginData.SetTimeScale(MiniGameBattleControl.timescaleSlowRatio or MiniGameBattleControl.baseTimeScale)
  end
  SoundUtil.SetSfxSpeedInBattle(MiniGameBattleData.speedIndex)
end

function MiniGameBattleUIWindow.ShowPlayBattleStart()
  local startCom = UIMgr:CreateObject("ActivityDungeon1017Battle", "BattleStart")
  if startCom then
    contentPane:AddChild(startCom)
    startCom.size = contentPane.size
    UIUtil.SetBtnText(startCom, T(10311))
    startCom:Center()
    PlayUITrans(startCom, "in", function()
      contentPane:RemoveChild(startCom, true)
    end):SetHook("Sign", function()
      MiniGameBattleUIWindow.ShowEnterAnim(MiniGameBattleUIWindow.BattleStart)
    end)
  end
end

function MiniGameBattleUIWindow.BattleStart()
  contentPane.touchable = true
  if true == MiniGameBattleMgr.isBattleStart then
    return
  end
  MiniGameBattleMgr.StartBattle()
end

function MiniGameBattleUIWindow.ShowEnterAnim(callback)
  if uis then
    uis.Main.root.visible = true
    PlayUITrans(uis.Main.root, "up", callback)
  end
end

function MiniGameBattleUIWindow.OnShowAnimationEnd()
  if uis then
    uis.Main.root.visible = false
    UIUtil.ChangeBattleScreenEffectOut(MiniGameBattleUIWindow.ShowPlayBattleStart)
  end
end

function MiniGameBattleUIWindow.OnClose()
  BattleResourceManager:ClearBattleResource()
  uis = nil
  contentPane = nil
  selfUnitDamageList = {}
end

function MiniGameBattleUIWindow.HandleMessage(msgId, para)
  local windowMsgEnum = WindowMsgEnum.MiniGameBattleUIWindow
  if msgId == windowMsgEnum.E_MSG_UPDATE_PER_FRAME then
    MiniGameBattleUIWindow.UpdateTime()
    MiniGameBattleUIWindow.UpdateKillInfo()
    MiniGameBattleUIWindow.UpdateLevelInfo()
    MiniGameBattleUIWindow.UpdateSelfHp()
    MiniGameBattleUIWindow.UpdateSelfCardDamage()
    MiniGameBattleUIWindow.UpdateSelfCardHead()
  elseif msgId == windowMsgEnum.E_MSG_CHANGE_WAVE then
    MiniGameBattleUIWindow.UpdateWaveInfo()
  end
end

return MiniGameBattleUIWindow
