require("ActivityDungeon1019_MiniStart_EndRewardWindowByName")
local Activity19MiniGameSubmitWindow = {}
local uis, contentPane
local gameId = 70441024
local score, newRecord

function Activity19MiniGameSubmitWindow.ReInitData()
end

function Activity19MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity19MiniGameSubmitWindow.package, WinResConfig.Activity19MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1019_MiniStart_EndRewardWindowUis(contentPane)
    score = bridgeObj.argTable[1]
    newRecord = bridgeObj.argTable[2]
    Activity19MiniGameSubmitWindow.UpdateInfo()
    Activity19MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity19MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local titleTxt = T(20850)
  local descTxt = T(20848)
  if newRecord then
    descTxt = T(20849)
  end
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.WordTxt.text = descTxt
  uis.Main.Word1Txt.text = score
  uis.Main.TitleTxt.text = titleTxt
end

function Activity19MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity19MiniGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity19MiniGameWindow.name, WindowMsgEnum.Activity19_MiniGame.RESET)
    UIMgr:CloseWindow(WinResConfig.Activity19MiniGameSubmitWindow.name)
  end)
end

function Activity19MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity19MiniGameSubmitWindow
