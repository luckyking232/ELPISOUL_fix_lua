require("ActivityDungeon1011_MiniExplainWindowByName")
local Activity11MiniGameExplainWindow = {}
local uis, contentPane

function Activity11MiniGameExplainWindow.ReInitData()
end

function Activity11MiniGameExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity11MiniGameExplainWindow.package, WinResConfig.Activity11MiniGameExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1011_MiniExplainWindowUis(contentPane)
    Activity11MiniGameExplainWindow.UpdateInfo()
    Activity11MiniGameExplainWindow.InitBtn()
  end)
end

function Activity11MiniGameExplainWindow.UpdateInfo()
  local list = uis.Main.Tips.ContentList
  
  function list.itemRenderer(i, gcmp)
    ChangeUIController(gcmp, "c2", i)
    ChangeUIController(gcmp, "c1", i < 8 and 0 or 1)
    local wlist = gcmp:GetChild("WordList")
    local desId = 20661 + i
    local nameId = 20670 + i
    
    function wlist.itemRenderer(_, subgcmp)
      UIUtil.SetText(subgcmp, T(desId), "Word2Txt")
      UIUtil.SetText(subgcmp, T(nameId), "Word1Txt")
    end
    
    wlist.numItems = 1
  end
  
  list.numItems = 9
end

function Activity11MiniGameExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity11MiniGameExplainWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity11MiniGameExplainWindow.name)
  end)
end

function Activity11MiniGameExplainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity11MiniGameExplainWindow
