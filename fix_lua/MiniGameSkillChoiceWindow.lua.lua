require("ActivityDungeon1017Battle_SkillChoiceWindowByName")
local MiniGameSkillChoiceWindow = {}
local uis, contentPane, closeTimer
local closeDelayTime = 30
local selectSkill, skillHandList, cachedLevelUpList

function MiniGameSkillChoiceWindow.ReInitData()
end

function MiniGameSkillChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MiniGameSkillChoiceWindow.package, WinResConfig.MiniGameSkillChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    cachedLevelUpList = bridgeObj.argTable[1]
    uis = GetActivityDungeon1017Battle_SkillChoiceWindowUis(contentPane)
    MiniGameSkillChoiceWindow.DealNextLevel()
    MiniGameSkillChoiceWindow.InitBtn()
  end)
end

function MiniGameSkillChoiceWindow.RandomSkillList(curDealLevel)
  local skillList = {}
  local allCard = MiniGameBattleScene.cardList
  for i, v in ipairs(allCard) do
    table.appendTail(skillList, v:GetCurSkillListForChoose(curDealLevel))
  end
  local randomSkillList = {}
  for i = 1, 3 do
    if #skillList > 0 then
      local skill = MiniGameSkillChoiceWindow.GetOneRandomSkill(skillList)
      table.insert(randomSkillList, skill)
    end
  end
  return randomSkillList
end

function MiniGameSkillChoiceWindow.GetOneRandomSkill(skillList)
  local maxProb = 0
  for i, v in ipairs(skillList) do
    maxProb = maxProb + v.prob
  end
  local random = MiniGameBattleMgr.GetRandomNum(1, maxProb)
  local tempProb = 0
  for i, v in ipairs(skillList) do
    tempProb = tempProb + v.prob
    if random <= tempProb then
      table.remove(skillList, i)
      return v
    end
  end
end

function MiniGameSkillChoiceWindow.UpdateInfo(curDealLevel)
  MiniGameSkillChoiceWindow.UpdateSkillList(curDealLevel)
  MiniGameSkillChoiceWindow.StartCountdown()
end

function MiniGameSkillChoiceWindow.StartCountdown()
  closeTimer = LeanTween.value(closeDelayTime, 0, closeDelayTime):setIgnoreTimeScale(true):setOnUpdate(function(value)
    if uis then
      UIUtil.SetBtnText(uis.Main.Time.SureBtn, T(11904, math.ceil(value)))
    end
  end):setOnComplete(MiniGameSkillChoiceWindow.Select)
  uis.Main.Time.Time1ProgressBar.value = 100
  uis.Main.Time.Time2ProgressBar.value = 100
  uis.Main.Time.Time1ProgressBar:TweenValue(0, closeDelayTime):SetIgnoreEngineTimeScale(true)
  uis.Main.Time.Time2ProgressBar:TweenValue(0, closeDelayTime):SetIgnoreEngineTimeScale(true)
end

function MiniGameSkillChoiceWindow.UpdateSkillList(curDealLevel)
  local skillList = MiniGameSkillChoiceWindow.RandomSkillList(curDealLevel)
  local tipsList = uis.Main.TipsList
  tipsList:RemoveChildrenToPool()
  skillHandList = {}
  selectSkill = nil
  for i, skill in ipairs(skillList) do
    local skillHand = tipsList:AddItemFromPool()
    skillHand.visible = false
    local skillConfig = TableData.GetConfig(skill.id, "BaseShootSkill")
    skillHand.onClick:Set(function()
      selectSkill = skill
      MiniGameSkillChoiceWindow.UpdateSkillSelect()
    end)
    local tips = skillHand:GetChild("Tips")
    ChangeUIController(tips, "c1", 0)
    tips:GetChild("NameTxt").text = skillConfig.name()
    tips:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
    local wordList = tips:GetChild("WordList")
    wordList:RemoveChildrenToPool()
    local word = wordList:AddItemFromPool()
    word:GetChild("WordTxt").text = skillConfig.des()
    tips:GetChild("Card"):GetChild("PartsCardBg"):GetChild("PicLoader").url = UIUtil.GetResUrl(skill.unit.baseConfig.head_icon)
    LeanTween.delayedCall((i - 1) * 0.2, function()
      skillHand.visible = true
      PlayUITrans(skillHand, "up", nil, nil, nil, nil, nil, true)
    end):setIgnoreTimeScale(true)
    if skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE or skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.TALENT then
      ChangeUIController(tips, "c2", 1)
    else
      ChangeUIController(tips, "c2", 0)
    end
    table.insert(skillHandList, {
      skillHand = skillHand,
      tips = tips,
      skill = skill
    })
  end
end

function MiniGameSkillChoiceWindow.InitBtn()
  uis.Main.Time.SureBtn.onClick:Add(MiniGameSkillChoiceWindow.ClickSureBtn)
end

function MiniGameSkillChoiceWindow.ClickSureBtn()
  if selectSkill then
    MiniGameSkillChoiceWindow.Select()
  end
end

function MiniGameSkillChoiceWindow.Close()
  if closeTimer then
    LeanTween.cancel(closeTimer.uniqueId)
    closeTimer = nil
  end
  if #cachedLevelUpList > 0 then
    MiniGameSkillChoiceWindow.DealNextLevel()
  else
    UIMgr:CloseWindow(WinResConfig.MiniGameSkillChoiceWindow.name)
  end
end

function MiniGameSkillChoiceWindow.UpdateSkillSelect()
  for i, v in ipairs(skillHandList) do
    if selectSkill and selectSkill.id == v.skill.id then
      ChangeUIController(v.tips, "c1", 1)
    else
      ChangeUIController(v.tips, "c1", 0)
    end
  end
end

function MiniGameSkillChoiceWindow.Select()
  if selectSkill then
    local unit = selectSkill.unit
    unit:SaveSkill(selectSkill.id)
    MiniGameSkillChoiceWindow.Close()
  else
    local randomIndex = MiniGameBattleMgr.GetRandomNum(1, #skillHandList)
    local skillHand = skillHandList[randomIndex].skillHand
    skillHand.onClick:Call()
    local skill = skillHandList[randomIndex].skill
    local unit = skill.unit
    unit:SaveSkill(skill.id)
    contentPane.touchable = false
    LeanTween.delayedCall(0.5, MiniGameSkillChoiceWindow.Close):setIgnoreTimeScale(true)
  end
end

function MiniGameSkillChoiceWindow.DealNextLevel()
  if #cachedLevelUpList > 0 then
    local curDealLevel = cachedLevelUpList[1]
    table.remove(cachedLevelUpList, 1)
    MiniGameSkillChoiceWindow.UpdateInfo(curDealLevel)
    contentPane.touchable = true
  end
end

function MiniGameSkillChoiceWindow.OnClose()
  MiniGameBattleControl.Continue()
  uis = nil
  contentPane = nil
  if closeTimer then
    LeanTween.cancel(closeTimer.uniqueId)
    closeTimer = nil
  end
  selectSkill = nil
  skillHandList = nil
  cachedLevelUpList = nil
end

return MiniGameSkillChoiceWindow
