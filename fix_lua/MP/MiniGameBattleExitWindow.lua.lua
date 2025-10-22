require("ActivityDungeon1017Battle_BattleExitWindowByName")
local MiniGameBattleExitWindow = {}
local uis, contentPane

function MiniGameBattleExitWindow.ReInitData()
end

function MiniGameBattleExitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MiniGameBattleExitWindow.package, WinResConfig.MiniGameBattleExitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017Battle_BattleExitWindowUis(contentPane)
    MiniGameBattleExitWindow.UpdateInfo()
    MiniGameBattleExitWindow.InitBtn()
  end)
end

function MiniGameBattleExitWindow.UpdateInfo()
  uis.Main.TitleTxt.text = T(11913)
  uis.Main.WordTxt.text = T(11914)
  UIUtil.SetBtnText(uis.Main.CancelBtn, T(10247))
  UIUtil.SetBtnText(uis.Main.ExitBtn, T(10244))
end

function MiniGameBattleExitWindow.InitBtn()
  uis.Main.CancelBtn.onClick:Add(MiniGameBattleExitWindow.TouchClose)
  uis.Main.ExitBtn.onClick:Add(MiniGameBattleExitWindow.TouchCloseBattle)
end

function MiniGameBattleExitWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.MiniGameBattleExitWindow.name)
  MiniGameBattleControl.Continue()
end

function MiniGameBattleExitWindow.TouchCloseBattle()
  MiniGameBattleMgr.CloseBattle()
end

function MiniGameBattleExitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return MiniGameBattleExitWindow
