require("ActivityDungeon1013_MiniExplain2WindowByName")
local Activity13CarGameExplainWindow = {}
local uis, contentPane, closeCallback

function Activity13CarGameExplainWindow.ReInitData()
end

function Activity13CarGameExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13CarGameExplainWindow.package, WinResConfig.Activity13CarGameExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniExplain2WindowUis(contentPane)
    closeCallback = bridgeObj.argTable[1]
    Activity13CarGameExplainWindow.UpdateInfo()
    Activity13CarGameExplainWindow.InitBtn()
  end)
end

function Activity13CarGameExplainWindow.UpdateInfo()
  Activity13CarGameExplainWindow.ShowListWord(uis.Main.Tips.Word1, T(1991), T(1992))
  Activity13CarGameExplainWindow.ShowListWord(uis.Main.Tips.Word2, T(1993), T(1994))
  Activity13CarGameExplainWindow.ShowListWord(uis.Main.Tips.Word3, T(1995), T(1996))
end

function Activity13CarGameExplainWindow.ShowListWord(root, word1, word2)
  root.Word1Txt.text = word1
  
  function root.WordList.itemRenderer(i, item)
    UIUtil.SetText(item, word2, "Word2Txt")
  end
  
  root.WordList.numItems = 1
end

function Activity13CarGameExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13CarGameExplainWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13CarGameExplainWindow.name)
  end)
end

function Activity13CarGameExplainWindow.OnClose()
  uis = nil
  contentPane = nil
  if closeCallback then
    closeCallback()
    closeCallback = nil
  end
end

return Activity13CarGameExplainWindow
