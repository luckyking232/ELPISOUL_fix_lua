require("ActivityDungeon1017Battle_BattlePauseWindowByName")
local MiniGameBattlePauseWindow = {}
local uis, contentPane

function MiniGameBattlePauseWindow.ReInitData()
end

function MiniGameBattlePauseWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MiniGameBattlePauseWindow.package, WinResConfig.MiniGameBattlePauseWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017Battle_BattlePauseWindowUis(contentPane)
    MiniGameBattlePauseWindow.UpdateInfo()
    MiniGameBattlePauseWindow.InitBtn()
  end)
end

function MiniGameBattlePauseWindow.UpdateInfo()
  uis.Main.TitleTxt.text = T(11911)
  uis.Main.WordTxt.text = T(11912)
end

function MiniGameBattlePauseWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(MiniGameBattlePauseWindow.TouchClose)
end

function MiniGameBattlePauseWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.MiniGameBattlePauseWindow.name)
  MiniGameBattleControl.Continue()
end

function MiniGameBattlePauseWindow.OnClose()
  uis = nil
  contentPane = nil
end

return MiniGameBattlePauseWindow
