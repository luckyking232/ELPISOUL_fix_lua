require("ActivityDungeon1010_MiniExplainWindowByName")
local Activity10MiniExplainWindow = {}
local uis, contentPane, closeCallback

function Activity10MiniExplainWindow.ReInitData()
end

function Activity10MiniExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity10MiniExplainWindow.package, WinResConfig.Activity10MiniExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1010_MiniExplainWindowUis(contentPane)
    closeCallback = bridgeObj.argTable[1]
    Activity10MiniExplainWindow.UpdateInfo()
    Activity10MiniExplainWindow.InitBtn()
  end)
end

function Activity10MiniExplainWindow.UpdateInfo()
  Activity10MiniExplainWindow.ShowListWord(uis.Main.Tips.Word1List, T(1903))
  Activity10MiniExplainWindow.ShowListWord(uis.Main.Tips.Word2List, T(1904))
  Activity10MiniExplainWindow.ShowListWord(uis.Main.Tips.Word3List, T(1905))
end

function Activity10MiniExplainWindow.ShowListWord(list, word)
  function list.itemRenderer(i, item)
    UIUtil.SetText(item, word, "WordTxt")
  end
  
  list.numItems = 1
end

function Activity10MiniExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity10MiniExplainWindow.name)
  end)
end

function Activity10MiniExplainWindow.OnClose()
  uis = nil
  contentPane = nil
  if closeCallback then
    closeCallback()
    closeCallback = nil
  end
end

return Activity10MiniExplainWindow
