require("ActivityDungeon1015_MiniSetWindowByName")
local Activity15MiniSetWindow = {}
local uis, contentPane

function Activity15MiniSetWindow.ReInitData()
end

function Activity15MiniSetWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity15MiniSetWindow.package, WinResConfig.Activity15MiniSetWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1015_MiniSetWindowUis(contentPane)
    Activity15MiniSetWindow.UpdateInfo()
    Activity15MiniSetWindow.InitBtn()
  end)
end

function Activity15MiniSetWindow.UpdateInfo()
  uis.Main.Tips.TitleTxt.text = T(2040)
  uis.Main.Tips.ChoiceBtn.onClick:Set(function()
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY15_GAME_SETTER_INDEX, uis.Main.Tips.ChoiceBtn.selected and 0 or 1)
  end)
end

function Activity15MiniSetWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity15MiniSetWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity15MiniSetWindow.name)
  end)
end

function Activity15MiniSetWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity15MiniSetWindow
