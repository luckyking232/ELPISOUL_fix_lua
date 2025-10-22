require("Raffle01_ExplainTipsWindowByName")
local RaffleExplainTipsWindow = {}
local uis, contentPane

function RaffleExplainTipsWindow.ReInitData()
end

function RaffleExplainTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaffleExplainTipsWindow.package, WinResConfig.RaffleExplainTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaffle01_ExplainTipsWindowUis(contentPane)
    RaffleExplainTipsWindow.UpdateInfo()
    RaffleExplainTipsWindow.InitBtn()
  end)
end

function RaffleExplainTipsWindow.UpdateInfo()
  local tips = uis.Main.ExplainTips
  tips.TitleTxt.text = T(2100)
  tips.Tips.TitleTxt.text = T(2101)
  local data = TableData.GetConfig(FEATURE_ENUM.RAFFLE_GIFT, "BaseFeature")
  
  function tips.Tips.ContentList.itemRenderer(i, item)
    UIUtil.SetText(item, T(data.rule_des[1]), "WordTxt")
    local wordList = item:GetChild("WordList")
    
    function wordList.itemRenderer(index, word)
      UIUtil.SetText(word, T(data.rule_des[index + 2]), "WordTxt")
    end
    
    wordList.numItems = #data.rule_des - 1
    wordList:ResizeToFit()
  end
  
  tips.Tips.ContentList.numItems = 1
end

function RaffleExplainTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RaffleExplainTipsWindow.name)
  end)
end

function RaffleExplainTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RaffleExplainTipsWindow
