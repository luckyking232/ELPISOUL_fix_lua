require("ActivityDungeon1017_MiniGameChoice2_InfoSkillWindowByName")
local Activity17MiniGameChoice2_InfoSkillWindow = {}
local uis, contentPane, cardId, stageId

function Activity17MiniGameChoice2_InfoSkillWindow.ReInitData()
end

function Activity17MiniGameChoice2_InfoSkillWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17MiniGameChoice2_InfoSkillWindow.package, WinResConfig.Activity17MiniGameChoice2_InfoSkillWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_MiniGameChoice2_InfoSkillWindowUis(contentPane)
    cardId = bridgeObj.argTable[1]
    stageId = bridgeObj.argTable[2]
    Activity17MiniGameChoice2_InfoSkillWindow.UpdateInfo()
    Activity17MiniGameChoice2_InfoSkillWindow.InitBtn()
  end)
end

function Activity17MiniGameChoice2_InfoSkillWindow.UpdateInfo()
  local unlockStage
  local stageTable = TableData.GetTable("BaseShootStage")
  for _, stage in pairs(stageTable) do
    if table.contain(stage.card_id, cardId) then
      if unlockStage then
        unlockStage = math.min(unlockStage, stage.id)
      else
        unlockStage = stage.id
      end
    end
  end
  local cardConfig = TableData.GetConfig(cardId, "BaseShootCard")
  if unlockStage and unlockStage > stageId then
    uis.Main.Info.Lock.WordTxt.text = T(11921, unlockStage % 100, cardConfig.name())
  else
    uis.Main.Info.Lock.WordTxt.text = T(11922, cardConfig.name())
  end
  local skillList = {
    {
      skillId = cardConfig.normal_skill,
      skillIdExt = cardConfig.normal_skill_ext
    },
    {
      skillId = cardConfig.special_skill,
      skillIdExt = cardConfig.special_skill_ext
    },
    {
      skillId = cardConfig.talent_skill,
      skillIdExt = cardConfig.talent_skill_ext
    }
  }
  local list = uis.Main.Info.InfoList
  
  function list.itemRenderer(index, comp)
    local skillInfo = skillList[index + 1]
    local skillBaseConfig = TableData.GetConfig(skillInfo.skillId, "BaseShootSkill")
    comp:GetChild("PicLoader").url = UIUtil.GetResUrl(skillBaseConfig.icon_ui)
    comp:GetChild("NameTxt").text = skillBaseConfig.name()
    local infoList = comp:GetChild("InfoList")
    infoList:RemoveChildrenToPool()
    local skillInfoHand = infoList:AddItemFromPool()
    skillInfoHand:GetChild("WordTxt").text = skillBaseConfig.des()
    local extList = skillInfoHand:GetChild("InfoList")
    
    function extList.itemRenderer(extIndex, extComp)
      local exSkillId = skillInfo.skillIdExt[extIndex + 1]
      local exSkillConfig = TableData.GetConfig(exSkillId, "BaseShootSkill")
      extComp:GetChild("TitleTxt").text = T(11923)
      extComp:GetChild("WordTxt").text = exSkillConfig.des()
    end
    
    extList.numItems = #skillInfo.skillIdExt
  end
  
  list.numItems = #skillList
end

function Activity17MiniGameChoice2_InfoSkillWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(Activity17MiniGameChoice2_InfoSkillWindow.TouchClose)
  uis.Main.Info.CloseBtn.onClick:Add(Activity17MiniGameChoice2_InfoSkillWindow.TouchClose)
end

function Activity17MiniGameChoice2_InfoSkillWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.Activity17MiniGameChoice2_InfoSkillWindow.name)
  UIMgr:SendWindowMessage(WinResConfig.Activity17MiniGameChoice2Window.name, WindowMsgEnum.Activity17_MiniGameChoice2Window.RESET_SELECT_CARD)
end

function Activity17MiniGameChoice2_InfoSkillWindow.OnClose()
  uis = nil
  contentPane = nil
  cardId = nil
  stageId = nil
end

return Activity17MiniGameChoice2_InfoSkillWindow
