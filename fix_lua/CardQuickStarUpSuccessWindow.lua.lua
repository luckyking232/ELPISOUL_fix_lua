require("Card_QuickStarUpSuccessWindowByName")
local CardQuickStarUpSuccessWindow = {}
local uis, contentPane, lastInfo, callback

function CardQuickStarUpSuccessWindow.ReInitData()
end

function CardQuickStarUpSuccessWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardQuickStarUpSuccessWindow.package, WinResConfig.CardQuickStarUpSuccessWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_QuickStarUpSuccessWindowUis(contentPane)
    lastInfo = bridgeObj.argTable[1]
    callback = bridgeObj.argTable[2]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CARD_AWAKE)
    CardQuickStarUpSuccessWindow.UpdateInfo()
    CardQuickStarUpSuccessWindow.InitBtn()
  end)
end

function CardQuickStarUpSuccessWindow.UpdateInfo()
  if lastInfo then
    local skillList = uis.Main.InfoList
    local cardConfig = TableData.GetConfig(lastInfo.cardId, "BaseCard")
    local cardInfo = CardData.GetCardDataById(lastInfo.cardId)
    local unlockSkillList = {}
    for i = 1, #cardConfig.unlock_skill_ids do
      if i > lastInfo.grade and cardInfo.skill2Level[cardConfig.unlock_skill_ids[i]] then
        table.insert(unlockSkillList, {
          id = cardConfig.unlock_skill_ids[i],
          star = i
        })
      end
    end
    
    function skillList.itemRenderer(i, item)
      local skillConfig = TableData.GetConfig(unlockSkillList[i + 1].id, "BaseSkill")
      item:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
      if skillConfig.name then
        UIUtil.SetText(item, skillConfig.name(), "NameTxt")
      end
      UIUtil.SetText(item, unlockSkillList[i + 1].star, "NumberTxt")
      UIUtil.SetText(item, T(2019), "OpenTxt")
      local curSkillLevel = cardInfo and cardInfo.skill2Level[skillConfig.id] and cardInfo.skill2Level[skillConfig.id] or 1
      local skillLevelUpConfig = TableData.GetConfig(skillConfig.id * 1000 + curSkillLevel, "BaseSkillLevelUp")
      local wordList = item:GetChild("WordList")
      
      function wordList.itemRenderer(index, word)
        word:GetChild("WordTxt").text = skillLevelUpConfig.des()
      end
      
      wordList.numItems = 1
    end
    
    skillList.numItems = #unlockSkillList
  end
end

function CardQuickStarUpSuccessWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    if callback then
      callback()
      callback = nil
    end
    UIMgr:CloseWindow(WinResConfig.CardQuickStarUpSuccessWindow.name)
  end)
end

function CardQuickStarUpSuccessWindow.OnClose()
  uis = nil
  contentPane = nil
  lastInfo = nil
  callback = nil
end

return CardQuickStarUpSuccessWindow
