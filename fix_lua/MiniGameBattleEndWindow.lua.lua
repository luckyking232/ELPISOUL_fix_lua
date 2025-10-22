require("ActivityDungeon1017Battle_BattleEndWindowByName")
local MiniGameBattleEndWindow = {}
local uis, contentPane, param

function MiniGameBattleEndWindow.ReInitData()
end

function MiniGameBattleEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MiniGameBattleEndWindow.package, WinResConfig.MiniGameBattleEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    MiniGameBattleMgr.CloseBattle()
    MiniGameBattleBackground.Clear()
    uis = GetActivityDungeon1017Battle_BattleEndWindowUis(contentPane)
    param = bridgeObj.argTable[1]
    MiniGameBattleEndWindow.UpdateInfo()
    MiniGameBattleEndWindow.InitBtn()
  end)
end

function MiniGameBattleEndWindow.UpdateInfo()
  if param.isBattleWin then
    uis.Main.TitleTxt.text = T(11919)
  elseif param.isBattleLoss then
    uis.Main.TitleTxt.text = T(11920)
  else
    uis.Main.TitleTxt.text = T(11905)
  end
  uis.Main.Info1.WordTxt.text = T(11906)
  uis.Main.Info1.NumberTxt.text = param.wave
  uis.Main.Info2.WordTxt.text = T(11907)
  uis.Main.Info2.NumberTxt.text = param.killCount
end

function MiniGameBattleEndWindow.InitBtn()
  UIUtil.SetBtnText(uis.Main.EndBtn, T(11908))
  uis.Main.EndBtn.onClick:Add(MiniGameBattleEndWindow.TouchClose)
end

function MiniGameBattleEndWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.MiniGameBattleEndWindow.name)
end

function MiniGameBattleEndWindow.OnClose()
  SoundUtil.PlayLastMusic()
  uis = nil
  contentPane = nil
  param = nil
end

return MiniGameBattleEndWindow
