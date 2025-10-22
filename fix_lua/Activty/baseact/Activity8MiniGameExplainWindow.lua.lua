require("ActivityDungeon1007_MiniExplainWindowByName")
local Activity8MiniGameExplainWindow = {}
local uis, contentPane

function Activity8MiniGameExplainWindow.ReInitData()
end

function Activity8MiniGameExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity8MiniGameExplainWindow.package, WinResConfig.Activity8MiniGameExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1007_MiniExplainWindowUis(contentPane)
    Activity8MiniGameExplainWindow.UpdateInfo()
    Activity8MiniGameExplainWindow.InitBtn()
  end)
end

function Activity8MiniGameExplainWindow.UpdateInfo()
  function uis.Main.Tips.Word1List.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, T(20645), "WordTxt")
  end
  
  function uis.Main.Tips.Word2List.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, T(20646), "WordTxt")
  end
  
  function uis.Main.Tips.Word3List.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, T(20647), "WordTxt")
  end
  
  uis.Main.Tips.Word1List.numItems = 1
  uis.Main.Tips.Word2List.numItems = 1
  uis.Main.Tips.Word3List.numItems = 1
end

function Activity8MiniGameExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity8MiniGameExplainWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity8MiniGameExplainWindow.name)
  end)
end

function Activity8MiniGameExplainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity8MiniGameExplainWindow
